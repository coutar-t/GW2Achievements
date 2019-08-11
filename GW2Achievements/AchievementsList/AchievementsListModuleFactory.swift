//
//  AchievementListModuleFactory.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class AchievementListModuleFactory {
    func makeView() -> AchievementsListViewController {
        let viewController = StoryboardScene.AchievementsListViewController.achievementsListViewController.instantiate()

        let apiWrapper = APIWrapper()
        let locale = Locale.current

        let getAchievementsListAPIWrapper = GetAchievementsListAPIWrapper(apiWrapper: apiWrapper, locale: locale)

        let repository = AchievementsListRepository(getAchievementsListAPIWrapper: getAchievementsListAPIWrapper)

        let interactor = AchievementsListInteractorModuleFactory().interactor(repository: repository)

        let presenter = AchievementsListPresenter(interactor: interactor)
        presenter.output = viewController
        interactor.output = presenter
        viewController.presenter = presenter

        return viewController
    }
}
