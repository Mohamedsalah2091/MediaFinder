//
//  LogInSQL.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import SQLite
extension LoginVC  {
    
    
    //  Cheek Data in Data Base
    func cheekUserInDataBase(UserData:[User])->(Bool,User?){
        for user in UserData
        {
            print(user)
            if user.email == emailTextField.text && user.password == passwordTextField.text{
                updataLoginState(id: Int(user.id))
                return (true,user)
            }
        }
        return (false,nil)
    }
    
    // Updata Login State in DB
    
    func updataLoginState(id:Int){
        
        let ud = self.userInformationDB.table.filter( self.userInformationDB.id == id )
        let UpdataData = ud.update(self.userInformationDB.Login <- true )
        do{
            try self.userInformationDB.DataBase.run(UpdataData)
        }catch{
            print(error.localizedDescription)
        }
        
    }
    
}
