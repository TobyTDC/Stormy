//
//  DarkSkyError.swift
//  Stormy
//
//  Created by toby tang on 2017-12-03.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import Foundation

enum DarkSkyError: Error {
    case requestFailed
    case responseUnsuccessful
    case invalidData
    case JSONConverionFailure
    case invalidUrl
    case JSONParsingFailure
}
