//
//  SearchTableViewController.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import UIKit

protocol SearchTableViewDelegate: class {
    func didSelect(product: Product)
}

class SearchTableViewController: UITableViewController {
    
    weak var delegate: SearchTableViewDelegate? = nil
    private let sarchViewModel = SearchViewModel()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.searchController = searchController()
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    // MARK: Components
    
    private func searchController() -> UISearchController {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.autocapitalizationType = .none
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        
        return searchController
    }
}

// MARK: - UITableViewDataSource

extension SearchTableViewController {
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sarchViewModel.products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)

        let product = sarchViewModel.products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.price

        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension SearchTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = sarchViewModel.products[indexPath.row]
        delegate?.didSelect(product: product)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - UISearchBarDelegate

extension SearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print("just clicked")
    }
}

// MARK: - UISearchResultsUpdating

extension SearchTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        print("updating")
    }
}

// MARK: - Restoration

extension SearchTableViewController {
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        // TODO: encode & decode products
    }
}

