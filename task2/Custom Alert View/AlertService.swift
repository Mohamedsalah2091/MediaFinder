//
//  AlertService.swift
//  To Do List
//
//  Created by MAK on 5/11/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

protocol SendData {
    func addNewData(date : String ,content : String )
}
class AlertService: UIViewController {
    
    
    var image : UIImage!
    var massage : String!

    @IBOutlet weak var massageImage: UIImageView!
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var alertView: UIView!
    @IBOutlet weak var massageText: UILabel!
    
    
    var delegate: SendData?
    override func viewDidLoad() {
        super.viewDidLoad()
        doneButton.layer.cornerRadius = 10
        alertView.layer.cornerRadius = 15
        massageImage.image = image
        massageText.text = massage
    }
    
    @IBAction func pressSaveButton(_ sender: Any) {
        dismiss(animated: true)
    }
    

   
    
    
}
