//
//  ExchangeCoordinatorRobot.swift
//  QuerosermbChallengeUITests
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Nimble
import Nimble_Snapshots
import UIKit

@testable import QuerosermbChallenge

final class ExchangeCoordinatorRobotFactory {
      static func make(_ controllerSpec: BaseTest) -> ExchangeCoordinatorRobot {
          return ExchangeCoordinatorRobot(controllerSpec: controllerSpec)
      }
}

final class ExchangeCoordinatorRobot: BaseRobot {
    
    func load(gateway: ExchangeGateway) -> Self {
        let navigationController = UINavigationController()
        
        ExchangeCoordinator(navigationController: navigationController, gateway: gateway).start()
        
        controllerSpec.rootViewController = navigationController
        
        return self
    }
    
    func wiat() -> Self {
        tester.waitForAnimationsToFinish(withTimeout: 1)
        
        return self
    }
    
    func tapCell() -> Self {
        tester.tapView(withAccessibilityLabel: R.string.accessibilityLabels.exchangeCell())

        return self
    }
    
    func result() -> ExchangeCoordinatorResult {
        return ExchangeCoordinatorResult(controllerSpec: controllerSpec)
    }
    
}

final class ExchangeCoordinatorResult: BaseRobot {
    
    @discardableResult
    func checkExchangesList() -> ExchangeCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: R.string.accessibilityLabels.exchangeList())
        
        expect(productList) == snapshot("exchanges_list")
        
        return self
    }
    
    @discardableResult
    func checkEmptyStateList() -> ExchangeCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: R.string.accessibilityLabels.exchangeList())
        
        expect(productList) == snapshot("exchanges_list_empty_state")
        
        return self
    }
    
    @discardableResult
    func checkErrorStateList() -> ExchangeCoordinatorResult {
        let productList: UIView = tester.waitForView(withAccessibilityLabel: R.string.accessibilityLabels.exchangeList())
        
        expect(productList) == snapshot("exchanges_list_error")
        
        return self
    }
    
    @discardableResult
    func checkExchangeDetail() -> ExchangeCoordinatorResult {
        let exchangesList: UIView = tester.waitForView(withAccessibilityLabel: R.string.accessibilityLabels.exchangeDetail())
        
        expect(exchangesList) == snapshot("application_exchange_detail")
        
        return self
    }
    
}
