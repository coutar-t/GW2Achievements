//
//  CurrentCategoryRepositoryInput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol CurrentCategoryRepositoryInput: class {
    var output: CurrentCategoryRepositoryOutput? { get set }
    func get()
    func save(currentCategory: CurrentCategoryRepositoryRequestProtocol)
    func clear()
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentCategoryRepositoryOutput: class {
    func didGet(category: CurrentCategoryRepositoryResponseProtocol)
    func didHandleError()
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentCategoryRepositoryResponseProtocol {
    var name: String { get }
    var iconUrl: String { get }
    var achievements: [Int] { get }
}

// sourcery: AutoMockableBusinessLogic
public protocol CurrentCategoryRepositoryRequestProtocol {
    var name: String { get }
    var iconUrl: String { get }
    var achievements: [Int] { get }
}
