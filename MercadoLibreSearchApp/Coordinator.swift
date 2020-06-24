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
    }
    
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
    
    func didAppeared() {
        popupDialog(with: "Welcome", message: "Search the cellphone you wan't in the search bar above")
    }
    func didSelect(product: Product) {
        if let detailsController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailsController.detailsViewModel.product = product
            searchTableViewController.navigationController?.pushViewController(detailsController, animated: true)
        }
    }
}
