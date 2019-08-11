//
//  CurrentAchievementRepositoryProtocols.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CurrentAchievementRepositoryInput: class {
    var output: CurrentAchievementRepositoryOutput? { get set }
    func get()
    func save(currentAchievement: CurrentAchievementRepositoryRequestProtocol)
    func clear()
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentAchievementRepositoryOutput: class {
    func didGet(achievement: CurrentAchievementRepositoryResponseProtocol)
    func didHandleError()
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentAchievementRepositoryResponseProtocol {
    var name: String { get }
    var description: String { get }
    var requirement: String { get }
    var iconUrl: String? { get }
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentAchievementRepositoryRequestProtocol {
    var name: String { get }
    var description: String { get }
    var requirement: String { get }
    var iconUrl: String? { get }
}
