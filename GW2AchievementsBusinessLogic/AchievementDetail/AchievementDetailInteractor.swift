//
//  AchievementDetailInteractor.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class AchievementDetailInteractor {
    weak var output: AchievementDetailInteractorOutput?
    private let currentRepository: CurrentAchievementRepositoryInput

    init(currentRepository: CurrentAchievementRepositoryInput) {
        self.currentRepository = currentRepository
    }
}

extension AchievementDetailInteractor: AchievementDetailInteractorInput {

    func retrieve() {
        output?.setDefaultValues()
        currentRepository.get()
    }
}

extension AchievementDetailInteractor: CurrentAchievementRepositoryOutput {
    func didGet(achievement: CurrentAchievementRepositoryResponseProtocol) {
        output?.notifyAchievement(AchievementDetailItem(name: achievement.name,
                                                        description: achievement.description,
                                                        iconUrl: achievement.iconUrl,
                                                        requirement: achievement.requirement))
    }

    func didHandleError() {
        // TODO
    }
}

private struct AchievementDetailItem: AchievementDetailItemProtocol {
    var name: String
    var description: String
    var iconUrl: String?
    var requirement: String
}
