//
//  ExchangesListInteractorSpec.swift
//  QuerosermbChallengeTests
//
//  Created by Lazaro on 19/07/20.
//  Copyright © 2020 LimasCompany. All rights reserved.
//

import Quick
import Nimble

@testable import QuerosermbChallenge

final class ExchangesListInteractorSpec: QuickSpec {
    var gateway: ExchangeGatewayMock!
    var spy: ExchangesListPresenterSpy!
    var sut: ExchangesListInteractor!
    
    var exchanges: [Exchange] {
        let result = gateway.stubbedExchangesOnSuccessResult?.0
        
        return result!
    }
    
    var exchangesAdapters: [ExchangeViewModel] {
        return self.spy.invokedOnExchangesParameters!.viewModels
    }
    
    func setupExchanges() {
        gateway = ExchangeGatewayMock(exchanges: ExchangesMock.exchanges!,
                                      exchangesIcon: ExchangesMock.icons!)
        spy = ExchangesListPresenterSpy()
        sut = ExchangesListInteractor(gateway: gateway, presenter: spy)
    }
    
    func setupEmptyExchanges() {
        gateway = ExchangeGatewayMock(exchanges: [], exchangesIcon: [])
        spy = ExchangesListPresenterSpy()
        sut = ExchangesListInteractor(gateway: gateway, presenter: spy)
    }
    
    func setupErrorExchanges() {
        gateway = ExchangeGatewayMock(error: .offline)
        spy = ExchangesListPresenterSpy()
        sut = ExchangesListInteractor(gateway: gateway, presenter: spy)
    }
    
    override func spec() {
        describe("loadExchanges") {
            context("When exchanges are loaded successfully") {
                beforeEach {
                    self.setupExchanges()
                    self.sut.loadExchanges()
                }
                
                it("should display loading") {
                    expect(self.spy.invokedShowLoading).to(equal(true))
                }
                
                it("should display loading only once") {
                    expect(self.spy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("should call the gateway method that loads the exchange list") {
                    expect(self.spy.invokedOnExchanges).to(equal(true))
                }
                
                it("should have twenty-eight exchanges on the list") {
                    expect(self.exchanges.count).to(equal(28))
                }
                
                it("twenty-eight exchanges should be shown in the list") {
                    expect(self.exchangesAdapters.count).to(equal(28))
                }
                
                it("The loading should be removed from the screen") {
                    expect(self.spy.invokedHideLoading).to(equal(true))
                }
                
                it("The loading should be removed from the screen only once") {
                    expect(self.spy.invokedHideLoadingCount).to(equal(1))
                }
            }
            
            context("When exchanges are loaded with an empty list") {
                beforeEach {
                    self.setupEmptyExchanges()
                    self.sut.loadExchanges()
                }
                
                it("should display loading") {
                    expect(self.spy.invokedShowLoading).to(equal(true))
                }
                
                it("should display loading only once") {
                    expect(self.spy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("should call the gateway method that loads the exchange list") {
                    expect(self.spy.invokedOnExchanges).to(equal(true))
                }
                
                it("should call the gateway method that loads the exchange list only once") {
                    expect(self.spy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("There should be no exchange") {
                    expect(self.exchanges.count).to(equal(0))
                }
                
                it("None exchanges should be shown in the list") {
                    expect(self.exchangesAdapters.count).to(equal(0))
                }
                
                it("The loading should be removed from the screen") {
                    expect(self.spy.invokedHideLoading).to(equal(true))
                }
                
                it("The loading should be removed from the screen only once") {
                    expect(self.spy.invokedHideLoadingCount).to(equal(1))
                }
            }
            
            context("When exchanges are not loaded") {
                beforeEach {
                    self.setupErrorExchanges()
                    self.sut.loadExchanges()
                }
                
                it("should display loading") {
                    expect(self.spy.invokedShowLoading).to(equal(true))
                }
                
                it("should display loading only once") {
                    expect(self.spy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("should call the gateway method that loads the exchange list only once") {
                    expect(self.spy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("An error should be shown") {
                    expect(self.spy.invokedShowLoading).to(equal(true))
                }
                
                it("An error should be shown only once") {
                    expect(self.spy.invokedShowLoadingCount).to(equal(1))
                }
                
                it("the error message should be `You are currently offline.`") {
                    let message = self.spy.invokedOnErrorParameters?.message
                    expect(message).to(equal("You are currently offline."))
                }
                
                it("The loading should be removed from the screen") {
                    expect(self.spy.invokedHideLoading).to(equal(true))
                }
                
                it("The loading should be removed from the screen only once") {
                    expect(self.spy.invokedHideLoadingCount).to(equal(1))
                }
            }
        }
        
    }
    
}
