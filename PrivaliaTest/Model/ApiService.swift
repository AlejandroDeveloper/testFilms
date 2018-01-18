//
//  ApiService.swift
//  PrivaliaTest
//
//  Created by Alejandro Palomo Rodriguez on 18/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import ObjectMapper

class ApiService {
    private var manager : SessionManager
    public var totalPages = 1
    
    init() {
        self.manager = Alamofire.SessionManager.default
    }
    
    func getList(page:Int,completion:@escaping(Array<Film>)-> Void,failure:@escaping(Int,String)-> Void){
        let url = "https://api.themoviedb.org/4/list/1?api_key=93aea0c77bc168d8bbce3918cefefa45&page=\(page)"
        
        self.manager.request(url).responseJSON { (response) in
            guard let responseJSON = response.result.value as? [String:AnyObject],
                let jsonResult = responseJSON["results"] as? Array<[String:AnyObject]> else {
                    failure(0,"Error response")
                    return
            }
            
            self.totalPages = responseJSON["total_pages"] as! Int
         
            let films = Mapper<Film>().mapArray(JSONArray:jsonResult)
            completion(films)
            print(films)
        }
    }
}
