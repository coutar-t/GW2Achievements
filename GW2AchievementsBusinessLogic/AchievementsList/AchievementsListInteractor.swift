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
    private var repository: CurrentCategoryRepositoryInput

    init(repository: CurrentCategoryRepositoryInput) {
        self.repository = repository
    }
}

extension AchievementsListInteractor: AchievementsListInteractorInput {
    func retrieve() {}

    func numberOfCategories() -> Int { return 0 }

    func numberOfAchievements(for category: Int) -> Int { return 0 }

    func achievement(at index: Int, for category: Int) -> AchievementItemProtocol? { return nil }


}
