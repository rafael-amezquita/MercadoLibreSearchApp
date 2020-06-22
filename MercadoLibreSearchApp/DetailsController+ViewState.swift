//
//  DetailsController+ViewState.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 20/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation
import os

extension DetailViewController {
    
    private struct RestorationConstats {
        static let product = "product"
    }
    
    override func encodeRestorableState(with coder: NSCoder) {
        super.encodeRestorableState(with: coder)
        
        guard let product = detailsViewModel.product else {
            return
        }
        
        do {
            let encoder = JSONEncoder()
            let encodedProduct = try encoder.encode(product)
            coder.encode(encodedProduct, forKey: RestorationConstats.product)
        } catch {
            let errorLog = OSLog(subsystem: "com.org.MercadoLibreSearchApp", category: "DetailViewController")
            os_log("Error while encoding view state", log: errorLog, type: .error)
        }
    }
    
    override func decodeRestorableState(with coder: NSCoder) {
        super.decodeRestorableState(with: coder)
        
        do {
            let decoder = JSONDecoder()
            if let data = coder.decodeObject(forKey: RestorationConstats.product) as? Data {
                detailsViewModel.product = try decoder.decode(Product.self, from: data)
            }
        } catch {
            let errorLog = OSLog(subsystem: "com.org.MercadoLibreSearchApp", category: "DetailViewController")
            os_log("Error while decoding view state", log: errorLog, type: .error)
        }
    }
}
