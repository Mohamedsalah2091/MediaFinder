//
//  addNewItemInCellViewController.swift
//  task2
//
//  Created by MAK on 2/23/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite
import Cosmos
import TinyConstraints

protocol sendingDataFromNewCellToUseFilms {
    
    func dataFromNewCellToUseFilms(imagesContaner :[UIImage] )
    
}
class AddNewFilmVc: UIViewController {
    
    // MARK: - Variable
    
    // UiView Variable
    
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField:  UITextField!
    @IBOutlet weak var rateStares: CosmosView!
    @IBOutlet weak var addImageButton: UIButton!
    @IBOutlet weak var addItemButton: UIButton!
    @IBOutlet weak var filmType: UISegmentedControl!
    
    
    // Variable
    var imagePicker = UIImagePickerController()
    var filmTypes = ["Action","Comedies","Romantic"]
    var screenH = ScreenDimension.ScreenHeight() * 0.04
    var screenW = ScreenDimension.ScreenWidth() * 0.89
    var filmRating = 0.0
    var imagesContaner = [UIImage]()
    var filmId : Int!
    var dataOfLoginUser = User()
    var delegate: sendingDataFromNewCellToUseFilms?
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageItem.image = #imageLiteral(resourceName: "add-image")
        preparingImagePicker()
        preparingSQL()
        preparingStyle()
        preparingRateStares()
        
    }
    
    
    func preparingStyle(){
        Style.Button(buttons: [addItemButton] , height: 42, width: screenW, setTitle: ["Add"],titleFount: UIFont.systemFont(ofSize: 20.0) ,cornerRadius: 20, tintColor:#colorLiteral(red: 0.9637527083, green: 1, blue: 0.8347495298, alpha: 1), backgroundColor: #colorLiteral(red: 0.9578243972, green: 0.5556590623, blue: 0.01232367121, alpha: 1), shadowOpacity: 5, shadowRadius: 5, CornerRadius: 20)
    }
    
    func preparingRateStares(){
        rateStares.didTouchCosmos = {rating in
            self.filmRating = rating
        }
    }
    
    
    // MARK: - Button Functions
    
    @IBAction func pressAddImageButton(_ sender: Any) {
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = true
        present(imagePicker,animated: true , completion: nil)
    }
    
    @IBAction func pressAddItemButton(_ sender: Any) {
        if dataValidations( name: nameTextField.text ?? "" , description: descriptionTextField.text ?? "") {
            SqlSaveDatain(title: nameTextField.text!, description: descriptionTextField.text!)
            delegate?.dataFromNewCellToUseFilms(imagesContaner: imagesContaner)
            CreateAlert.myAlert.showAlert(image: #imageLiteral(resourceName: "saveIcon"), message: "Film is Saved", view: view)
            CreateAlert.myAlert.delayForSeconds(delay: 5.5) {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    func dataValidations(name : String , description :String  ) -> Bool {
        var returnValue = true
        var cheekName : Bool = false
        var cheekDescription : Bool = false
        for  item in name{
            if item != " "{
                cheekName = true
            }
        }
        for  item in description{
            if item != " "{
                cheekDescription = true
            }
        }
        if !cheekName || name == ""{
            CreateAlert.myAlert.showAlert(image: #imageLiteral(resourceName: "warning-png"), message:((name != "") ? "Invalid Name" :"Inter your Name" ), view: view)
            returnValue = !returnValue
        }
        else if !cheekDescription || description == ""{
            CreateAlert.myAlert.showAlert(image: #imageLiteral(resourceName: "warning-png"),message:((description != "") ? "Invalid Description" :"Inter your description" ), view: view)
            returnValue = !returnValue
        }
        return returnValue
    }
    
    
    
}

