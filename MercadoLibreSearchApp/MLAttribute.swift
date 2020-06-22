//
//  MLAttribute.swift
//  MercadoLibreSearchApp
//
//  Created by Rafael Amezquita on 21/06/20.
//  Copyright © 2020 Rafael Amezquita. All rights reserved.
//

import Foundation

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
    
    mutating func decode(decoder: Decoder) throws {
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
