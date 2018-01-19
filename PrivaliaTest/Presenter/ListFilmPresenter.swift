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
    internal var listItemsFilter : Array<Film> = Array()
    
    func attachView(view:ListFilmView) {
        self.listView = view
    }
    
    func detachView() {
        self.listView = nil
    }
    
    init(apiService:ApiService) {
        api = apiService
    }
    
    /**
     Get list films for api.Include pagination.
     
     - returns success/failure: Return is success or not.
     */
    func getListToApi() {
        //If the actual page is more big or equal than total pages so not call the api
        if pageActual >= api.totalPages {

        } else {
            pageActual += 1
            self.listView?.showSpinner()
            
            api?.getList(page: pageActual, completion: { (films) in
                //Add new items to array
                self.listItems.append(contentsOf: films)
                self.listView?.successResult()
                self.listView?.hideSpinner()
            }, failure: { (code, desc) in
                self.listView?.failureResult()
                self.listView?.hideSpinner()
            })
        }
    }
    
    /**
     Search film for title
     - Parameter text: text for search in array original
     */
    func searchFilmForText(text:String) {
        listItemsFilter = listItems.filter { ($0.title?.lowercased().contains(text.lowercased()))!}
        self.listView?.successResult()
    }
    
}
