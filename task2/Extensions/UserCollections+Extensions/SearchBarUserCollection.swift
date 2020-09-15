//
//  SearchBarUserCollection.swift
//  task2
//
//  Created by MAK on 4/4/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import UIKit

extension UserCollectionsVc{
    
    func  preparingSearchBar(){
        searchBar.delegate = self
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            userInformation = retrieveData()
        }
        if searchBar.text!.count > 0 {
            userInformationFilter = retrieveData()
            let key = searchHelper(searchitems: userInformationFilter, searchfor: searchBar.text!)
            userInformation = key
        }
        filmTableView.reloadData()
    }
    
    func searchHelper( searchitems:[UserInformationData] , searchfor:String ) -> [UserInformationData]{
        var retuenData = [UserInformationData]()
        for dataName in searchitems{
            
            if dataName.tableViewTitle.contains(searchfor.uppercased()) || dataName.tableViewTitle.contains(searchfor.lowercased()){
                retuenData.append(dataName)
            }
        }
        
        return retuenData
    }
    
}
