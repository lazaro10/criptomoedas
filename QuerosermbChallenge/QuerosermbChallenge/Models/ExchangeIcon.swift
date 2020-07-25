//
//  ExchangeIcon.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 15/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

struct ExchangeIcon: Decodable {
    
    let exchangeId: String
    let url: URL
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        exchangeId = try container.decode(String.self, forKey: .exchangeId)
        url = try container.decode(URL.self, forKey: .url)
    }
    
    enum CodingKeys: String, CodingKey {
        case exchangeId = "exchange_id"
        case url
    }
    
}
