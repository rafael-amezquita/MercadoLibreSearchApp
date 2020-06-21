//
//  MercadoLibreSearchAppTests.swift
//  MercadoLibreSearchAppTests
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import XCTest
@testable import MercadoLibreSearchApp

class MercadoLibreSearchAppTests: XCTestCase {
    
    var adapter: SearchAdaptable!
    var searchViewModel: SearchViewModelRetrievable!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // TODO: Implement a mocked proxy
        adapter = SearchAdapter()
        // TODO: Implement a mocked adapter
        searchViewModel = SearchViewModel()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    // MARK: - Adapter Tests
    
    func test_productResponse_shouldNotBeNil() {
        let exp = expectation(description: "loading goals")
        
        adapter.products(from: "Samsung%20Galaxy%20S8") { products in
            XCTAssertNotNil(products)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
    }
    
    // MARK: - View Model Tests
    
    func test_searchAdaptedResponse_productsShouldNotBeEmpty() {
        searchViewModel.fetchProducts(from: "Samsung%20Galaxy%20S8")
        XCTAssertNotEqual(searchViewModel.products.count, 0)
    }
    
}
