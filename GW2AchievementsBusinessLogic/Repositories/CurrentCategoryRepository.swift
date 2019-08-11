//
//  CurrentCategoryRepository.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class CurrentCategoryRepository: CurrentCategoryRepositoryInput {
    weak var output: CurrentCategoryRepositoryOutput?
    private var currentCategory: CurrentCategoryRepositoryResponseProtocol?

    private init() {}

    static let shared = CurrentCategoryRepository()

    func get() {
        guard let currentCategory = self.currentCategory else {
            self.output?.didHandleError()
            return
        }
        self.output?.didGet(category: currentCategory)
    }

    func save(currentCategory request: CurrentCategoryRepositoryRequestProtocol) {
        self.currentCategory = CurrentCategoryRepositoryResponse(name: request.name,
                                                             iconUrl: request.iconUrl,
        achievements: request.achievements)
    }

    func clear() {
        self.currentCategory = nil
    }

}

private struct CurrentCategoryRepositoryResponse: CurrentCategoryRepositoryResponseProtocol {
    var name: String
    var iconUrl: String
    var achievements: [Int]
}
