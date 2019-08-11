//
//  AchievementsListRepositoryProtocols.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementsListRepositoryInput: class {
    var output: AchievementsListRepositoryOutput? { get set }
    func get(for ids: [String])
}

// sourcery: AutoMockableBusinessLogic
public protocol AchievementsListRepositoryOutput: class {
    func didGet(achievements: [AchievementResponseProtocol])
    func didHandleError(error: AchievementsListRepositoryError)
}

public enum AchievementsListRepositoryError {
    case unknown
    case network
    case server
}

// sourcery: AutoMockableBusinessLogic
public protocol AchievementResponseProtocol {
    var name: String { get }
    var description: String { get }
    var requirement: String { get }
    var iconUrl: String? { get }
}
