//
//  ItunesData.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation

struct ItunesData:Decodable {
    var resultCount :Int = 0
    var results = [ResultArrayApi]()
}
