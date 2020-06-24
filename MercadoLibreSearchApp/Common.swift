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

extension String {
    func localized() -> String {
        return NSLocalizedString(self, comment: "")
    }
}

struct Constants {
    static let noResultsPopupTitle = "ui.search.popup.no.results.title".localized()
    static let noResultsPopupMessage = "ui.search.popup.no.results.message".localized()
    static let welcomePopupTitle = "ui.search.popup.welcome.title".localized()
    static let welcomePopupMessage = "ui.search.popup.welcome.message".localized()
    static let popupButtom = "ui.search.popup.welcome.ok.button".localized()
}
