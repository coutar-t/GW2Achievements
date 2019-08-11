//
//  AchievementDetailInteractorModuleFactory.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementDetailInteractorModuleFactoryProtocol {
    func interactor() -> AchievementDetailInteractorInput
}

public class AchievementDetailInteractorModuleFactory: AchievementDetailInteractorModuleFactoryProtocol {
    public init() {}

    public func interactor() -> AchievementDetailInteractorInput {
        let currentRepository = CurrentAchievementRepository.shared
        let interactor = AchievementDetailInteractor(currentRepository: currentRepository)
        currentRepository.output = interactor

        return interactor
    }
}
