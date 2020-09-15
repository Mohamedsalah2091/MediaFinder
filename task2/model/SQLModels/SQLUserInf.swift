





import Foundation
import SQLite

struct userSql{
    
    var DataBase : Connection!
    let table = Table("TaskTable")
    
    let id = Expression<Int>("id")
    let email = Expression<String>("email")
    
    let name = Expression<String>("name")
    
    let sex = Expression<String>("sex")
    let password = Expression<String>("password")
    let Login = Expression<Bool>("Login")
    
    var allUsres = [User]()
    
    
}
