//
//  UIStackView+RemoveAllArranged.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 15/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

extension UIStackView {
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }

        for view in removedSubviews {
            if view.superview != nil {
                NSLayoutConstraint.deactivate(view.constraints)
                view.removeFromSuperview()
            }
        }
    }
}
