//
//  CurrentCategoryRepositoryTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class CurrentCategoryRepositoryTests: XCTestCase {
    var repository: CurrentCategoryRepository!
    var output: CurrentCategoryRepositoryOutputMock!

    override func setUp() {
        output = CurrentCategoryRepositoryOutputMock()
        repository = CurrentCategoryRepository.shared
        repository.output = output
    }

    func test_givenNothingSaved_whenRepositoryGet_thenOutputDidHandleError() {
        // Given

        repository.clear()

        // When

        repository.save(currentCategory: CurrentCategoryRepositoryRequestProtocolMock(name: "Name",
                                                                                  iconUrl: "Toto",
                                                                                  achievements: [1]))

        repository.get()

        // Then

        expect(self.output.didGetCategoryReceivedCategory?.iconUrl).to(equal("Toto"))
        expect(self.output.didGetCategoryReceivedCategory?.name).to(equal("Name"))
        expect(self.output.didGetCategoryReceivedCategory?.achievements).to(equal([1]))
        expect(self.output.didHandleErrorCalled).to(beFalse())
        expect(self.output.didGetCategoryCallsCount).to(equal(1))
    }

    func test_whenRepositoryClear_thenNothingIsSaved() {
        // When

        repository.clear()

        // When

        repository.get()

        // Then

        expect(self.output.didHandleErrorCallsCount).to(equal(1))
        expect(self.output.didGetCategoryCalled).to(beFalse())
    }
}
