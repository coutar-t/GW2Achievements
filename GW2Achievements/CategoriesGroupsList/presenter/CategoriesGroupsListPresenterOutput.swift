//
//  CategoriesGroupsListPresenterOutput.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol CategoriesGroupsListPresenterOutput: class {
    func setTitle(title: String)
    func showLoading()
    func hideLoading()
    func updateCategoriesGroups()
    func showError(with message: String, retryMessage: String)
}
