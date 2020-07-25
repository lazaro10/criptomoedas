//
//  BaseTest.swift
//  QuerosermbChallengeUITests
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Quick
import Nimble
import UIKit

class BaseTest: QuickSpec {
    var rootViewController: UIViewController? {
        didSet {
            if let _ = rootViewController {
                loadRootViewController()
            }
        }
    }

    private func loadRootViewController() {
        UIApplication.shared.windows.first?.rootViewController = rootViewController
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        UIApplication.shared.windows.first?.overrideUserInterfaceStyle = .dark
    }
}

