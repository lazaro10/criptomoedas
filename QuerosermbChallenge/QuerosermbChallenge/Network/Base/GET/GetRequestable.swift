//
//  GetRequestable.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

protocol GetRequestable {
    func get(url: String, completionHandler: @escaping (Data?, NetworkError?) -> Void)
}
