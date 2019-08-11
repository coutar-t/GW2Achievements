//
//  AchievementsListModuleFactoryTests.swift
//  GW2AchievementsTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2Achievements

class AchievementsListModuleFactoryTests: XCTestCase {
    func test_whenMakeView_thenIsAnInstanceOfCategoriesGroupsListViewController() {
        expect(AchievementListModuleFactory().makeView()).to(beAnInstanceOf(AchievementsListViewController.self))
    }
}
