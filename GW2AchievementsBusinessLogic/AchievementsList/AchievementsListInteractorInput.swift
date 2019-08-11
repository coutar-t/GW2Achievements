//
//  AchievementsListInteractorInput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementItemProtocol {
    var name: String { get }
    var iconUrl: String? { get }
}

// sourcery: AutoMockableBusinessLogic
public protocol AchievementsListInteractorInput: class {
    var output: AchievementsListInteractorOutput? { get set }

    func retrieve()
    func numberOfCategories() -> Int
    func numberOfAchievements(for category: Int) -> Int
    func achievement(at index: Int, for category: Int) -> AchievementItemProtocol?
    func selectAchievement(at index: Int, for category: Int)
}
