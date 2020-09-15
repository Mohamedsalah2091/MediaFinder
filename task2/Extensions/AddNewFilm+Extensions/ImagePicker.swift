//
//  addItemCellVc+Extension.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation

import Cosmos
import TinyConstraints

extension AddNewFilmVc : UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    //: - Image Picker Controller
    func preparingImagePicker(){
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.imageItem.image = image
            self.imagesContaner.append(image)
        }
        dismiss(animated: true, completion: nil)
    }
}
