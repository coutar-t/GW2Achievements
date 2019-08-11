//
//  CategoriesGroupsListPresenter.swift
//  GW2 Achievements
//
//  Created by Thibaut Coutard on 09/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class CategoriesGroupsListPresenter {
    weak var output: CategoriesGroupsListPresenterOutput?
    private let interactor: CategoriesGroupsListInteractorInput
    private let router: CategoriesGroupsListRouterProtocol

    init(interactor: CategoriesGroupsListInteractorInput,
         router: CategoriesGroupsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
}

extension CategoriesGroupsListPresenter: CategoriesGroupsListPresenterInput {
    func viewDidLoad() {
        interactor.retrieve()
    }

    func numberOfSections() -> Int {
        return interactor.numberOfCategories()
    }

    func numberOfRows(in section: Int) -> Int {
        return interactor.numberOfCategoriesGroups(for: section)
    }

    func sectionViewModel(at section: Int) -> CategoriesGroupViewModelProtocol {
        guard let item = interactor.categoryGroup(for: section) else {
            return CategoriesGroupViewModel(title: NSAttributedString(string: "", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]))
        }
        return CategoriesGroupViewModel(title: NSAttributedString(string: item.name, attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]))
    }

    func viewModel(for row: Int, at section: Int) -> CategoryViewModelProtocol {
        guard let item = interactor.category(at: row, for: section) else {
            return CategoryViewModel(title: NSAttributedString(string: "", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]), iconUrl: "")
        }
        return CategoryViewModel(title: NSAttributedString(string: item.name, attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]), iconUrl: item.iconUrl)
    }

    func selectRow(for row: Int, at section: Int) {
        interactor.selectCategory(at: row, for: section)
    }
}

extension CategoriesGroupsListPresenter: CategoriesGroupsListInteractorOutput {
    func setDefaultValues() {
        output?.setTitle(title: L10n.Categories.List.title)
    }

    func updateCategoriesGroupsList() {
        self.output?.hideLoading()
        self.output?.updateCategoriesGroups()
    }

    func notifyLoading() {
        self.output?.showLoading()
    }

    func notifyServerError() {
        self.output?.hideLoading()
        self.output?.showError(with: L10n.Categories.List.Error.Server.message, retryMessage: L10n.Categories.List.Error.Server.retry)
    }

    func notifyNetworkError() {
        self.output?.hideLoading()
        self.output?.showError(with: L10n.Categories.List.Error.Network.message, retryMessage: L10n.Categories.List.Error.Network.retry)
    }

    func notifyUnknownError() {
        self.output?.hideLoading()
        self.output?.showError(with: L10n.Categories.List.Error.Unknown.message, retryMessage: L10n.Categories.List.Error.Unknown.retry)
    }

    func notifyNoDataError() {
        self.output?.hideLoading()
        self.output?.updateCategoriesGroups()
    }

    func routeToAchievementsList() {
        router.routeToAchievementsList()
    }
}

struct CategoriesGroupViewModel: CategoriesGroupViewModelProtocol {
    var title: NSAttributedString
}

struct CategoryViewModel: CategoryViewModelProtocol {
    var title: NSAttributedString
    var iconUrl: String
}
