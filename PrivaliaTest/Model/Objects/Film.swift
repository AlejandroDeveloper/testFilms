//
//  Film.swift
//  PrivaliaTest
//
//  Created by Alejandro Palomo Rodriguez on 18/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import Foundation
import ObjectMapper
import UIKit

class Film: NSObject,Mappable  {
    var title : String?
    var overview : String?
    var urlImage : String?
    var dateFilm : String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title          <- map["title"]
        overview       <- map["overview"]
        urlImage       <- map["poster_path"]
        dateFilm       <- map["release_date"]
    }
}
