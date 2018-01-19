//
//  ListFilmsView.swift
//  PrivaliaTest
//
//  Created by Alejandro Palomo Rodriguez on 18/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import UIKit
import SwiftSpinner

class ListFilmsViewController: UIViewController {

    
    @IBOutlet var myTableView: UITableView!
    @IBOutlet var mySearchBar: UISearchBar!
    
    private let presenter = ListFilmPresenter()
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.attachView(view: self)
        myTableView.estimatedRowHeight = 99.0
        myTableView.rowHeight = UITableViewAutomaticDimension
    }

    override func viewDidAppear(_ animated: Bool) {
        presenter.getListToApi()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ListFilmsViewController : UITableViewDelegate,UITableViewDataSource {
    
    internal func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    internal func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.listItems.count
    }
    
    internal func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = "cell"
        var cell : ListCell! = tableView.dequeueReusableCell(withIdentifier: identifier) as? ListCell
        if cell == nil {
            tableView.register(UINib(nibName: "ListCell",bundle:nil), forCellReuseIdentifier:identifier)
            cell = tableView.dequeueReusableCell(withIdentifier: identifier) as? ListCell
        }
        
        let film = presenter.listItems[indexPath.row]
        
        if let title = film.title {
            cell.lblTitle.text = title
        } else {
            cell.lblTitle.text = "Not title"
        }
        
        if let dateFilm = film.dateFilm {
            //Get year only
            let arrayString = dateFilm.components(separatedBy: "-")
            cell.lblDate.text = arrayString[0]
        } else {
            cell.lblDate.text = "Not date"
        }
        
        if let overview = film.overview {
            cell.lblDescription.text = overview
        }else{
            cell.lblDescription.text = "Not overview"
        }
        
        if let urlImage = film.urlImage {
            cell.setImage(imageUrl: urlImage)
        }
        
        //Pagination
        if presenter.listItems.count - 2 == indexPath.row {
            presenter.getListToApi()
        }
        
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){

    }
}

extension ListFilmsViewController : UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        self.mySearchBar.showsCancelButton = true
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchText == "" {
//            isSearching = false
//        } else {
//            isSearching = true
//            presenter.sortUserByText(text: searchText, items: usersItems)
//        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.mySearchBar.showsCancelButton = false
        self.view.endEditing(true)
       // isSearching = false
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.mySearchBar.text = ""
        self.mySearchBar.showsCancelButton = false
        self.mySearchBar.endEditing(true)
       // isSearching = false
        self.myTableView.reloadData()
    }
    
}

extension ListFilmsViewController : ListFilmView {
    func successResult() {
        self.myTableView.reloadData()
    }
    
    func failureResult() {
        
    }
    
    func showSpinner() {
        SwiftSpinner.show("Loading...")
    }
    
    func hideSpinner() {
        SwiftSpinner.hide()
    }
}
