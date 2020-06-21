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
    var price: String
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
            [weak self] result in
            
            guard let self = self,
                let adaptedProducts = result else {
                return
            }
            
            self.products = adaptedProducts
        }
    }
    
    /*
    var products: [Product] {
        return [
            Product(name:"Product 1", price: "$1"),
            Product(name:"Product 2", price: "$2"),
            Product(name:"Product 3", price: "$3"),
            Product(name:"Product 4", price: "$4"),
            Product(name:"Product 5", price: "$5"),
            Product(name:"Product 6", price: "$6"),
            Product(name:"Product 7", price: "$7"),
            Product(name:"Product 8", price: "$8"),
            Product(name:"Product 9", price: "$9"),
            Product(name:"Product 10", price: "$10")
        ]
    }
     */

}
