//
//  SQLUserLastSearch.swift
//  task2
//
//  Created by MAK on 4/4/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite

struct filmLastSearchData{
    
    var DataBase : Connection!
    let table = Table("LastSearch")
    
    let userid = Expression<Int>("id")
    
    let artistName = Expression<String>("artistName")
    
    let trackName = Expression<String>("trackName")
    
    let artworkUrl100 = Expression<String>("artworkUrl100")
    
    let previewUrl = Expression<String>("previewUrl")
    
    let longDescription = Expression<String>("longDescription")
    
}
