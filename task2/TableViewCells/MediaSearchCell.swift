//
//  iTunesCellTableViewCell.swift
//  task2
//
//  Created by MAK on 3/15/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit

class MediaSearchCell : UITableViewCell {


    @IBOutlet weak var artistName: UILabel!
    @IBOutlet weak var cellImage: UIImageView!
    
    @IBOutlet weak var trackName: UILabel!
//    @IBOutlet weak var filmDescription: UILabel!
    
    @IBOutlet weak var filmDescription: UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }


    
}
