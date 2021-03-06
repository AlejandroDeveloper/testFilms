//
//  ListFilmView.swift
//  PrivaliaTest
//
//  Created by Alejandro Palomo Rodriguez on 18/1/18.
//  Copyright © 2018 Alejandro Palomo Rodriguez. All rights reserved.
//

import Foundation

protocol ListFilmView: class {
    func successResult()
    func failureResult()
    func showSpinner()
    func hideSpinner()
}
