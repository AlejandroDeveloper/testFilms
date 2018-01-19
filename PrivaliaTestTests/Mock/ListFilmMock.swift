//
//  ListViewMock.swift
//  PrivaliaTestTests
//
//  Created by Alejandro Palomo Rodriguez on 19/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import Foundation
@testable import PrivaliaTest
class ListFilmMock : NSObject,ListFilmView {
    internal var entrySuccessResult = false
    internal var entryShowSpinner = false
    func successResult() {
        entrySuccessResult = true
    }
    func failureResult() {
        
    }
    func showSpinner() {
        entryShowSpinner = true
    }
    func hideSpinner() {
        
    }
    
}
