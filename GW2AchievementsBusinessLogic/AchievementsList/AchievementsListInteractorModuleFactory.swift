//
//  AchievementsListInteractorModuleFactory.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementsListInteractorModuleFactoryProtocol {
    func interactor(repository: AchievementsListRepositoryInput) -> AchievementsListInteractorInput
}

public class AchievementsListInteractorModuleFactory: AchievementsListInteractorModuleFactoryProtocol {
    public init() {}

    public func interactor(repository: AchievementsListRepositoryInput) -> AchievementsListInteractorInput {
        let currentRepository = CurrentCategoryRepository.shared
        let currentAchievementRepository = CurrentAchievementRepository.shared
        let interactor = AchievementsListInteractor(currentRepository: currentRepository, repository: repository, currentAchievementRepository: currentAchievementRepository)
        currentRepository.output = interactor
        repository.output = interactor

        return interactor
    }
}
