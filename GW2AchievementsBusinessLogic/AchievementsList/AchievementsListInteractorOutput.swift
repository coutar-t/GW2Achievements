//
//  AchievementsListInteractorOutput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementsListInteractorOutput: class {
    func setDefaultValues()
    func setTitle(_ title: String)
    func updateAchievementsList()
    func notifyLoading()
    func notifyServerError()
    func notifyNetworkError()
    func notifyUnknownError()
    func notifyNoDataError()
    func routeToAchievementDetail()
}
