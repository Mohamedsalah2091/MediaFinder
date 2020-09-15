//
//  searchInItunes.swift
//  task2
//
//  Created by MAK on 3/15/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import SQLite
import SearchTextField

class MediaSearchVc : UIViewController ,UITableViewDataSource, UITableViewDelegate{
    
    
    @IBOutlet weak var selectedType: UISegmentedControl!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var mediaTable: UITableView!
    @IBOutlet weak var textSearch: SearchTextField!
    
    var lodingAnimation = LodingAnimation()
    var alert = AlertShow()
    var theTypies = ["musicVideo","tvShow","movie"]
    var wordsLastSearchLoaded = [String]()
    var wordsLastSearchNewAdded = [String]()
    var dataOfLoginUser = User()
    var itunesDataArr = ItunesData()
    var data = ResultArrayApi()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        preparingSQL()
        lastSearchReload()
        loadLastSearchWords()
        preparingTableView()
        preparingTextSearch()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        saveSearchResults()
        saveLastSearchWords()
    }
    
    @IBAction func pressButton(_ sender: Any) {
        lodingAnimation.starterCode(view: view)
        let myalert = self.alert.alert()
        if textSearch.text != "" &&  textSearch.text != nil{
            wordsLastSearchNewAdded.append(textSearch.text!)
            print(wordsLastSearchNewAdded)
            ApiItunes.loadItunesData(searchType: theTypies[selectedType.selectedSegmentIndex] , searchFor: textSearch.text!) { (erorr, itunesData) in
                if erorr != nil{
                    myalert.image = #imageLiteral(resourceName: "NoWifi")
                    myalert.massage = "No Internet Connection"
                    self.lodingAnimation.stopLoding()
                    self.present(myalert,animated: true)
                }else if itunesData == nil {
                    print(erorr!)
                    self.lodingAnimation.stopLoding()
                }else {
                    if itunesData?.results.isEmpty == true {
                        
                        myalert.image = #imageLiteral(resourceName: "noResult")
                        myalert.massage = "No Result"
                        self.present(myalert,animated: true)
                    }
                    self.itunesDataArr = itunesData!
                    self.mediaTable.reloadData()
                    self.lodingAnimation.stopLoding()
                }
            }
        }else{
            myalert.image = #imageLiteral(resourceName: "warning-png")
            myalert.massage = "Enter Actor Name"
            self.present(myalert,animated: true)
            lodingAnimation.stopLoding()
        }
        
    }
    
    
    
}


