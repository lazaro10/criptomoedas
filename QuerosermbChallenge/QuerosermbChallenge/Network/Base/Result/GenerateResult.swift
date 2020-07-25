//
//  GenerateResult.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

class GenerateResult<Entity: Decodable> {
    
    func generate(_ data: Data?, _ error: NetworkError?) -> Result<[Entity], NetworkError> {
        if let data = data {
            do {
                let listCodable = try JSONDecoder().decode([Entity].self, from: data)
                return Result.success(listCodable)
            } catch {
                return Result.failure(.mapping)
            }
        } else if let error = error {
            return Result.failure(error)
        } else {
            return Result.failure(NetworkError.other(nil))
        }
    }
    
}
