//
//  MapperHelper.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

final class MapperHelper {
    static func dataJSON(file: String) -> Data {
        let bundle = Bundle(for: MapperHelper.self)
        let path = bundle.path(forResource: file, ofType: "json")!
        let url = URL(fileURLWithPath: path)

        guard let data = try? Data(contentsOf: url, options: .alwaysMapped) else {
            assertionFailure("We cannot load data from this file: \(file)")

            return Data()
        }

        return data
    }
}
