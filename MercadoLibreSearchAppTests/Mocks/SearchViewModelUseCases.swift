//
//  SearchViewModelUseCases.swift
//  MercadoLibreSearchAppTests
//
//  Created by Rafael Amezquita on 24/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

enum SearchViewModelUseCaseType {
    case withProducts
    case empty
}

class SearchViewModelUseCases {
  
    static func createAdapter(with useCase: SearchViewModelUseCaseType) -> SearchAdaptable {
        switch useCase {
        case .withProducts:
            return MockedSucessfulSearchAdapter()
        case .empty:
            return MockedErrorSearchAdapter()
        }
    }
}

class MockedSucessfulSearchAdapter: SearchAdaptable {
    
    func products(from query: String, completion: @escaping (SearchError?, [Product]?)-> Void) {
        let products: [Product] = [
            Product(name: "iPhone X 256 GB Gris espacial 3 GB RAM", domain: "MLA-CELLPHONES"),
            Product(name: "iPhone X 64 GB Gris espacial 3 GB RAM", domain: "MLA-CELLPHONES"),
            Product(name: "iPhone X 256 GB Plata 3 GB RAM", domain: "MLA-CELLPHONES"),
            Product(name: "iPhone X 64 GB Plata 3 GB RAM", domain: "MLA-CELLPHONES")
        ]
        
        completion(nil, products)
    }
}

class MockedErrorSearchAdapter: SearchAdaptable {
    
    func products(from query: String,
                  completion: @escaping (SearchError?, [Product]?)-> Void) {
        completion(nil, nil)
    }
}
