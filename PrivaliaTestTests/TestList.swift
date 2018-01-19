//
//  TestList.swift
//  PrivaliaTestTests
//
//  Created by Alejandro Palomo Rodriguez on 19/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import XCTest
@testable import PrivaliaTest

class TestList: XCTestCase {
    
    let filmView = ListFilmMock()
    let presenter = ListFilmPresenter(apiService: ApiMock())
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    //Comprove if the getListToApi function is correct with mock data
    func testGetApi() {
        presenter.attachView(view: filmView)
        presenter.getListToApi()
        XCTAssertEqual(filmView.entrySuccessResult, true, "La función funciona correctamente")
        XCTAssertEqual(filmView.entryShowSpinner, true, "La función muestra el spinner correctamente")
    }
    //Comprove if the search is correct , comparision with mock object in apimock
    func testSearchText(){
        presenter.attachView(view: filmView)
        presenter.getListToApi()
        presenter.searchFilmForText(text: "title")
        XCTAssertTrue(presenter.listItemsFilter.count != 0)
    }
    
}
