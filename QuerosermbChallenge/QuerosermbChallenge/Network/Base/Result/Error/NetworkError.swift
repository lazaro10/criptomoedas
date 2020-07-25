//
//  NetworkError.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Alamofire

enum NetworkError: Error {
    
    case mapping
    case weakConnection
    case offline
    case other(AFError?)
    
    var localizedDescription: String {
        switch self {
        case .mapping:
            return R.string.networkError.mapping()
        case .offline:
            return R.string.networkError.offline()
        default:
            return R.string.networkError.other()
        }
    }

}
