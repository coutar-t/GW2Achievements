//
//  CurrentAchievementRepository.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class CurrentAchievementRepository: CurrentAchievementRepositoryInput {
    weak var output: CurrentAchievementRepositoryOutput?
    private var currentAchievement: CurrentAchievementRepositoryResponseProtocol?

    private init() {}

    static let shared = CurrentAchievementRepository()

    func get() {
        guard let currentAchievement = self.currentAchievement else {
            self.output?.didHandleError()
            return
        }
        self.output?.didGet(achievement: currentAchievement)
    }

    func save(currentAchievement request: CurrentAchievementRepositoryRequestProtocol) {
        self.currentAchievement = CurrentAchievementRepositoryResponse(name: request.name,
                                                                       description: request.description,
                                                                       requirement: request.requirement,
                                                                       iconUrl: request.iconUrl)
    }

    func clear() {
        self.currentAchievement = nil
    }

}

private struct CurrentAchievementRepositoryResponse: CurrentAchievementRepositoryResponseProtocol {
    var name: String
    var description: String
    var requirement: String
    var iconUrl: String?
}
