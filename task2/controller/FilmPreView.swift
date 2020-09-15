//
//  FilmPreView.swift
//  task2
//
//  Created by MAK on 3/4/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import Cosmos
import TinyConstraints

class FilmPreViewVc: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var filmType: UILabel!
    @IBOutlet weak var starRate: CosmosView!
    var dataBaseFilm = dataBaseFilmData()
    var filmName : String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gitDataFromDb(dataBase: dataBaseFilm)
    }
    
    func gitDataFromDb(dataBase:dataBaseFilmData){
        do{
            let  allData = try dataBase.DataBase.prepare(dataBase.table)
            for data in allData{
                
                if filmName  == data[dataBase.title]{
                    descriptionLabel.text = data[dataBase.title]
                    filmType.text = data[dataBase.filmType]
                    starRate.rating = data[dataBase.rateStar]
                    break
                }
            }
        }catch{
            print(error.localizedDescription)
        }
    }
    
    
    
}
