//
//  UserDataTableView.swift
//  task2
//
//  Created by MAK on 3/25/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import UIKit


extension UserCollectionsVc{
    
    func preparingTableView(){
        filmTableView.dataSource = self
        filmTableView.separatorStyle = .none
        filmTableView.delegate = self
        filmTableView.rowHeight = UITableView.automaticDimension
    }
    
    func preparingTableViewCell(){
        filmTableView.register(UINib (nibName: "CellFilmDesign", bundle:  nil ), forCellReuseIdentifier: Constans.UsreDataTableCellId)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userInformation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constans.UsreDataTableCellId, for: indexPath) as! FilmDesignCell
        cell.filmName.text = userInformation[indexPath.row].tableViewTitle
        cell.filmDescription.text = userInformation[indexPath.row].tableViewDescription
        if  imagesContaner.count > indexPath.row{
            cell.filmImage.image = imagesContaner[indexPath.row]
        }else {
            cell.filmImage.image = #imageLiteral(resourceName: "add-image.png")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let edit = UIContextualAction(style: .normal, title: "Film Data") { (action, view , completeionHandler )  in
            
            let Storyboard = UIStoryboard(name: "Main",bundle: nil)
            let sc = Storyboard.instantiateViewController(withIdentifier:Constans.FilmPreviewVc) as! FilmPreViewVc
            sc.filmName = self.userInformation[indexPath.row].tableViewTitle
            self.present(sc, animated: true, completion: nil)
            
            completeionHandler(true)
        }
        edit.backgroundColor = .systemOrange
        
        let swipe = UISwipeActionsConfiguration(actions: [edit])
        return swipe
        
    }
    
    //  - Add New Item In Table By Alert
    func addNewItemInTableByAlert(title : String , message: String ){
        
        var itemName = UITextField()
        var itemDescription = UITextField()
        let alert = UIAlertController(title:title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            alert.dismiss(animated: true, completion: nil)
            self.cheekDataOfUser( itemName.text! , itemDescription.text!)
        })
        alert.addAction(action)
        alert.addTextField { (name) in
            name.placeholder = "Create new Category"
            itemName = name
        }
        alert.addTextField { (des) in
            des.placeholder = "Create new Description"
            itemDescription = des
        }
        self.present(alert , animated: true ,completion: nil )
    }
    
}
