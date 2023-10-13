//
//  Entity.swift
//  CryptoVIPER
//
//  Created by Seyma on 13.10.2023.
//

import Foundation

struct Crypto: Decodable { // sadece api den veri çekeceğiz bu yüzden decodablebir veri gönderiyor olsaydık codable veya encodable
    let currency: String
    let price: String
}
