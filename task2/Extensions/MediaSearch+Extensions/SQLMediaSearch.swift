//
//  SQLMediaSearch.swift
//  task2
//
//  Created by MAK on 4/4/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import SQLite

extension MediaSearchVc {
    
    func preparingSQL(){
        DataBaseManager.dataBaseLastSearch = DataBaseManager.shared().CreatDataBase(file: "LastSearch0", type: 3) as! filmLastSearchData
        DataBaseManager.dataBaseLastSearchWords = DataBaseManager.shared().CreatDataBase(file: "SearchWords2", type: 4) as! filmLastSearchWords
    }
    
    func lastSearchReload(){
        do{
            let  allData = try DataBaseManager.dataBaseLastSearch.DataBase.prepare(DataBaseManager.dataBaseLastSearch.table)
            for user in allData{
                if dataOfLoginUser.id == user[DataBaseManager.dataBaseLastSearch.userid] {
                    data.trackName = "\(user[DataBaseManager.dataBaseLastSearch.trackName])"
                    data.artistName = "\(user[DataBaseManager.dataBaseLastSearch.artistName])"
                    data.artworkUrl100 = "\(user[DataBaseManager.dataBaseLastSearch.artworkUrl100])"
                    data.longDescription = "\(user[DataBaseManager.dataBaseLastSearch.longDescription])"
                    data.previewUrl = "\(user[DataBaseManager.dataBaseLastSearch.previewUrl])"
                    itunesDataArr.results.append(data)
                }
                
            }
        }catch{
            print("Erorr in Function lastSearchReload in MediaSearchVc SQL ")
            print(error.localizedDescription)
        }
    }
    
    func saveSearchResults(){
        deleteOldSearshResults()
        for index in itunesDataArr.results{
            let insertData = DataBaseManager.dataBaseLastSearch.table.insert(
                DataBaseManager.dataBaseLastSearch.userid <- dataOfLoginUser.id ,
                DataBaseManager.dataBaseLastSearch.artistName <- index.artistName! ,
                DataBaseManager.dataBaseLastSearch.artworkUrl100 <- index.artworkUrl100! ,
                DataBaseManager.dataBaseLastSearch.longDescription <- index.longDescription ?? "",
                DataBaseManager.dataBaseLastSearch.previewUrl <- index.previewUrl ?? "",
                DataBaseManager.dataBaseLastSearch.trackName <- index.trackName!
            )
            do{
                try DataBaseManager.dataBaseLastSearch.DataBase.run(insertData)
            }catch{
                print("Erorr in Function saveSearchResults in MediaSearchVc SQL ")
                print(error.localizedDescription)
            }
        }
    }
    
    func deleteOldSearshResults(){
        let alice = DataBaseManager.dataBaseLastSearch.table.filter(DataBaseManager.dataBaseLastSearch.userid == dataOfLoginUser.id)
        do{
            try DataBaseManager.dataBaseLastSearch.DataBase.run(alice.delete())
        }catch{
            print("Erorr in Function deleteOldSearshResults in MediaSearchVc SQL ")
            print(error.localizedDescription)
        }
    }
    
    
    func loadLastSearchWords(){
        do{
            for user in try DataBaseManager.dataBaseLastSearchWords.DataBase.prepare(DataBaseManager.dataBaseLastSearchWords.table){
                print(user[DataBaseManager.dataBaseLastSearchWords.userid])
                if user[DataBaseManager.dataBaseLastSearchWords.userid] == dataOfLoginUser.id{
                    wordsLastSearchNewAdded.append("\(user[DataBaseManager.dataBaseLastSearchWords.words])")
                }
                print(wordsLastSearchNewAdded)
            }
        }catch{
            print("Erorr in Function loadLastSearchWords in MediaSearchVc SQL ")
            print(error.localizedDescription)
        }
        
    }
    
    func saveLastSearchWords(){
        for item in wordsLastSearchNewAdded{
            let insertData = DataBaseManager.dataBaseLastSearchWords.table.insert(
                DataBaseManager.dataBaseLastSearchWords.userid <- dataOfLoginUser.id ,
                DataBaseManager.dataBaseLastSearchWords.words <- item
            )
            print(insertData)
            do{
                try DataBaseManager.dataBaseLastSearchWords.DataBase.run(insertData)
            }catch{
                print("Erorr in Function saveLastSearchWords in MediaSearchVc SQL ")
                print(error.localizedDescription)
            }
        }
    }
    
}
