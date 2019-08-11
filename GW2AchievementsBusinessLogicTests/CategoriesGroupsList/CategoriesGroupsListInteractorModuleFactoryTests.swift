//
//  CategoriesGroupsListInteractorModuleFactoryTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class CategoriesGroupsListInteractorModuleFactoryTests: XCTestCase {

    var moduleFactory: CategoriesGroupsListInteractorModuleFactory!

    override func setUp() {
        super.setUp()

        moduleFactory = CategoriesGroupsListInteractorModuleFactory()
    }

    func test_whenInteractor_thenIsAnInstanceOfCategoriesGroupsListInteractor() {
        // When

        let interactor = moduleFactory.interactor(repository: CategoriesGroupsListRepositoryInputMock())

        // Then

        expect(interactor).to(beAnInstanceOf(CategoriesGroupsListInteractor.self))
    }
}
