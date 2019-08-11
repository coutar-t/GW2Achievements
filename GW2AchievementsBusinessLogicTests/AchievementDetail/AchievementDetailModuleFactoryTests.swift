//
//  AchievementDetailModuleFactoryTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic


class AchievementDetailModuleFactoryTests: XCTestCase {
    var moduleFactory: AchievementDetailInteractorModuleFactory!

    override func setUp() {
        super.setUp()

        moduleFactory = AchievementDetailInteractorModuleFactory()
    }

    func test_whenInteractor_thenIsAnInstanceOfCategoriesGroupDetailInteractor() {
        // When

        let interactor = moduleFactory.interactor()

        // Then

        expect(interactor).to(beAnInstanceOf(AchievementDetailInteractor.self))
    }
}
