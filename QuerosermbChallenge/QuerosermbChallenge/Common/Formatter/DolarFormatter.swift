//
//  DolarFormatter.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 16/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

 extension String {
    func dolar() -> String {
        let amount1 = Double(self)
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.locale = Locale(identifier: "en_US")
        return numberFormatter.string(from: NSNumber(value: amount1!))!
    }
}
