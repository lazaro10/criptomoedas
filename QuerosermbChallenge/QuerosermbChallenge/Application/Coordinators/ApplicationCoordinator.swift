//
//  ApplicationCoordinator.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

final class ApplicationCoordinator {
    
    private let window: UIWindow?
    private let gateway: ExchangeGateway
    private let rootNavigationViewController: UINavigationController
    
    private lazy var exchangeCoordinator: ExchangeCoordinator = {
        ExchangeCoordinator(navigationController: rootNavigationViewController, gateway: gateway)
    }()
    
    init(window: UIWindow?, gateway: ExchangeGateway) {
        self.window = window
        self.gateway = gateway
        
        rootNavigationViewController = UINavigationController()
        
        setupNavigationView()
    }
    
    private func setupNavigationView() {
        rootNavigationViewController.navigationBar.prefersLargeTitles = true
        rootNavigationViewController.view.accessibilityLabel = R.string.accessibilityLabels.navigationApplicaton()
    }
}

extension ApplicationCoordinator: Coordinator {
    func start() {
        window?.rootViewController = rootNavigationViewController
        window?.makeKeyAndVisible()
    
        exchangeCoordinator.start()
    }
}
