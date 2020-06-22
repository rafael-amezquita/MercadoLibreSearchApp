//
//  SearchServicesProxy.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

protocol SearchServicesProxy {
    /*
     Return the requested result list from a determined query
     */
    func products(from query: String, completion: @escaping (Error?, [MLProduct]?) -> Void )
}
