//
//  CategoriesGroupsListInteractorModuleFactory.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CategoriesGroupsListInteractorModuleFactoryProtocol {
    func interactor(repository: CategoriesGroupsListRepositoryInput) -> CategoriesGroupsListInteractorInput
}

public class CategoriesGroupsListInteractorModuleFactory: CategoriesGroupsListInteractorModuleFactoryProtocol {
    public init() {}

    public func interactor(repository: CategoriesGroupsListRepositoryInput) -> CategoriesGroupsListInteractorInput {
        let interactor = CategoriesGroupsListInteractor(repository: repository,
                                                        currentAchievementRepository: CurrentCategoryRepository.shared)
        repository.output = interactor
        return interactor
    }
}
