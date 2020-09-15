

// Singleton

import UIKit
import SQLite
struct DataBaseManager{
    
    private static let sharedInstance = DataBaseManager()
    
    static var usersDB = userSql()
    static var filmDB = filmSql()
    static var dataBaseLastSearch = filmLastSearchData()
    static var dataBaseLastSearchWords = filmLastSearchWords()
    
    static var  fristScreenOrNot: Bool!
    
    static func shared()->DataBaseManager{
        return DataBaseManager.sharedInstance
    }
    
    func CreatDataBase(file : String , type : Int)->Any{
        
        var dataBase = userSql()
        var dataBaseFilm = filmSql()
        var dataBaseLastSearch = filmLastSearchData()
        var dataBaseLastSearchWords = filmLastSearchWords()
        
        do{
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let FileUrl =   documentDirectory.appendingPathComponent(file)
            let DataBase = try Connection(FileUrl.path)
            
            if type == 1{
                dataBase.DataBase = DataBase
            }else if type == 2{
                dataBaseFilm.DataBase = DataBase
            }else if type == 3{
                dataBaseLastSearch.DataBase = DataBase
            }else{
                dataBaseLastSearchWords.DataBase = DataBase
            }
            
        }catch{
            print(error.localizedDescription)
        }
        let createTable = Columes(type: type, dataBase: dataBase, dataBaseFilm: dataBaseFilm , dataBaseLastSearch: dataBaseLastSearch , dataBaseLastSearchWords : dataBaseLastSearchWords )
        
        do{
            
            if type == 1{
                try dataBase.DataBase.run(createTable)
            }else if type == 2{
                try dataBaseFilm.DataBase.run(createTable)
            }else if type == 3 {
                try dataBaseLastSearch.DataBase.run(createTable)
            }else {
                try dataBaseLastSearchWords.DataBase.run(createTable)
            }
            
        }catch{
            print(error.localizedDescription)
        }
        
        if type == 1{
            return dataBase
        }else if type == 2{
            return dataBaseFilm
        }else if type == 3{
            return dataBaseLastSearch
        }else{
            return dataBaseLastSearchWords
        }
        
    }
    
    func gitDataFromDB(dataBase:userSql) -> [User]{
        var allUsers = [User]()
        var userData = User()
        do{
            let  allData = try dataBase.DataBase.prepare(dataBase.table)
            for data in allData{
                userData.id = data[dataBase.id]
                userData.name = data[dataBase.name]
                userData.email = data[dataBase.email]
                userData.Login = data[dataBase.Login]
                userData.password = data[dataBase.password]
                userData.sex = data[dataBase.sex]
                allUsers.append(userData)
            }
        }catch{print(error.localizedDescription)}
        return allUsers
    }
    
    func Columes(type : Int , dataBase : userSql , dataBaseFilm : filmSql , dataBaseLastSearch: filmLastSearchData , dataBaseLastSearchWords : filmLastSearchWords) ->String {
        var createTable : String!
        
        if  type == 1 {
            createTable = dataBase.table.create { (tb) in
                tb.column( dataBase.id, primaryKey: true)
                tb.column( dataBase.name )
                tb.column( dataBase.email , unique: true)
                tb.column( dataBase.sex  )
                tb.column( dataBase.password )
                tb.column( dataBase.Login ,defaultValue: false)
            }
        }else if type == 2{
            createTable = dataBaseFilm.table.create { (tb) in
                tb.column( dataBaseFilm.id )
                tb.column( dataBaseFilm.title)
                tb.column( dataBaseFilm.filmId , unique: true)
                tb.column( dataBaseFilm.filmType)
                tb.column( dataBaseFilm.rateStar)
                tb.column( dataBaseFilm.description )
            }
            
        }else if type == 3{
            createTable = dataBaseLastSearch.table.create { (tb) in
                tb.column( dataBaseLastSearch.userid)
                tb.column( dataBaseLastSearch.artistName, defaultValue: "")
                tb.column( dataBaseLastSearch.trackName, defaultValue: "")
                tb.column( dataBaseLastSearch.artworkUrl100, defaultValue: "")
                tb.column( dataBaseLastSearch.previewUrl, defaultValue: "")
                tb.column( dataBaseLastSearch.longDescription, defaultValue: "")
            }
        }else {
            createTable = dataBaseLastSearchWords.table.create { (tb) in
                tb.column( dataBaseLastSearchWords.userid)
                tb.column( dataBaseLastSearchWords.words , unique: true)
            }
            
        }
        return createTable
    }
    
    
}

