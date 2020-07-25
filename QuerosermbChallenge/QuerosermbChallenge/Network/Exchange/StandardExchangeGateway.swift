//
//  StandardExchangeGateway.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

final class StandardExchangeGateway {
    private let getRequest: GetRequestable
    
    init(getRequest: GetRequestable) {
        self.getRequest = getRequest
    }
}

extension StandardExchangeGateway: ExchangeGateway {
    
    func exchanges(onSuccess: @escaping ([Exchange]) -> (), onError: @escaping (NetworkError) -> ()) {
        getRequest.get(url: R.string.apI.exchanges()) { (data, error) in
            let result = GenerateResult<Exchange>().generate(data, error)
            
            switch result {
            case .success(let exchanges):
                onSuccess(exchanges)
            case .failure(let error):
                onError(error)
            }
        }
    }
    
    func icons(onSuccess: @escaping ([ExchangeIcon]) -> ()) {
        getRequest.get(url: R.string.apI.exchangesIcons())  { (data, error) in
            let result = GenerateResult<ExchangeIcon>().generate(data, error)
            
            switch result {
            case .success(let icons):
                onSuccess(icons)
            case .failure(_): break
            }
        }
    }
    
}
