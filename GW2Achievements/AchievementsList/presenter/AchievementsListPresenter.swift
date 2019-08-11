//
//  AchievementsListPresenter.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class AchievementsListPresenter {
    weak var output: AchievementsListPresenterOutput?
    private let interactor: AchievementsListInteractorInput
    private let router: AchievementsListRouterProtocol

    init(interactor: AchievementsListInteractorInput,
         router: AchievementsListRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }

}

extension AchievementsListPresenter: AchievementsListPresenterInput {

    func viewDidLoad() {
        interactor.retrieve()
    }

    func numberOfSections() -> Int {
        return interactor.numberOfCategories()
    }

    func numberOfRows(in section: Int) -> Int {
        return interactor.numberOfAchievements(for: section)
    }

    func viewModel(for row: Int, at section: Int) -> AchievementViewModelProtocol {
        guard let item = interactor.achievement(at: row, for: section) else {
        return AchievementViewModel(title: NSAttributedString(string: "", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]), iconUrl: "")
        }
        return AchievementViewModel(title: NSAttributedString(string: item.name, attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]), iconUrl: item.iconUrl ?? "")
    }

    func selectRow(for row: Int, at section: Int) {
        interactor.selectAchievement(at: row, for: section)
    }
}

extension AchievementsListPresenter: AchievementsListInteractorOutput {
    func setDefaultValues() {
        output?.setTitle(title: L10n.Achievements.List.Title.default)
    }

    func setTitle(_ title: String) {
        output?.setTitle(title: title)
    }

    func updateAchievementsList() {
        output?.hideLoading()
        output?.updateAchievementsList()
    }

    func routeToAchievementDetail() {
        router.routeToAchievementDetail()
    }

    func notifyLoading() {
        output?.showLoading()
    }

    func notifyServerError() {
        output?.hideLoading()
        output?.showError(with: L10n.Achievements.List.Error.Server.message, retryMessage: L10n.Achievements.List.Error.Server.retry)
    }

    func notifyNetworkError() {
        output?.hideLoading()
        output?.showError(with: L10n.Achievements.List.Error.Network.message, retryMessage: L10n.Achievements.List.Error.Network.retry)

    }

    func notifyUnknownError() {
        output?.hideLoading()
        output?.showError(with: L10n.Achievements.List.Error.Unknown.message, retryMessage: L10n.Achievements.List.Error.Unknown.retry)

    }

    func notifyNoDataError() {
        output?.hideLoading()
        output?.updateAchievementsList()
    }
}

private struct AchievementViewModel: AchievementViewModelProtocol {
    var title: NSAttributedString
    var iconUrl: String
}
