//
//  Coordinator.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 19/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation
import UIKit

class Coordinator {
    
    private let searchTableViewController: SearchTableViewController
    private let storyboard = UIStoryboard(name: "Main", bundle: nil)
    
    // MARK: - Lifecycle
    
    init(with searchController: SearchTableViewController) {
        searchTableViewController = searchController
        searchTableViewController.delegate = self
    }
    
}

// MARK: - SearchTableViewDelegate

extension Coordinator: SearchTableViewDelegate {
    func didSelect(product: Product) {
        if let detailsController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController {
            detailsController.detailsViewModel.product = product
            searchTableViewController.show(detailsController, sender: self)
        }
    }
}
