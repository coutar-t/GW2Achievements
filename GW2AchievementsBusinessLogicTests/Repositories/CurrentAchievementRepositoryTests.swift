//
//  CurrentAchievementRepositoryTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class CurrentAchievementRepositoryTests: XCTestCase {
    var repository: CurrentAchievementRepository!
    var output: CurrentAchievementRepositoryOutputMock!

    override func setUp() {
        output = CurrentAchievementRepositoryOutputMock()
        repository = CurrentAchievementRepository.shared
        repository.output = output
    }

    func test_givenNothingSaved_whenRepositoryGet_thenOutputDidHandleError() {
        // Given

        repository.clear()

        // When

        repository.save(currentAchievement: CurrentAchievementRepositoryRequestProtocolMock(
            name: "Name",
            description: "Description",
            requirement: "Requirement",
            iconUrl: "IconUrl"
        ))

        repository.get()

        // Then

        expect(self.output.didGetAchievementReceivedAchievement?.iconUrl).to(equal("IconUrl"))
        expect(self.output.didGetAchievementReceivedAchievement?.name).to(equal("Name"))
        expect(self.output.didGetAchievementReceivedAchievement?.description).to(equal("Description"))
        expect(self.output.didGetAchievementReceivedAchievement?.requirement).to(equal("Requirement"))
        
        expect(self.output.didHandleErrorCalled).to(beFalse())
        expect(self.output.didGetAchievementCallsCount).to(equal(1))
    }

    func test_whenRepositoryClear_thenNothingIsSaved() {
        // When

        repository.clear()

        // When

        repository.get()

        // Then

        expect(self.output.didHandleErrorCallsCount).to(equal(1))
        expect(self.output.didGetAchievementCalled).to(beFalse())
    }
}
