//
//  sqlUserData.swift
//  task2
//
//  Created by MAK on 2/19/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite

struct filmSql{
    
    var DataBase : Connection!
    let table = Table("New")
    
    let id = Expression<Int>("id")
    
    let title = Expression<String>("title")
    
    let rateStar = Expression<Double>("rateStar")
    
    let filmId = Expression<Int>("filmId")
    
    let filmType = Expression<String>("filmType")
    
    let description = Expression<String>("description")
    
}
