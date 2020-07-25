//
//  UIView+Constraints.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 17/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

extension UIView {
    func addSubview<T: UIView>(_ view: T, constraints: [NSLayoutConstraint]) {
        addSubview(view)

        view.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate(constraints)
    }
}

