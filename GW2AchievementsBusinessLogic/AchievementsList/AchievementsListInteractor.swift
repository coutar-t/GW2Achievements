//
//  AchievementsListInteractor.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class AchievementsListInteractor {
    var output: AchievementsListInteractorOutput?
    private var currentRepository: CurrentCategoryRepositoryInput
    private var repository: AchievementsListRepositoryInput
    private var achievements: [AchievementItemProtocol] = []

    init(currentRepository: CurrentCategoryRepositoryInput,
         repository: AchievementsListRepositoryInput) {
        self.currentRepository = currentRepository
        self.repository = repository
    }
}

extension AchievementsListInteractor: AchievementsListInteractorInput {
    func retrieve() {
        output?.setDefaultValues()
        output?.notifyLoading()
        currentRepository.get()
    }

    func numberOfCategories() -> Int {
        guard achievements.count > 0 else { return 0 }
        return 1
    }

    func numberOfAchievements(for category: Int) -> Int {
        guard category == 0 else { return 0 }
        return achievements.count
    }

    func achievement(at index: Int, for category: Int) -> AchievementItemProtocol? {
        guard category == 0,
            index < achievements.count else {
                return nil
        }
        return achievements[index]
    }
}

extension AchievementsListInteractor: CurrentCategoryRepositoryOutput {
    func didGet(category: CurrentCategoryRepositoryResponseProtocol) {
        self.output?.setTitle(category.name)
        self.repository.get(for: category.achievements.map { "\($0)" })
    }

    func didHandleError() {
        output?.notifyUnknownError()
    }
}

extension AchievementsListInteractor: AchievementsListRepositoryOutput {
    func didGet(achievements: [AchievementResponseProtocol]) {
        guard achievements.count > 0 else {
            output?.notifyNoDataError()
            return
        }
        self.achievements = achievements.map({ AchievementItem(name: $0.name, iconUrl: $0.iconUrl) })
        output?.updateAchievementsList()
    }

    func didHandleError(error: AchievementsListRepositoryError) {
        switch error {
        case .network:
            output?.notifyNetworkError()
        case .server:
            output?.notifyServerError()
        case .unknown:
            output?.notifyUnknownError()
        }
    }
}

private struct AchievementItem: AchievementItemProtocol {
    var name: String
    var iconUrl: String?
}
