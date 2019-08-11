//
//  AchievementsListPresenterOutput.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol AchievementsListPresenterOutput: class {
    func setTitle(title: String)
    func showLoading()
    func hideLoading()
    func updateAchievementsList()
    func showError(with message: String, retryMessage: String)
}
