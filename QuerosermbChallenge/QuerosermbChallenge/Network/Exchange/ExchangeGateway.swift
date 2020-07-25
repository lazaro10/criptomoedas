//
//  ExchangeGateway.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

protocol ExchangeGateway {
    func exchanges(onSuccess: @escaping ([Exchange]) -> (), onError: @escaping (NetworkError) -> ())
    func icons(onSuccess: @escaping ([ExchangeIcon]) -> ()) 
}
