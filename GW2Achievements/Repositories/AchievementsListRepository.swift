//
//  AchievementsListRepository.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class AchievementsListRepository: AchievementsListRepositoryInput {
    var output: AchievementsListRepositoryOutput?
    private var getAchievementsListAPIWrapper: GetAchievementsListAPIWrapperProtocol

    init(getAchievementsListAPIWrapper: GetAchievementsListAPIWrapperProtocol) {
        self.getAchievementsListAPIWrapper = getAchievementsListAPIWrapper
    }

    func get(for ids: [String]) {
        getAchievementsListAPIWrapper.fetchAchievements(ids: ids, success: { [weak self] (items) in
            self?.output?.didGet(achievements: items.map({ AchievementResponse(name: $0.name, description: $0.description, requirement: $0.requirement, iconUrl: $0.icon)}))
        }) { [weak self] (error) in
            self?.output?.didHandleError(error: .unknown)
        }
    }
}

private struct AchievementResponse: AchievementResponseProtocol {
    var name: String
    var description: String
    var requirement: String
    var iconUrl: String?
}
