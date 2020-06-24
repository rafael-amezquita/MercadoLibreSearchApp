//
//  SearchViewModel.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

struct Product: Codable {
    var name: String
    var domain: String
}

protocol SearchViewModelChangeDelegate: class {
    
    func productsDidUpdate()
}

protocol SearchViewModelRetrievable {
    
    var products: [Product] { get }
    func fetchProducts(from query: String)
}

class SearchViewModel: SearchViewModelRetrievable {
    
    weak var delegate: SearchViewModelChangeDelegate?
    
    private(set) var products: [Product] {
        didSet {
            delegate?.productsDidUpdate()
        }
    }
    
    private let adapter: SearchAdaptable
    
    init(with adapter: SearchAdaptable = SearchAdapter()) {
        
        self.adapter = adapter
        products = [Product]()
    }
    
    func fetchProducts(from query: String) {
        
        let searchQuery = query.replacingOccurrences(of: " ", with: "%20")
        adapter.products(from: searchQuery) {
            [weak self] error, result in
            
            guard error == nil else {
                NotificationCenter.default.post(name: .connectionError, object: error)
                return
            }
            
            guard let self = self,
                let adaptedProducts = result else {
                return
            }
            
            self.products = adaptedProducts
        }
    }

}
