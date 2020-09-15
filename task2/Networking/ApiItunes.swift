//
//  ApiItunes.swift
//  task2
//
//  Created by MAK on 3/24/20.
//  Copyright © 2020 MAK. All rights reserved.
//

import Foundation
import Alamofire
class ApiItunes: NSObject {
    static func loadItunesData(searchType : String , searchFor : String ,completion: @escaping (_ error: String?, _ movies: ItunesData?) -> Void){
        
        AF.request(Constans.url, method: .get, parameters: ["term":searchFor,"entity":searchType], encoding: URLEncoding.default, headers: nil).response{ response in
            
            guard response.error == nil else { 
                completion(response.error?.localizedDescription,nil)
                return
            }
            guard let data = response.data else {
                completion("Server Error",nil)
                return
            }
            do{
                let decode = JSONDecoder()
                let data = try decode.decode(ItunesData.self, from: data)
                completion(nil,data)
            }catch{
                print(error.localizedDescription)
            }
            
        }
    }
    private static func searchForPrepering(_ Prepering : String) -> String {
        var retuenValue = ""
        for item in Prepering{
            if  item != " "{
                retuenValue += String(item)
            }
        }
        return  retuenValue
    }
    
}
