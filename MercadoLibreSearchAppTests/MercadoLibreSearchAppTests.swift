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
    
    var service: SearchServices!
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        service = SearchServices()
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
    
    //TODO: remove this test or apply protocols, this has network interaction
    func test_searchProduct_shouldReturnProductArray() {
        let exp = expectation(description: "loading goals")
        
        service.products { 
          exp.fulfill()
        }
        
        wait(for: [exp], timeout: 3)
        
        //XCTAssertNotNil(goalsList)
    }

}
