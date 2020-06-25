//
//  SearchAdapterUseCases.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

enum AdapterUseCaseType {
    case withData
    case error
}

class SearchAdapterUseCases {
  
    static func createProxy(with useCase: AdapterUseCaseType) -> SearchServicesProxy {
        switch useCase {
        case .withData:
            return MockedProxyWithData()
        case .error:
            return MockedProxyWithError()
        }
    }
}

class MockedProxyWithData: SearchServicesProxy {
    
    private var products: [MLProduct] {
        return [
            MLProduct(id: "MLA6408698",
                      status: "active",
                      domainID: "MLA-CELLPHONES",
                      name: "Samsung Galaxy S8 64 GB Negro medianoche 4 GB RAM",
                      attributes: [],
                      pictures: [])
        ]
    }
    
    func products(from query: String, completion: @escaping (Error?, [MLProduct]?) -> Void) {
        completion(nil, products)
    }
}

class MockedProxyWithError: SearchServicesProxy {
    
    func products(from query: String, completion: @escaping (Error?, [MLProduct]?) -> Void) {
        let error = NSError(domain:"", code:401, userInfo:["message":"Bad Request"])
        completion(error, nil)
    }
}
