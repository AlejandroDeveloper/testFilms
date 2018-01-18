//
//  ListFilmPresenter.swift
//  PrivaliaTest
//
//  Created by Alejandro Palomo Rodriguez on 18/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import Foundation

class ListFilmPresenter {
    
    weak private var listView : ListFilmView?
    private var api : ApiService?
    
    func attachView(view:ListFilmView) {
        self.listView = view
    }
    
    func detachView() {
        self.listView = nil
    }
    
    init() {
        api = ApiService()
    }
    
    
}
