//
//  ExchangeViewModel.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 18/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

struct ExchangeViewModel {
    
    var icon: URL? = nil
    let name: String
    let exchangeId: String
    var extras: [(String, String)] = []
    var allExtras: [(String, String)] = []
    
    init(entity: Exchange) {
        name = entity.name
        exchangeId = entity.exchangeId
    
        let lastTrade = (R.string.exchangesExtra.lastNegotiation(), "\(entity.dataTradeEnd.date())")
        let totalSymbols = (R.string.exchangesExtra.totalSymbols(), "\(entity.dataSymbolsCount)")
        let volume1Hr = (R.string.exchangesExtra.sumAnHour(), "\(entity.volume1HrsUsd)".dolar())
        
        extras.append(contentsOf: [lastTrade, totalSymbols, volume1Hr])

        allExtras.append((R.string.exchangesExtra.firstQuotation(), "\(entity.dataQuoteStart.date())"))
        allExtras.append((R.string.exchangesExtra.lastQuotation(), "\(entity.dataQuoteEnd.date())"))
        allExtras.append((R.string.exchangesExtra.firstNegotiation(), "\(entity.dataOrderbookStart.date())"))
        allExtras.append((R.string.exchangesExtra.lastPurchaseOrder(), "\(entity.dataOrderbookEnd.date())"))
        allExtras.append((R.string.exchangesExtra.firstNegotiation(), "\(entity.dataTradeStart.date())"))
        allExtras.append(contentsOf: [lastTrade, totalSymbols, volume1Hr])
        allExtras.append((R.string.exchangesExtra.sumAnday(), "\(entity.volume1DayUsd)".dolar()))
        allExtras.append((R.string.exchangesExtra.sumMonth(), "\(entity.volume1MthUsd)".dolar()))
    }
    
    init(entity: ExchangeIcon?, viewModel: ExchangeViewModel) {
        icon = entity?.url
        name = viewModel.name
        exchangeId = viewModel.exchangeId
        extras = viewModel.extras
        allExtras = viewModel.allExtras
    }
    
}
