//
//  AchievementDetailPresenter.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import GW2AchievementsBusinessLogic

class AchievementDetailPresenter {
    weak var output: AchievementDetailPresenterOutput?
    private var interactor: AchievementDetailInteractorInput

    init(interactor: AchievementDetailInteractorInput) {
        self.interactor = interactor
    }
}

extension AchievementDetailPresenter: AchievementDetailPresenterInput {
    func viewDidLoad() {
        interactor.retrieve()
    }
}

extension AchievementDetailPresenter: AchievementDetailInteractorOutput {
    func setDefaultValues() {
    }

    func notifyAchievement(_ achievement: AchievementDetailItemProtocol) {
        output?.updateView(achievement: AchievementDetailViewModel(name: NSAttributedString(string: achievement.name, attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)]), description: NSAttributedString(string: achievement.description, attributes: [.font: UIFont.preferredFont(forTextStyle: .body)]), iconUrl: achievement.iconUrl ?? "", requirement: NSAttributedString(string: achievement.requirement, attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1)])))
    }
}

private struct AchievementDetailViewModel: AchievementDetailViewModelProtocol {
    var name: NSAttributedString
    var description: NSAttributedString
    var iconUrl: String
    var requirement: NSAttributedString
}
