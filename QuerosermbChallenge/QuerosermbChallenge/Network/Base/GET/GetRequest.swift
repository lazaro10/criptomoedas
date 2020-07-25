//
//  GetRequest.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Alamofire
import UIKit

final class GetRequest: GetRequestable {
    
    func get(url : String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        makeRequest(url: url, completionHandler: completionHandler)
    }
    
    private func makeRequest(url urlString: String, completionHandler: @escaping (Data?, NetworkError?) -> Void) {
        
        guard let url = URL(string: urlString) else { return }
        
        AF.request(url, method: .get).response { (response) in
            if let error = response.error {
                
                switch error {
                case .sessionTaskFailed(let sessionError):
                    if let urlError = sessionError as? URLError,
                        urlError.code == .notConnectedToInternet {
                        completionHandler(nil, NetworkError.offline)
                        return
                    }
                default:
                    completionHandler(nil, NetworkError.other(error))
                    break
                }
            } else {
                completionHandler(response.data, nil)
            }
        }
        
    }
}
