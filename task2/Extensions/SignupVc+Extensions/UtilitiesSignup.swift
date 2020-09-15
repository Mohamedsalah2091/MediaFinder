//
//  SignupVC+Extension.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import UIKit
import SQLite

extension SignupVC {
    
    
    // MARK: - Style
    
    func style(){
        
        screenH = 42.021
        screenW = ScreenDimension.ScreenWidth() * 0.89
        
        Style.Button(buttons: [signupBt] , height: screenH, width: screenW, setTitle: ["Sign up"],titleFount: UIFont.systemFont(ofSize: 20.0) ,cornerRadius: 20, tintColor:#colorLiteral(red: 0.9637527083, green: 1, blue: 0.8347495298, alpha: 1), backgroundColor: #colorLiteral(red: 0.9578243972, green: 0.5556590623, blue: 0.01232367121, alpha: 1), shadowOpacity: 5, shadowRadius: 5, CornerRadius: 20)
    }
    
    // MARK: - Validation Cheeking
    
    func validateEmail(enteredEmail:String) -> Bool {
        
        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        if !emailPredicate.evaluate(with: enteredEmail){
            let myalert = alert.alert()
            myalert.image = #imageLiteral(resourceName: "wrong.png")
            myalert.massage = "Invalid Email"
            present(myalert,animated: true)
            
            return false
        }
        return true
        
    }
    public func isValidPassword(password:String , confirmPassword : String ) -> Bool {
        let myalert = alert.alert()
        myalert.image = #imageLiteral(resourceName: "wrong.png")
        if password != confirmPassword{
            myalert.massage = "password not match ConfirmPassword"
            present(myalert,animated: true)
            return false
        }else{
            let passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])[0-9a-zA-Z!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$"
            if !NSPredicate(format: "SELF MATCHES %@", passwordRegex).evaluate(with: password){
                myalert.massage = """
                Password must Have
                eight items
                Numbers
                Character (at lest one uppercase and lowercase)
                Semble as (!@#$%^&*()\\-_=+{}|?>.<,:;~`’]{8,}$)
                """
                present(myalert,animated: true)
                
                return false
            }
        }
        
        return true
        
    }
    
    // MARK: - Alert
    
    func createAlert(_ title : String , _ message: String ){
        
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.signupBt.setTitle("Sign Up", for: .normal)
        }
        )
        alert.addAction(action)
        present(alert , animated: true ,completion: nil )
        
    }
    
}
