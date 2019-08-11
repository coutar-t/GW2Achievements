//
//  AchievementDetailInteractorTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class AchievementDetailInteractorTests: XCTestCase {
    var interactor: AchievementDetailInteractor!
    var repositoryMock: CurrentAchievementRepositoryInputMock!
    var outputMock: AchievementDetailInteractorOutputMock!

    override func setUp() {
        super.setUp()

        repositoryMock = CurrentAchievementRepositoryInputMock()
        outputMock = AchievementDetailInteractorOutputMock()
        interactor = AchievementDetailInteractor(currentRepository: repositoryMock)
        interactor.output = outputMock
    }

    // MARK: - ViewDidLoad

    func test_whenViewDidLoad_thenOutputSetDefaultValueAndRepositoryGet() {
        // When

        interactor.retrieve()

        // Then

        expect(self.repositoryMock.getCallsCount).to(equal(1))
        expect(self.outputMock.setDefaultValuesCallsCount).to(equal(1))

        expect(self.repositoryMock.clearCalled).to(beFalse())
        expect(self.repositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.outputMock.notifyAchievementCalled).to(beFalse())
    }

    // MARK: - DidGet

    func test_whenDidGet_thenOutputNotifyAchievement() {
        // When

        interactor.didGet(achievement: CurrentAchievementRepositoryResponseProtocolMock(name: "Name",
                                                                                        description: "Description",
                                                                                        requirement: "Requirement",
                                                                                        iconUrl: "iconUrl"))

        // Then

        expect(self.outputMock.notifyAchievementCallsCount).to(equal(1))
        expect(self.outputMock.notifyAchievementReceivedAchievement?.name).to(equal("Name"))
        expect(self.outputMock.notifyAchievementReceivedAchievement?.requirement).to(equal("Requirement"))
        expect(self.outputMock.notifyAchievementReceivedAchievement?.description).to(equal("Description"))
        expect(self.outputMock.notifyAchievementReceivedAchievement?.iconUrl).to(equal("iconUrl"))

        expect(self.repositoryMock.getCalled).to(beFalse())
        expect(self.repositoryMock.clearCalled).to(beFalse())
        expect(self.repositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())

    }

    // MARK: - DidHandleError

    func test_whenDidHandleError_thenDoNothing() {
        // When

        interactor.didHandleError()

        // Then

        expect(self.repositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.repositoryMock.clearCalled).to(beFalse())
        expect(self.repositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.outputMock.notifyAchievementCalled).to(beFalse())
    }
}
