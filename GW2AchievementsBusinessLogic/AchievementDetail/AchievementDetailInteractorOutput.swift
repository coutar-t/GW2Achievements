//
//  AchievementDetailInteractorOutput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementDetailInteractorOutput: class {
    func setDefaultValues()
    func notifyAchievement(_ achievement: AchievementDetailItemProtocol)
}

// sourcery: AutoMockableBusinessLogic
public protocol AchievementDetailItemProtocol {
    var name: String { get }
    var description: String { get }
    var iconUrl: String? { get }
    var requirement: String { get }
}
