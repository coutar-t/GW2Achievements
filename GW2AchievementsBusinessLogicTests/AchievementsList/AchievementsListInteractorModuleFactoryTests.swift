//
//  AchievementsListInteractorModuleFactoryTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class AchievementsListInteractorModuleFactoryTests: XCTestCase {

    var moduleFactory: AchievementsListInteractorModuleFactory!

    override func setUp() {
        super.setUp()

        moduleFactory = AchievementsListInteractorModuleFactory()
    }

    func test_whenInteractor_thenIsAnInstanceOfCategoriesGroupsListInteractor() {
        // When

        let interactor = moduleFactory.interactor(repository: AchievementsListRepositoryInputMock())

        // Then

        expect(interactor).to(beAnInstanceOf(AchievementsListInteractor.self))
    }
}
