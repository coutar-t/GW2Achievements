//
//  CategoriesGroupsListInteractor.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class CategoriesGroupsListInteractor {
    weak var output: CategoriesGroupsListInteractorOutput?
    private let repository: CategoriesGroupsListRepositoryInput
    private var categoriesGroups: [CategoryGroupItem] = []

    init(repository: CategoriesGroupsListRepositoryInput) {
        self.repository = repository
    }
}

extension CategoriesGroupsListInteractor: CategoriesGroupsListInteractorInput {
    func retrieve() {
        output?.setDefaultValues()
        output?.notifyLoading()
        repository.get()
    }

    func numberOfCategories() -> Int {
        return categoriesGroups.count
    }

    func numberOfCategoriesGroups(for category: Int) -> Int {
        guard category < categoriesGroups.count else { return 0}
        return categoriesGroups[category].categories.count
    }

    func categoryGroup(for category: Int) -> CategoryGroupItemProtocol? {
        guard category < categoriesGroups.count else { return nil }
        return categoriesGroups[category]
    }

    func category(at index: Int, for category: Int) -> CategoryItemProtocol? {
        guard category < categoriesGroups.count,
            index < categoriesGroups[category].categories.count else { return nil }
        return categoriesGroups[category].categories[index]
    }
}

extension CategoriesGroupsListInteractor: CategoriesGroupsListRepositoryOutput {
    func didGet(categoriesGroups: [CategoriesGroupResponseProtocol]) {
        self.categoriesGroups = categoriesGroups.map({ CategoryGroupItem(name: $0.name, categories: $0.categories.map({ CategoryItem(name: $0.name, iconUrl: $0.icon) })) })
        guard !categoriesGroups.isEmpty else {
            output?.notifyNoDataError()
            return
        }
        output?.updateCategoriesGroupsList()
    }

    func didHandleError(error: CategoriesGroupsListRepositoryError) {
        switch error {
        case .network:
            output?.notifyNetworkError()
        case .server:
            output?.notifyServerError()
        case .unknown:
            output?.notifyUnknownError()
        }
    }
}

private struct CategoryGroupItem: CategoryGroupItemProtocol {
    var name: String
    var categories: [CategoryItem]
}

private struct CategoryItem: CategoryItemProtocol {
    var name: String
    var iconUrl: String
}
