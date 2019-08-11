//
//  AchievementsListPresenterInput.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol AchievementViewModelProtocol {
    var title: NSAttributedString { get }
    var iconUrl: String { get }
}

// sourcery: AutoMockable
protocol AchievementsListPresenterInput {
    var output: AchievementsListPresenterOutput? { get set }
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func viewModel(for row: Int, at section: Int) -> AchievementViewModelProtocol
    func selectRow(for row: Int, at section: Int)
}
