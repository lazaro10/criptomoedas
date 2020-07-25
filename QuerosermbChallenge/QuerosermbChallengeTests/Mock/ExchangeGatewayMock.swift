//
//  ExchangeGatewayMock.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

@testable import QuerosermbChallenge

final class ExchangeGatewayMock: ExchangeGateway {
    var invokedExchanges = false
    var invokedExchangesCount = 0
    var stubbedExchangesOnSuccessResult: ([Exchange], Void)?
    var stubbedExchangesOnErrorResult: (NetworkError, Void)?
    
    init(exchanges: [Exchange], exchangesIcon: [ExchangeIcon]) {
        stubbedExchangesOnSuccessResult = (exchanges, ())
        stubbedIconsOnSuccessResult = (exchangesIcon, ())
    }

    init(error: NetworkError) {
        stubbedExchangesOnErrorResult = (error, ())
    }

    func exchanges(onSuccess: @escaping ([Exchange]) -> (), onError: @escaping (NetworkError) -> ()) {
        invokedExchanges = true
        invokedExchangesCount += 1
        if let result = stubbedExchangesOnSuccessResult {
            onSuccess(result.0)
        }
        if let result = stubbedExchangesOnErrorResult {
            onError(result.0)
        }
    }

    var invokedIcons = false
    var invokedIconsCount = 0
    var stubbedIconsOnSuccessResult: ([ExchangeIcon], Void)?

    func icons(onSuccess: @escaping ([ExchangeIcon]) -> ()) {
        invokedIcons = true
        invokedIconsCount += 1
        if let result = stubbedIconsOnSuccessResult {
            onSuccess(result.0)
        }
    }
}

