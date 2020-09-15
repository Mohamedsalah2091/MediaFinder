//
//  ViewController.swift
//  task2
//
//  Created by MAK on 2/8/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite
import RimhTypingLetters
class SignupVC: UIViewController  {
    
    // MARK: - Variable
    
    var signupUserData = User()
    var screenH : CGFloat!
    var screenW : CGFloat!
    var alert = AlertShow()
    //  UiView Variable
    
    @IBOutlet weak var signup: UILabel!
    @IBOutlet weak var gender: UISegmentedControl!
    @IBOutlet weak var signupBt: UIButton!
    
    @IBOutlet weak var confirmPassword: UITextField!
    @IBOutlet weak var name: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        signup.typeText("Sign Up" , typingSpeedPerChar: 0.3) {}
        style()
    }
    
    
    // Button
    
    @IBAction func pressSingupButton(_ sender: Any) {
        
        if  (validateEmail(enteredEmail: self.email.text!) && isValidPassword(password: self.password.text! , confirmPassword: self.confirmPassword.text!) &&  (self.password.text! == confirmPassword.text!) && name.text != "") {
            saveDatainUserDefult()
            
            signupBt.setTitle("Sign Up", for: .normal)
            if DataBaseManager.fristScreenOrNot == true {
                let Storyboard = UIStoryboard(name: "Main",bundle: nil)
                let loginVC = Storyboard.instantiateViewController(withIdentifier: Constans.LoginVCID ) as! LoginVC
                DataBaseManager.fristScreenOrNot = false
                self.present(loginVC, animated: true, completion: nil)
            }else {
                DataBaseManager.fristScreenOrNot = true
                
                self.dismiss(animated: true, completion: nil)
            }
        }else{
            let myalert = alert.alert()
            if name.text == ""{
                myalert.image = #imageLiteral(resourceName: "wrong.png")
                myalert.massage = "Enter your Name"
                present(myalert,animated: true)
            }
            
            
            signupBt.setTitle("Sign Up", for: .normal)
        }
        
    }
    
    @IBAction func pressSignIn(_ sender: Any) {
        if DataBaseManager.fristScreenOrNot == true {
            let Storyboard = UIStoryboard(name: "Main",bundle: nil)
            let loginVC = Storyboard.instantiateViewController(withIdentifier: Constans.LoginVCID ) as! LoginVC
            DataBaseManager.fristScreenOrNot = false
            self.present(loginVC, animated: true, completion: nil)
        }else {
            DataBaseManager.fristScreenOrNot = true
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    
    
}

