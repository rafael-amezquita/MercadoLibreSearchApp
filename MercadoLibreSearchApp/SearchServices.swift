//
//  SearchServices.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchServicesProtocol {
    
}

class SearchServices {
    // TODO: take the URL from .plist
    /// https://api.mercadolibre.com/products/search?status=$STATUS_ID&site_id=$SITE_ID&q={q}
    private struct ServiceConstant {
        static let baseURL = "https://api.mercadolibre.com"
        static let product = "/product"
        static let search = "/search?"
        static let status = "status"
        static let siteID = "site_id"
        static let query = "q"
        
        static var searchProductStringURL: String {
            return "https://api.mercadolibre.com/products/search?status=active&site_id=MLA&q=Samsung%20Galaxy%20S8"
        }
    }
    
    // MARK: - API
    
    func products(_ completion: @escaping () -> Void ) {
        Alamofire.request(ServiceConstant.searchProductStringURL).responseJSON {
            jsonResponse in
            
            if let error = jsonResponse.error {
                //TODO: Handle error
                completion()
                return
            }
            
            if let dataResponse = jsonResponse.data {
                let products = self.parse(dataResponse)
                completion()
            }
            
        }
    }
    
    // MARK: - Utilities
    
    private func parse(_ dataResponse: Data) -> [MLProduct] {
        var products = [MLProduct]()
        do {
            let response = try JSONDecoder().decode(MLResponse.self, from: dataResponse)
            products = response.results
        } catch {
            // TODO: handle error
            print(error)
        }
        
        return products
    }
    
}
