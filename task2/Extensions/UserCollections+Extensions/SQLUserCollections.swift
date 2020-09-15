//
//  UserDataSQL.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import SQLite

extension UserCollectionsVc{
    
    func preparingSQL(){
        DataBaseManager.filmDB = DataBaseManager.shared().CreatDataBase(file:Constans.dataBaseFilmTablesFileName, type: 2) as! filmSql
    }
    
    func retrieveData() -> [UserInformationData]{
        var allData = [UserInformationData]()
        var dt = UserInformationData()
        do{
            let  alldata = try DataBaseManager.filmDB.DataBase.prepare(DataBaseManager.filmDB.table)
            
            for data in alldata{
                
                if dataOfLoginUser.id == data[DataBaseManager.filmDB.id] {
                    dt.id = data[DataBaseManager.filmDB.id]
                    dt.tableViewTitle = data[DataBaseManager.filmDB.title]
                    dt.tableViewDescription = data[DataBaseManager.filmDB.description]
                    allData.append(dt)
                }
                
                filmId += 1
                
            }
            
        }catch{print(error.localizedDescription)}
        return allData
    }
    
    func SqlSaveDatain(title:String , description:String){
        
        let insertData = DataBaseManager.filmDB.table.insert(DataBaseManager.filmDB.id <- self.dataOfLoginUser.id ,
                                                             DataBaseManager.filmDB.title <- title ,  DataBaseManager.filmDB.description <- description  )
        do{
            try DataBaseManager.filmDB.DataBase.run(insertData)
        }catch{
            print(error.localizedDescription)
        }
        
    }
   
    
    // Cheek Data Of User
    func cheekDataOfUser(_ name:String , _ des:String){
        guard name != "" && des != "" else {
            createAlert(title: "Error No Item Add",message: "Pleas Enter The Name And a Description")
            return
        }
        SqlSaveDatain(title: name,description: des)
        var hr = UserInformationData()
        hr.id = dataOfLoginUser.id
        hr.tableViewDescription = des
        hr.tableViewTitle = name
        userInformation.append(hr)
        self.filmTableView.reloadData()
    }
    
}
