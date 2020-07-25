//
//  ExchangesListPresenterSpy.swift
//  QuerosermbChallengeTests
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

@testable import QuerosermbChallenge

final class ExchangesListPresenterSpy: ExchangesListPresenter {

    var invokedOnExchanges = false
    var invokedOnExchangesCount = 0
    var invokedOnExchangesParameters: (viewModels: [ExchangeViewModel], Void)?
    var invokedOnExchangesParametersList = [(viewModels: [ExchangeViewModel], Void)]()

    func onExchanges(viewModels: [ExchangeViewModel]) {
        invokedOnExchanges = true
        invokedOnExchangesCount += 1
        invokedOnExchangesParameters = (viewModels, ())
        invokedOnExchangesParametersList.append((viewModels, ()))
    }

    var invokedOnError = false
    var invokedOnErrorCount = 0
    var invokedOnErrorParameters: (message: String, Void)?
    var invokedOnErrorParametersList = [(message: String, Void)]()

    func onError(message: String) {
        invokedOnError = true
        invokedOnErrorCount += 1
        invokedOnErrorParameters = (message, ())
        invokedOnErrorParametersList.append((message, ()))
    }

    var invokedShowLoading = false
    var invokedShowLoadingCount = 0

    func showLoading() {
        invokedShowLoading = true
        invokedShowLoadingCount += 1
    }

    var invokedHideLoading = false
    var invokedHideLoadingCount = 0

    func hideLoading() {
        invokedHideLoading = true
        invokedHideLoadingCount += 1
    }
}
