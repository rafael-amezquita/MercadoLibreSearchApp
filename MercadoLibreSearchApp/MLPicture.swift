//
//  MLPicture.swift
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
struct MLPicture: Codable {
    
    var id: String
    var stringURL: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case stringURL = "url"
    }
    
    mutating func decode(decoder: Decoder) throws {
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
