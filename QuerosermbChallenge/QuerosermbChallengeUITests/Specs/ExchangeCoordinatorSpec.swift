//
//  ExchangeCoordinatorSpec.swift
//  QuerosermbChallengeUITests
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Quick

@testable import QuerosermbChallenge

final class ExchangeCoordinatorSpec: BaseTest {

    var gateway: ExchangeGatewayMock!
    var robot: ExchangeCoordinatorRobot!
    
    func setupExchanges() {
        gateway = ExchangeGatewayMock(exchanges: ExchangesMock.exchanges!,
                                      exchangesIcon: ExchangesMock.icons!)
        robot = ExchangeCoordinatorRobotFactory.make(self).load(gateway: gateway)
    }
    
    func setupEmptyExchanges() {
        gateway = ExchangeGatewayMock(exchanges: [], exchangesIcon: [])
        robot = ExchangeCoordinatorRobotFactory.make(self).load(gateway: gateway)
    }
    
    func setupError() {
        gateway = ExchangeGatewayMock(error: NetworkError.offline)
        robot = ExchangeCoordinatorRobotFactory.make(self).load(gateway: gateway)
    }
    
    override func spec() {
        super.spec()
        
        describe("ExchangeCoordinator") {
            context("when start exchanges list coordinator") {
                beforeEach {
                    self.setupExchanges()
                }

                it("should appear the exchange list") {
                    self.robot
                    .wiat()
                    .result()
                    .checkExchangesList()
                }
            }
            
            context("when selects the cell of exchange") {
                beforeEach {
                    self.setupExchanges()
                }

                it("should appear the screen of exchange detail") {
                    self.robot
                    .wiat()
                    .tapCell()
                    .result()
                    .checkExchangeDetail()
                }
            }

            context("when starting the exchanges list and the list comes empty") {
                beforeEach {
                    self.setupEmptyExchanges()
                }

                it("should appear the screen empty") {
                    self.robot
                    .wiat()
                    .result()
                    .checkEmptyStateList()
                }
            }

            context("when the exchange list coordinator starts and an error occurs") {
                beforeEach {
                    self.setupError()
                }

                it("error feedback should appear") {
                    self.robot
                    .wiat()
                    .result()
                    .checkErrorStateList()
                }
            }
        }
    }
}
