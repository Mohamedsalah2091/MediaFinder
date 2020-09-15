//
//  TextSearchMediaSearch.swift
//  task2
//
//  Created by MAK on 4/4/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
extension MediaSearchVc {
    
    func preparingTextSearch(){
        textSearch.filterStrings(wordsLastSearchNewAdded)
        textSearch.theme.font = UIFont.systemFont(ofSize: 20)
        textSearch.theme.bgColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.8)
        textSearch.theme.borderColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 1)
        textSearch.theme.separatorColor = UIColor (red: 0.9, green: 0.9, blue: 0.9, alpha: 0.5)
        textSearch.theme.cellHeight = 50
        textSearch.comparisonOptions = [.caseInsensitive]
    }
    
}
