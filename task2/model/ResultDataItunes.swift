//
//  ItunesData.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation


struct ResultArrayApi : Decodable{
    var artistName : String?
    var trackName : String?
    var artworkUrl100 : String?
    var previewUrl : String?
    var longDescription : String?
    
}
