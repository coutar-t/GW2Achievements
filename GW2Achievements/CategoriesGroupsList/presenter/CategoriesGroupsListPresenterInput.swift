//
//  CategoriesGroupsListPresenterInput.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockable
protocol CategoriesGroupViewModelProtocol {
    var title: NSAttributedString { get }
}

protocol CategoryViewModelProtocol {
    var title: NSAttributedString { get }
    var iconUrl: String { get }
}

// sourcery: AutoMockable
protocol CategoriesGroupsListPresenterInput {
    var output: CategoriesGroupsListPresenterOutput? { get set }
    func viewDidLoad()
    func numberOfSections() -> Int
    func numberOfRows(in section: Int) -> Int
    func sectionViewModel(at section: Int) -> CategoriesGroupViewModelProtocol
    func viewModel(for row: Int, at section: Int) -> CategoryViewModelProtocol
    func selectRow(for row: Int, at section: Int)
}
