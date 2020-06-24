//
//  SearchServices.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation
import Alamofire
import os

struct Service: Codable {
    var baseURL: String
    var searchEndPoint: String
    var siteID: String
    var queryKey: String
}

class SearchService: SearchServicesProxy {

    private var service: Service?
    
    init() {
        if let path = Bundle.main.path(forResource: "Services", ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path) {
            do {
                service = try PropertyListDecoder().decode(Service.self, from: xml)
            } catch {
                NotificationCenter.default.post(name: .configurationError,
                                                object: "Service configuration not available")
            }
        } else {
            NotificationCenter.default.post(name: .configurationError,
                                            object: "Service configuration not available")
        }
    }
    
    private func searchPath() -> String {
        guard let service = self.service else {
            return ""
        }
        
        return service.baseURL
            + service.searchEndPoint
            + "\(service.siteID)="
            + "\(service.queryKey)="
    }
    
    // MARK: - API
    
    func products(from query: String, completion: @escaping (Error?, [MLProduct]?) -> Void ) {
        
        Alamofire.request("\(searchPath())\(query)").responseJSON {
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
            let errorLog = OSLog(subsystem: "com.org.MercadoLibreSearchApp", category: "SearchServicesProxy")
            os_log("Error while parsing", log: errorLog, type: .error)
        }
        
        return products
    }
    
}
