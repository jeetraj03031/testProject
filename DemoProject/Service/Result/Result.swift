//
//  Result.swift
//  DemoProject
//
//  Created by EPIC on 01/10/20.
//  Copyright © 2020 demo. All rights reserved.
//

import Foundation
enum Result<T, E: Error> {
    case success(T)
    case failure(E)
}
