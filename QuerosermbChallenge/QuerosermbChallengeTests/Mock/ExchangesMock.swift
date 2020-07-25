//
//  ExchangesMock.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

@testable import QuerosermbChallenge

struct ExchangesMock {
    static let exchanges = try? JSONDecoder().decode([Exchange].self, from: MapperHelper.dataJSON(file: "exchanges"))
    
    static let icons = try? JSONDecoder().decode([ExchangeIcon].self, from: MapperHelper.dataJSON(file: "exchangeIcons"))
}
