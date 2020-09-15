//
//  searchInItunes+Extension.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import Alamofire
import Kingfisher

extension MediaSearchVc {
    
    func preparingTableView(){
        mediaTable.rowHeight = UITableView.automaticDimension
        mediaTable.estimatedRowHeight = 1
        mediaTable.dataSource = self
        mediaTable.delegate = self
    }
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itunesDataArr.results.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "iTunesCell", for: indexPath) as! MediaSearchCell
        
        cell.artistName.text =  "Artist Name :"
        cell.artistName.text! += itunesDataArr.results[indexPath.row].artistName!
        if itunesDataArr.results[indexPath.row].artworkUrl100 != "" {    cell.cellImage.kf.setImage(with:URL(string:itunesDataArr.results[indexPath.row].artworkUrl100!))
        }
        //filmDescription
        
        cell.filmDescription.text = itunesDataArr.results[indexPath.row].longDescription ?? ""
        cell.trackName.text =  "Track Name :"
        cell.trackName.text! += itunesDataArr.results[indexPath.row].trackName ?? ""
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if itunesDataArr.results[indexPath.row].previewUrl != "" && itunesDataArr.results[indexPath.row].previewUrl != nil{
            let Storyboard = UIStoryboard(name: "Main",bundle: nil)
            let webVc = Storyboard.instantiateViewController(withIdentifier: "WebViewVc" ) as! FilmScreeningVc
            webVc.Url = itunesDataArr.results[indexPath.row].previewUrl
            self.present(webVc, animated: true, completion: nil)
        }else {
            CreateAlert.myAlert.showAlert(image: #imageLiteral(resourceName: "warning-png"), message:"No Any Media type Display", view: view)
        }
        
        
        
    }
    
    func cheekText(text : String) -> String {
        var item = ""
        for i in text{
            if (i != " "){
                item += String(i)
            }
        }
        return item
    }
    
    
}
