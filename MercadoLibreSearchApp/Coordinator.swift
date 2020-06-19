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
    
    init(with searchController: SearchTableViewController) {
        searchTableViewController = searchController
        searchTableViewController.delegate = self
    }
    
}

extension Coordinator: SearchTableViewDelegate {
    func didSelect(product: Product) {
        let detailsController = storyboard.instantiateViewController(withIdentifier: "DetailViewController")
        searchTableViewController.show(detailsController, sender: self)
    }
}
