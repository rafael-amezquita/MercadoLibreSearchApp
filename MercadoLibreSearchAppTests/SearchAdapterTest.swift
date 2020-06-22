//
//  SearchAdapterTest.swift
//  MercadoLibreSearchAppTests
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import XCTest
@testable import MercadoLibreSearchApp

class SearchAdapterTest: XCTestCase {

    var adapter: SearchAdaptable!
    
    let randomQuery = "Samsung%20Galaxy%20S8"
    
    func test_productResponse_shouldNotBeNil() {
        let useCase = SearchAdapterUseCases.createProxy(with: .withData)
        adapter = SearchAdapter(with: useCase)
        
        let exp = expectation(description: "loading products")
        
        adapter.products(from: randomQuery) { products in
            XCTAssertNotNil(products)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
    }
    
    func test_productResponse_shouldRetrunNil() {
        let useCase = SearchAdapterUseCases.createProxy(with: .error)
        adapter = SearchAdapter(with: useCase)
        
        let exp = expectation(description: "loading products")
        
        adapter.products(from: randomQuery) { products in
            XCTAssertNil(products)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
    }

}
