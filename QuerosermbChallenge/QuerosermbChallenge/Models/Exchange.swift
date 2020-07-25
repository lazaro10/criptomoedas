//
//  Exchange.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

struct Exchange: Decodable {
    
    let exchangeId: String
    let website: String
    let name: String
    let dataStart: String
    let dataEnd: String
    let dataQuoteStart: String
    let dataQuoteEnd: String
    let dataOrderbookStart: String
    let dataOrderbookEnd: String
    let dataTradeStart: String
    let dataTradeEnd: String
    let dataSymbolsCount: Int
    let volume1HrsUsd: Double
    let volume1DayUsd: Double
    let volume1MthUsd: Double
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        exchangeId = try container.decode(String.self, forKey: .exchangeId)
        website = try container.decode(String.self, forKey: .website)
        name = try container.decode(String.self, forKey: .name)
        dataStart = (try? container.decode(String.self, forKey: .dataStart)) ?? ""
        dataEnd = (try? container.decode(String.self, forKey: .dataEnd)) ?? ""
        dataQuoteStart = (try? container.decode(String.self, forKey: .dataQuoteStart)) ?? ""
        dataQuoteEnd = (try? container.decode(String.self, forKey: .dataQuoteEnd)) ?? ""
        dataOrderbookStart = (try? container.decode(String.self, forKey: .dataOrderbookStart)) ?? ""
        dataOrderbookEnd = (try? container.decode(String.self, forKey: .dataOrderbookEnd)) ?? ""
        dataTradeStart = (try? container.decode(String.self, forKey: .dataTradeStart)) ?? ""
        dataTradeEnd = (try? container.decode(String.self, forKey: .dataTradeEnd)) ?? ""
        dataSymbolsCount = (try? container.decode(Int.self, forKey: .dataSymbolsCount)) ?? 0
        volume1HrsUsd = (try? container.decode(Double.self, forKey: .volume1HrsUsd)) ?? 0.0
        volume1DayUsd = (try? container.decode(Double.self, forKey: .volume1DayUsd)) ?? 0.0
        volume1MthUsd = (try? container.decode(Double.self, forKey: .volume1MthUsd)) ?? 0.0
    }
    
    enum CodingKeys: String, CodingKey {
        case exchangeId = "exchange_id"
        case website
        case name
        case dataStart = "data_start"
        case dataEnd = "data_end"
        case dataQuoteStart = "data_quote_start"
        case dataQuoteEnd = "data_quote_end"
        case dataOrderbookStart = "data_orderbook_start"
        case dataOrderbookEnd = "data_orderbook_end"
        case dataTradeStart = "data_trade_start"
        case dataTradeEnd = "data_trade_end"
        case dataSymbolsCount = "data_symbols_count"
        case volume1HrsUsd = "volume_1hrs_usd"
        case volume1DayUsd = "volume_1day_usd"
        case volume1MthUsd = "volume_1mth_usd"
    }

}
