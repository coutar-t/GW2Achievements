//
//  AchievementDetailPresenterOutput.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol AchievementDetailPresenterOutput: class {
    func updateView(achievement: AchievementDetailViewModelProtocol)
}

// sourcery: AutoMockable
protocol AchievementDetailViewModelProtocol {
    var name: NSAttributedString { get }
    var description: NSAttributedString { get }
    var iconUrl: String { get }
    var requirement: NSAttributedString { get }
}
