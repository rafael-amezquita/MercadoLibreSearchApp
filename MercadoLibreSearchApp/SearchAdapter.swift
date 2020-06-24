//
//  SearchAdapter.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

protocol SearchAdaptable {
    
    func products(from query: String, completion: @escaping (SearchError?, [Product]?)-> Void)
}

enum SearchError: Error {
    case connection(message: String)
}

class SearchAdapter: SearchAdaptable {
    private let proxy: SearchServicesProxy
    
    init(with proxy: SearchServicesProxy = SearchServices()) {
        self.proxy = proxy
    }
    
    func products(from query: String, completion: @escaping (SearchError?, [Product]?) -> Void) {
        proxy.products(from: query) { error, result in
            
            guard error == nil,
                let serviceProducts = result  else {
                    if let error = error as? NSError {
                        let searchError = SearchError.connection(message: error.localizedDescription)
                        completion(searchError, nil)
                    }
                    return
            }
            
            var products = [Product]()
            for item in serviceProducts {
                let product = Product(name: item.name, domain: item.domainID)
                products.append(product)
            }
            
            completion(nil, products)
        }
    }
}
