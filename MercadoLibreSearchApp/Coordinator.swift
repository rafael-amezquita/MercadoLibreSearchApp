//
//  Coordinator.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 19/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog

class Coordinator {
    
    private let searchTableViewController: SearchTableViewController
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    // MARK: - Lifecycle
    
    init(with searchController: SearchTableViewController) {
        searchTableViewController = searchController
        searchTableViewController.delegate = self
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onConnectionError(_:)),
                                               name: .connectionError,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(onConfigurationError(_:)),
                                               name: .configurationError,
                                               object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: - Notifications
    
    @objc func onConnectionError(_ notification: Notification) {
        if let error = notification.object as? SearchError {
            switch error {
            case .connection(let message):
                popupDialog(with: "Connection Error", message: message)
            }
        }
    }
    
    @objc func onConfigurationError(_ notification: Notification) {
        if let errorMessage = notification.object as? String {
            popupDialog(with: "Configuration Error", message: errorMessage)
        }
    }
    
    // MARK: - PopUp
    
    private func popupDialog(with title: String, message: String) {
        let popup = PopupDialog(title: title, message: message, image: nil)
        let okButton = CancelButton(title: "OK", action: nil)
        popup.addButton(okButton)
        searchTableViewController.present(popup, animated: true, completion: nil)
    }
    
}

// MARK: - SearchTableViewDelegate

extension Coordinator: SearchTableViewDelegate {
    func didReturnData(with results: [Product]) {
        if results.count == 0 {
            popupDialog(with: "0 results", message: "try to put more than one descriptive word")
        }
    }
    
    func fisrtEmptyAppereance() {
        popupDialog(with: "Welcome", message: "Search the cellphone you wan't in the search bar above")
    }
    
    func didSelect(product: Product) {
        if let detailsController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailsController.detailsViewModel.product = product
            searchTableViewController.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}
