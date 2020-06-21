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

class SearchViewModel {
    
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
    
    init() {}
}
