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
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        // TODO: Implement a mocked proxy
        adapter = SearchAdapter()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func test_productRespose_shouldNotBeNil() {
        let exp = expectation(description: "loading goals")
        
        adapter.products(from: "Samsung%20Galaxy%20S8") { products in
            XCTAssertNotNil(products)
            exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
    }

}
