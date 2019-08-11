//
//  CategoriesGroupsListRepositoryProtocol.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CategoriesGroupsListRepositoryInput: class {
    var output: CategoriesGroupsListRepositoryOutput? { get set }
    func get()
}

// sourcery: AutoMockableBusinessLogic
public protocol CategoriesGroupsListRepositoryOutput: class {
    func didGet(categoriesGroups: [CategoriesGroupResponseProtocol])
    func didHandleError(error: CategoriesGroupsListRepositoryError)
}

public enum CategoriesGroupsListRepositoryError {
    case unknown
    case network
    case server
}

// sourcery: AutoMockableBusinessLogic
public protocol CategoriesGroupResponseProtocol {
    var name: String { get }
    var categories: [AchievementsCategoryResponseProtocol] { get }

}

// sourcery: AutoMockableBusinessLogic
public protocol AchievementsCategoryResponseProtocol {
    var name: String { get }
    var icon: String { get }
    var achievementsIds: [Int] { get }
}
