//
//  ProfileVc+Extension.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import UIKit

extension UserProfileVc:SendingLocationDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    // MARK: - Resving Data
    func dataUsreDataToProfile(dataOfLoginUser : User){
        self.dataOfLoginUser = dataOfLoginUser
        
    }
    
    func dataLocation(Location: String, dataOfLoginUser : User) {
        self.locationEnteringTextField.text = Location
        self.dataOfLoginUser = dataOfLoginUser
    }
    // MARK: - Style
    func SetImage(){
        if dataOfLoginUser.sex == "Male"{
            profileImage.image = #imageLiteral(resourceName: "male.jpg")
        }else {
            profileImage.image = #imageLiteral(resourceName: "female")
        }
        preparingImagePicker()
    }
    
    func preparingImagePicker(){
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.profileImage.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    
    
    
    
    
    
    
    
    func style(){
        screenH = 42.021
        screenW = ScreenDimension.ScreenWidth() * 0.89
        
        Style.Button(buttons: [logOutButton,collectionViewDataForUser , Serching] , height: screenH, width: screenW, setTitle: ["Log out","Your Collection" , "Searching"],titleFount: UIFont.systemFont(ofSize: 20.0) ,cornerRadius: 20, tintColor:#colorLiteral(red: 0.9637527083, green: 1, blue: 0.8347495298, alpha: 1), backgroundColor: #colorLiteral(red: 0.9578243972, green: 0.5556590623, blue: 0.01232367121, alpha: 1), shadowOpacity: 5, shadowRadius: 5, CornerRadius: 20)
        
        
    }
}
