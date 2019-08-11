//
//  CategoriesGroupsListRepository.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class CategoriesGroupsListRepository: CategoriesGroupsListRepositoryInput {
    var output: CategoriesGroupsListRepositoryOutput?
    private var getCategoriesGroupsListAPIWrapper: GetCategoriesGroupsListAPIWrapperProtocol
    private var getAchievementCategoriesListAPIWrapper: GetAchievementsCategoriesListAPIWrapperProtocol

    init(getCategoriesGroupsListAPIWrapper: GetCategoriesGroupsListAPIWrapperProtocol,
         getAchievementCategoriesListAPIWrapper: GetAchievementsCategoriesListAPIWrapperProtocol) {
        self.getCategoriesGroupsListAPIWrapper = getCategoriesGroupsListAPIWrapper
        self.getAchievementCategoriesListAPIWrapper =  getAchievementCategoriesListAPIWrapper
    }

    func get() {
        getCategoriesGroupsListAPIWrapper.fetchAchievementsGroups(success: { [weak self] (groups) in

            self?.getAchievementCategoriesListAPIWrapper.fetchAchievementsCategories(success: { (categories) in
                let orderedCategories = Dictionary(uniqueKeysWithValues: categories.map({ ($0.id, $0) }))

                let result = groups.map({ group in
                    CategoriesGroupResponse(name: group.name, categories: group.categories.compactMap({ categoryId in
                        guard let category = orderedCategories[categoryId] else { return nil }
                        return AchievementsCategoryResponse(name: category.name, icon: category.icon, achievementsIds: category.achievements)
                        }))
                })
                self?.output?.didGet(categoriesGroups: result)

            }, failure: { [weak self] (error) in
                self?.output?.didHandleError(error: .unknown)
            })
        }) { [weak self] (error) in
            self?.output?.didHandleError(error: .unknown)
        }
    }
}

private struct CategoriesGroupResponse: CategoriesGroupResponseProtocol {
    var name: String
    var categories: [AchievementsCategoryResponseProtocol]
}

private struct AchievementsCategoryResponse: AchievementsCategoryResponseProtocol {
    var name: String
    var icon: String
    var achievementsIds: [Int]
}
