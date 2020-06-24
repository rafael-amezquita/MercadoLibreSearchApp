//
//  DetailsViewModel.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 18/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

class DetailsViewModel {
    
    var product: Product?
    
    var nameString: String {
        return product?.name ?? "no name"
    }
    
    var detailsString: String {
        return product?.domain ?? "no data"
    }
}
