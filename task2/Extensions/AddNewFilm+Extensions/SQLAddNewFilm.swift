//
//  SQLAddNewFilm.swift
//  task2
//
//  Created by MAK on 4/2/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import SQLite


extension AddNewFilmVc{
    
    func preparingSQL(){
        DataBaseManager.filmDB = DataBaseManager.shared().CreatDataBase(file: Constans.dataBaseFilmTablesFileName, type: 2) as! filmSql
    }
    
    func SqlSaveDatain(title: String, description:String) {
        let insertData = DataBaseManager.filmDB.table.insert(DataBaseManager.filmDB.id <- self.dataOfLoginUser.id , DataBaseManager.filmDB.title <- title ,  DataBaseManager.filmDB.description <- description ,DataBaseManager.filmDB.rateStar <- filmRating , DataBaseManager.filmDB.filmType <- filmTypes[filmType.selectedSegmentIndex] , DataBaseManager.filmDB.filmId <- filmId)
        do{
            try DataBaseManager.filmDB.DataBase.run(insertData)
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}
