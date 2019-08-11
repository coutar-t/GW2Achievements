//
//  CategoriesGroupsListModuleFactory.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class CategoriesGroupsListModuleFactory {
    func makeView() -> CategoriesGroupsListViewController {
        let viewController = StoryboardScene.CategoriesGroupsListViewController.categoriesGroupsListViewController.instantiate()

        let apiWrapper = APIWrapper()


        let getCategoriesGroupsListapiWrapper = GetCategoriesGroupsListAPIWrapper(apiWrapper: apiWrapper, locale: Locale.current)
        let getAchievementsCategoriesListAPIWrapper = GetAchievementsCategoriesListAPIWrapper(apiWrapper: apiWrapper, locale: Locale.current)

        let repository = CategoriesGroupsListRepository(getCategoriesGroupsListAPIWrapper: getCategoriesGroupsListapiWrapper,
                                                        getAchievementCategoriesListAPIWrapper: getAchievementsCategoriesListAPIWrapper)

        let interactor = CategoriesGroupsListInteractorModuleFactory().interactor(repository: repository)
        let router = CategoriesGroupsListRouter()
        router.parentViewController = viewController

        let presenter = CategoriesGroupsListPresenter(interactor: interactor, router: router)
        interactor.output = presenter

        viewController.presenter = presenter
        presenter.output = viewController

        return viewController
    }
}
