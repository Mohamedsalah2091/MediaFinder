//
//  SignUpSQL.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import SQLite

extension SignupVC{
    
    func saveDatainUserDefult(){
        signupUserData.name = self.name.text!
        signupUserData.email = self.email.text!
        signupUserData.password = self.password.text!
        signupUserData.sex = gender.titleForSegment(at: gender.selectedSegmentIndex)!
        
        let insertData = DataBaseManager.usersDB.table.insert(DataBaseManager.usersDB.name <- signupUserData.name , DataBaseManager.usersDB.email <- signupUserData.email,DataBaseManager.usersDB.password <- signupUserData.password,DataBaseManager.usersDB.sex <- signupUserData.sex  )
        do{
            try DataBaseManager.usersDB.DataBase.run(insertData)
            DataBaseManager.usersDB.allUsres = DataBaseManager.shared().gitDataFromDB(dataBase: DataBaseManager.usersDB)
        }catch{
            createAlert("Error","Error in data save")
        }
        
    }
    
}
