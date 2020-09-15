//
//  SceneDelegate.swift
//  task2
//
//  Created by MAK on 2/8/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import UIKit
import SQLite
class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    // MARK: - Variable
    var window: UIWindow?
    var userDefauls = UserDefaults.standard
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        DataBaseManager.usersDB = DataBaseManager.shared().CreatDataBase(file: Constans.dataBaseUsersTablesFileName , type: 1) as! userSql
        DataBaseManager.usersDB.allUsres = DataBaseManager.shared().gitDataFromDB(dataBase: DataBaseManager.usersDB)
        
       startScreen(scene: scene)
        
        guard let _ = (scene as? UIWindowScene) else { return }
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

extension SceneDelegate {
    
    func startScreen(  scene: UIScene){
        if DataBaseManager.usersDB.allUsres.count > 0 {
            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let Storyboard = UIStoryboard(name: "Main",bundle: nil)
                let sc = Storyboard.instantiateViewController(withIdentifier: Constans.LoginVC) as! LoginVC
                DataBaseManager.fristScreenOrNot = true
                window.rootViewController = sc
                self.window = window
                window.makeKeyAndVisible()
            }
        }else{
            if let windowScene = scene as? UIWindowScene {
                let window = UIWindow(windowScene: windowScene)
                let storyboard = UIStoryboard(name: "Main",bundle: nil)
                let sc = storyboard.instantiateViewController(withIdentifier: Constans.SignupVCID ) as! SignupVC
                DataBaseManager.fristScreenOrNot = true
                window.rootViewController = sc
                self.window = window
                window.makeKeyAndVisible()
            }
        }
    }
    
}
