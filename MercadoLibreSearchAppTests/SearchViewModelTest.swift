//
//  SearchViewModelTest.swift
//  MercadoLibreSearchAppTests
//
//  Created by Rafael Amezquita on 24/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import XCTest
@testable import MercadoLibreSearchApp

class SearchViewModelTest: XCTestCase {
    
    var viewModel: SearchViewModelRetrievable!
    
    let randomQuery = "Samsung%20Galaxy%20S8"

    func test_fetchProducts_shouldBePopulated() {
        let useCase = SearchViewModelUseCases.createAdapter(with: .withProducts)
        viewModel = SearchViewModel(with: useCase)
        viewModel.fetchProducts(from: randomQuery)
        
        XCTAssert(viewModel.products.count > 0)
    }
    
    func test_fetchProducts_shouldBeEmpty() {
        let useCase = SearchViewModelUseCases.createAdapter(with: .empty)
        viewModel = SearchViewModel(with: useCase)
        viewModel.fetchProducts(from: randomQuery)
        
        XCTAssertNotNil(viewModel.products)
        XCTAssert(viewModel.products.count == 0)
    }
}
