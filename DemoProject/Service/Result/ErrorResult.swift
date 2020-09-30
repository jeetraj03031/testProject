//
//  ErrorResult.swift
//  DemoProject
//
//  Created by EPIC on 01/10/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation

enum ErrorResult: Error {
    case network(string: String)
    case parser(string: String)
    case custom(string: String)
}

