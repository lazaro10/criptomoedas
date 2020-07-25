//
//  String+Date.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 16/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Foundation

extension String {
    func date() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZZZZZ"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        dateFormatter.dateFormat = "dd/MM/yyyy"
        
       return dateFormatter.string(from: date)
    }
}
