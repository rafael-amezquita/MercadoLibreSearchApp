//
//  Common.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 24/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

enum SearchError: Error {
    case connection(message: String)
}

extension Notification.Name {
    static let connectionError = Notification.Name("ConnectionError")
    static let configurationError = Notification.Name("ConfigirationError")
}
