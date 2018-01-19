//
//  ApiMock.swift
//  PrivaliaTestTests
//
//  Created by Alejandro Palomo Rodriguez on 19/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import Foundation
@testable import PrivaliaTest

class ApiMock: ApiService {
    public var itemsFilm : Array<Film> = Array()
    override init() {
        //simulate object film
        let film = Film()
        film.title = "Title mock"
        film.overview = "The film is incredible and a fantastic film for apasionate persons of fiction films"
        film.dateFilm = "2017-05-05"
        film.urlImage = "/123.jpg"
        
        itemsFilm.append(film)
    }
    
    override func getList(page: Int, completion: @escaping (Array<Film>) -> Void, failure: @escaping (Int, String) -> Void) {
        completion(itemsFilm)
    }
}
