//
//  Coordinate.swift
//  Stormy
//
//  Created by toby tang on 2017-12-05.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

struct Coordinate {
    let latitude: Double
    let longtitude: Double
}

extension Coordinate: CustomStringConvertible {
    var description: String{
        return "\(latitude),\(longtitude)"
    }
}
