//
//  ProfileVc.swift
//  task2
//
//  Created by MAK on 2/11/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite

class UserProfileVc: UIViewController {
    
    // MARK: - Variable
    
    var screenH : CGFloat!
    var screenW : CGFloat!
    var dataOfLoginUser = User()
    var fristScreenOrNot : Bool!
    var imagePicker = UIImagePickerController()
    // UIView Variable
    
    @IBOutlet weak var locationEnteringTextField: UITextField!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var emailLable: UILabel!
    @IBOutlet weak var goToMapButton: UIButton!
    @IBOutlet weak var logOutButton: UIButton!
    @IBOutlet weak var collectionViewDataForUser: UIButton!
    @IBOutlet weak var Serching: UIButton!
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparingLables()
        style()
        SetImage()
        
    }
    
    func preparingLables(){
        nameLable.text = dataOfLoginUser.name
        emailLable.text = dataOfLoginUser.email
    }
    // MARK: -  Button
    
    @IBAction func pressButtonGoToMap(_ sender: Any) {
        let s = UIStoryboard(name: "Main",bundle: nil)
        let sc = s.instantiateViewController(withIdentifier: Constans.MapViewVC ) as! MapViewVC
        sc.dataOfLoginUser = dataOfLoginUser
        sc.delegate = self
        present(sc, animated: true, completion: nil)
    }
    
    @IBAction func pressButtonGoToUserView(_ sender: Any) {
        let s = UIStoryboard(name: "Main",bundle: nil)
        let sc = s.instantiateViewController(withIdentifier:  Constans.UsreDataVc ) as! UserCollectionsVc
        sc.dataOfLoginUser = dataOfLoginUser
        present(sc, animated: true, completion: nil)
    }
    
    
    @IBAction func pressButtonLogOut(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func PressSerching(_ sender: Any) {
        let s = UIStoryboard(name: "Main",bundle: nil)
        let sc = s.instantiateViewController(withIdentifier:  "searchInItunes" ) as! MediaSearchVc
        sc.dataOfLoginUser = dataOfLoginUser
        present(sc, animated: true, completion: nil)
    }
    
    
    @IBAction func pressAddImageButton(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true , completion: nil)
    }
    
    
    
    
}

