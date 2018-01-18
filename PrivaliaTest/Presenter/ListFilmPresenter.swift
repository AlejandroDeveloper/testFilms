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
    private var api : ApiService!
    private var pageActual = 0
    internal var listItems : Array<Film> = Array()
    
    func attachView(view:ListFilmView) {
        self.listView = view
    }
    
    func detachView() {
        self.listView = nil
    }
    
    init() {
        api = ApiService()
    }
    
    
    func getListToApi() {
        //If the actual page is more big or equal than total pages so not call the api
        if pageActual >= api.totalPages {

        } else {
            pageActual += 1
            api?.getList(page: pageActual, completion: { (films) in
                //Add new items to array
                self.listItems.append(contentsOf: films)
                self.listView?.successResult()
            }, failure: { (code, desc) in
                self.listView?.failureResult()
            })
        }
    }
    
}
