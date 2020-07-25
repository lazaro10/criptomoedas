//
//  ExchangesListPresenter.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 25/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

protocol ExchangesListPresenter: ErrorPresenter, LoadingPresenter  {
    func onExchanges(viewModels: [ExchangeViewModel])
}
