//
//  ExchangesListInteractor.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

final class ExchangesListInteractor {
    
    private let gateway: ExchangeGateway
    private weak var presenter: ExchangesListPresenter?
    
    init(gateway: ExchangeGateway, presenter: ExchangesListPresenter?) {
        self.gateway = gateway
        self.presenter = presenter
    }
    
    func loadExchanges() {
        presenter?.showLoading()
        
        gateway.exchanges(onSuccess: { [weak self] exchanges in
            let viewModels = exchanges.map(ExchangeViewModel.init)
            self?.presenter?.onExchanges(viewModels: viewModels)
            self?.loadExchangeIcons(exchangesViewModels: viewModels)
            self?.presenter?.hideLoading()
        }) { [weak self] error in
            self?.presenter?.onError(message: error.localizedDescription)
            self?.presenter?.hideLoading()
        }
    }
    
    private func loadExchangeIcons(exchangesViewModels: [ExchangeViewModel]) {
        gateway.icons { [weak self] (icons) in
            var viewModels: [ExchangeViewModel] = []
            
            exchangesViewModels.forEach { viewModel in
                let exchangeIcon = icons.first { exchangeIcon -> Bool in
                    viewModel.exchangeId == exchangeIcon.exchangeId
                }
                viewModels.append(ExchangeViewModel(entity: exchangeIcon, viewModel: viewModel))
            }

            self?.presenter?.onExchanges(viewModels: viewModels)
        }
    }
    
}


