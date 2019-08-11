//
//  GetAchievementCategoriesListProtocol.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

protocol GetAchievementsCategoriesListAPIWrapperProtocol {
    func fetchAchievementsCategories(success: @escaping ([AchievementCategoryItem]) -> Void,
                                 failure: @escaping (Error) -> Void)
}
