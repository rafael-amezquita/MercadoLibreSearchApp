//
//  SearchServices.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation
import Alamofire

protocol SearchServicesProxy {
    /*
     Return the requested result list from a determined query
     */
    func products(from query: String, completion: @escaping (Error?, [MLProduct]?) -> Void )
}

class SearchServices: SearchServicesProxy {
    // TODO: take the URL from .plist
    /// https://api.mercadolibre.com/products/search?status=$STATUS_ID&site_id=$SITE_ID&q={q}
    private struct ServiceConstant {
        static let baseURL = "https://api.mercadolibre.com/products/search?status=active&site_id=MLA&q="
    }
    
    // MARK: - API
    
    func products(from query: String, completion: @escaping (Error?, [MLProduct]?) -> Void ) {
        //Samsung%20Galaxy%20S8
        Alamofire.request("\(ServiceConstant.baseURL)\(query)").responseJSON {
            jsonResponse in
            
            if let error = jsonResponse.error {
                //TODO: Handle error
                completion(error, nil)
                return
            }
            
            if let dataResponse = jsonResponse.data {
                let products = self.parse(dataResponse)
                completion(nil, products)
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
