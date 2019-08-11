//
//  CategoriesGroupsListInteractorInput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CategoryGroupItemProtocol {
    var name: String { get }
}

// sourcery: AutoMockableBusinessLogic
public protocol CategoryItemProtocol {
    var name: String { get }
    var iconUrl: String { get }
}

// sourcery: AutoMockableBusinessLogic
public protocol CategoriesGroupsListInteractorInput: class {
    var output: CategoriesGroupsListInteractorOutput? { get set }

    func retrieve()
    func numberOfCategories() -> Int
    func numberOfCategoriesGroups(for category: Int) -> Int
    func categoryGroup(for category: Int) -> CategoryGroupItemProtocol?
    func category(at index: Int, for category: Int) -> CategoryItemProtocol?
    func selectCategory(at index: Int, for category: Int)
}
