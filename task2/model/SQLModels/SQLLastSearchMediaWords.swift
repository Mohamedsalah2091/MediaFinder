//
//  SQLLastSearchWords.swift
//  task2
//
//  Created by MAK on 4/4/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite

struct filmLastSearchWords{
    
    var DataBase : Connection!
    let table = Table("LastSearchWords1")
    
    let userid = Expression<Int>("id")
    let words = Expression<String>("words")
    
}

