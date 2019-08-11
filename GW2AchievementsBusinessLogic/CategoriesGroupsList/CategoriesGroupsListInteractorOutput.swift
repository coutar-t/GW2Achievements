//
//  CategoriesGroupsListInteractorOutput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 09/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CategoriesGroupsListInteractorOutput: class {
    func setDefaultValues()
    func updateCategoriesGroupsList()
    func notifyLoading()
    func notifyServerError()
    func notifyNetworkError()
    func notifyUnknownError()
    func notifyNoDataError()
    func routeToAchievementsList()
}
