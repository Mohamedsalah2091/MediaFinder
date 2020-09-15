//
//  UsreDataVc+Extension.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import UIKit
import SQLite


extension UserCollectionsVc : sendingDataFromNewCellToUseFilms{
    
    // MARK: - Protocole
    
    func dataFromNewCellToUseFilms(imagesContaner: [UIImage]) {
        self.imagesContaner = imagesContaner
        filmId = 1
        userInformation = retrieveData()
        filmTableView.reloadData()
    }
    
    // MARK: - Style
    
    func style(){
        let  screenH = 42.021
        let  screenW = ScreenDimension.ScreenWidth() * 1
        Style.Button(buttons: [backToProfileButton] , height: CGFloat(screenH), width: screenW, setTitle: ["Profile"],titleFount: UIFont.systemFont(ofSize: 20.0) ,cornerRadius: 20, tintColor:#colorLiteral(red: 0.9637527083, green: 1, blue: 0.8347495298, alpha: 1), backgroundColor: #colorLiteral(red: 0.9578243972, green: 0.5556590623, blue: 0.01232367121, alpha: 1), shadowOpacity: 5, shadowRadius: 5, CornerRadius: 20)
    }
    
    // MARK: - Create Alert
    
    func createAlert(title : String , message: String ){
        let  alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let  action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)})
        alert.addAction(action)
        self.present(alert , animated: true ,completion: nil)
    }
    
}
