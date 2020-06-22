//
//  MLProduct.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

/*
{
  "id": "MLA6408698",
  "status": "active",
  "domain_id": "MLA-CELLPHONES",
  "name": "Samsung Galaxy S8 64 GB Negro medianoche 4 GB RAM",
  "attributes": [...],
  "pictures": [...]
}
 */
struct MLProduct: Codable {
    
    var id: String
    var status: String
    var domainID: String
    var name: String
    var attributes: [MLAttribute]
    var pictures: [MLPicture]
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case domainID = "domain_id"
        case name
        case attributes
        case pictures
    }
    
    mutating func decode(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id =  try container.decode(String.self, forKey: .id)
        status =  try container.decode(String.self, forKey: .status)
        domainID =  try container.decode(String.self, forKey: .domainID)
        name = try container.decode(String.self, forKey: .name)
        attributes =  try container.decode([MLAttribute].self, forKey: .attributes)
        pictures =  try container.decode([MLPicture].self, forKey: .pictures)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(status, forKey: .status)
        try container.encode(domainID, forKey: .domainID)
        try container.encode(name, forKey: .name)
        try container.encode(attributes, forKey: .attributes)
        try container.encode(pictures, forKey: .pictures)
    }
    
}

/*
 {
   "keywords": "Samsung Galaxy S8",
   "paging": {
     "total": 5,
     "limit": 10,
     "offset": 0
   },
   "results": [...]
 }
 */
struct MLResponse: Codable {
    var results: [MLProduct]
}
