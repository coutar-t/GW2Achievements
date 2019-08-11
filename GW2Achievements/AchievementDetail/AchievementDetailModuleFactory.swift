//
//  AchievementDetailModuleFactory.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class AchievementDetailModuleFactory {
    func makeView() -> AchievementDetailViewController {
        let viewController = StoryboardScene.AchievementDetailViewController.achievementDetailViewController.instantiate()

        let interactor = AchievementDetailInteractorModuleFactory().interactor()

        let presenter = AchievementDetailPresenter(interactor: interactor)
        presenter.output = viewController
        interactor.output = presenter
        viewController.presenter = presenter

        return viewController
    }
}
