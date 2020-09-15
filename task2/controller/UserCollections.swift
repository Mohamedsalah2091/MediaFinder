//
//  UsreDataTv.swift
//  task2
//
//  Created by MAK on 2/14/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite


class UserCollectionsVc: UIViewController ,UITableViewDataSource, UITableViewDelegate , UISearchBarDelegate{
    
    // MARK: - Variable
    var userInformation = [UserInformationData]()
    var userInformationFilter = [UserInformationData]()
    var dataOfLoginUser = User()
    var fristScreenOrNot : Bool!
    var imagesContaner = [UIImage]()
    var imageOfCell = [UIImage]()
    var addedDataName = [String]()
    var addedDataDescription = [String]()
    var filmId = 1
    
    //  UiView Variable
    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet weak var backToProfileButton: UIButton!
    @IBOutlet weak var filmTableView: UITableView!
    
    
    // MARK: - View Did Load
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        preparingSearchBar()
        preparingSQL()
        style()
        userInformation = retrieveData()
        userInformationFilter = userInformation
        preparingTableView()
        preparingTableViewCell()
        
    }
    // MARK: -  Button
    
    @IBAction func pressBackToProfileButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func AddNewItem(_ sender: Any) {
        let s = UIStoryboard(name: "Main",bundle: nil)
        let sc = s.instantiateViewController(withIdentifier:Constans.addNewItemInCellVc) as! AddNewFilmVc
        sc.dataOfLoginUser = dataOfLoginUser
        sc.filmId = filmId
        sc.delegate = self
        present(sc, animated: true, completion: nil)
        
    }
    
   
}
