//
//  SearchTableViewController.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import UIKit

protocol SearchTableViewDelegate: class {
    func didAppeared()
    func didSelect(product: Product)
    func didReturnData(with results: [Product])
}

class SearchTableViewController: UITableViewController {
    
    weak var delegate: SearchTableViewDelegate? = nil
    private let searchViewModel = SearchViewModel()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewModel.delegate = self
        navigationItem.searchController = searchController()
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        delegate?.didAppeared()
    }
    
    // MARK: Components
    
    private func searchController() -> UISearchController {
        let searchController = UISearchController()
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
        return searchViewModel.products.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)

        let product = searchViewModel.products[indexPath.row]
        cell.textLabel?.text = product.name
        cell.detailTextLabel?.text = product.domain

        return cell
    }
    
}

// MARK: - UITableViewDelegate

extension SearchTableViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let product = searchViewModel.products[indexPath.row]
        delegate?.didSelect(product: product)
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

// MARK: - UISearchBarDelegate

extension SearchTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchQuery = searchBar.text else {
            return
        }
        searchViewModel.fetchProducts(from: searchQuery)
    }
}

// MARK: - Restoration

extension SearchTableViewController {
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        // TODO: encode & decode products
    }
}

// MARK: - SearchViewModelChangeDelegate

extension SearchTableViewController: SearchViewModelChangeDelegate {
    func productsDidUpdate() {
        
        tableView.reloadData()
        delegate?.didReturnData(with: searchViewModel.products)
    }
}

