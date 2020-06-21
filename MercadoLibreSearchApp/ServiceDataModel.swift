//
//  ServiceDataModel.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

/*
 {
   "id": "741784-MLA31211029494_062019",
   "url": "https://mla-s2-p.mlstatic.com/741784-MLA31211029494_062019-F.jpg"
 }
 */
struct MLPictures: Codable {
    
    var id: String
    var stringURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case stringURL = "url"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id =  try container.decode(String.self, forKey: .id)
        stringURL = try container.decode(String.self, forKey: .stringURL)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(stringURL, forKey: .stringURL)
    }
}

/*
 {
   "id": "WITH_BLUETOOTH",
   "name": "Con Bluetooth",
   "value_id": "242085",
   "value_name": "Sí"
 }
 */
struct MLAttribute: Codable {
    
    var id: String
    var name: String
    var valueID: String?
    var valueName: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case valueID = "value_id"
        case valueName = "value_name"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id =  try container.decode(String.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        valueID =  try container.decodeIfPresent(String.self, forKey: .valueID)
        valueName =  try container.decode(String.self, forKey: .valueName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(name, forKey: .name)
        try container.encodeIfPresent(valueID, forKey: .valueID)
        try container.encode(valueName, forKey: .valueName)
    }
}

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
    var pictures: [MLPictures]
    
    enum CodingKeys: String, CodingKey {
        case id
        case status
        case domainID = "domain_id"
        case name
        case attributes
        case pictures
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id =  try container.decode(String.self, forKey: .id)
        status =  try container.decode(String.self, forKey: .status)
        domainID =  try container.decode(String.self, forKey: .domainID)
        name = try container.decode(String.self, forKey: .name)
        attributes =  try container.decode([MLAttribute].self, forKey: .attributes)
        pictures =  try container.decode([MLPictures].self, forKey: .pictures)
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




