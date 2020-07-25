//
//  ExchangeCoordinator.swift
//  QuerosermbChallenge
//
//  Created by Lazaro on 13/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import UIKit

final class ExchangeCoordinator {

    private lazy var exchangesListScene: ExchangesListScene = {
        let scene = ExchangesListScene(gateway: gateway, delegate: self)
        scene.title = R.string.navigationBar.exchangeList()
        
        return scene
    }()
    
    private var exchangeDetailScene: ExchangeDetailScene?
    
    private let navigationController: UINavigationController
    private let gateway: ExchangeGateway

    init(navigationController: UINavigationController, gateway: ExchangeGateway) {
        self.navigationController = navigationController
        self.gateway = gateway
    }

}

extension ExchangeCoordinator: Coordinator {
    func start() {
        navigationController.pushViewController(exchangesListScene, animated: true)
    }
}

extension ExchangeCoordinator: ExchangesListViewDelegate {
    
    func didSelect(viewModel: ExchangeViewModel) {
        exchangeDetailScene = ExchangeDetailScene()
        exchangeDetailScene?.viewModel = viewModel
        
        guard let scene = exchangeDetailScene else { return }
        
        if #available(iOS 13.0, *) {
            navigationController.present(scene, animated: true)
        } else {
            navigationController.pushViewController(scene, animated: true)
        }
    }
    
}
