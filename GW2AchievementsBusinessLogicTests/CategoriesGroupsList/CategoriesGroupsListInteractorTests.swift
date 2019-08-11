//
//  CategoriesGroupsListInteractorTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class CategoriesGroupsListInteractorTests: XCTestCase {
    var interactor: CategoriesGroupsListInteractor!
    var output: CategoriesGroupsListInteractorOutputMock!
    var repository: CategoriesGroupsListRepositoryInputMock!

    override func setUp() {
        super.setUp()

        output = CategoriesGroupsListInteractorOutputMock()
        repository = CategoriesGroupsListRepositoryInputMock()
        interactor = CategoriesGroupsListInteractor(repository: repository)
        interactor.output = output
    }

    // MARK: - Retrieve

    func test_whenRetrieve_thenOutputSetDefaultsAndRepositoryGet() {
        // When

        interactor.retrieve()

        // Then

        expect(self.repository.getCallsCount).to(equal(1))
        expect(self.output.setDefaultValuesCallsCount).to(equal(1))

        expect(self.output.notifyLoadingCallsCount).to(equal(1))
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
    }

    // MARK: - NumberOfCategories

    func test_givenNoRetrievedCategory_whenNumberOfCategories_thenReturnZero() {
        // When

        let numberOfCategories = interactor.numberOfCategories()

        // Then

        expect(numberOfCategories).to(equal(0))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
    }

    func test_givenRetrievedCategory_whenNumberOfCategories_thenReturnOne() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: [])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let numberOfCategories = interactor.numberOfCategories()

        // Then

        expect(numberOfCategories).to(equal(1))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
    }

    func test_givenRetrievedCategoryAndGoodCategoryIndex_whenNumberOfCategoriesGroups_thenReturnNumberOfCategoriesGroups() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let numberOfCategoriesGroups = interactor.numberOfCategoriesGroups(for: 1)

        // Then

        expect(numberOfCategoriesGroups).to(equal(2))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
    }

    func test_givenRetrievedCategoryAndWrongCategoryIndex_whenNumberOfCategoriesGroups_thenReturnZero() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let numberOfCategoriesGroups = interactor.numberOfCategoriesGroups(for: 12)

        // Then

        expect(numberOfCategoriesGroups).to(equal(0))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
    }

    func test_givenNoRetrievedCategoryAndGoodCategoryIndex_whenNumberOfCategoriesGroups_thenReturnZero() {
        // When

        let numberOfCategoriesGroups = interactor.numberOfCategoriesGroups(for: 0)

        // Then

        expect(numberOfCategoriesGroups).to(equal(0))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
    }

    // MARK: - CategoryGroup

    func test_givenWrongCategoryGroupIndex_whenCategoryGroup_thenReturnNil() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let categoryGroup = interactor.categoryGroup(for: 12)

        expect(categoryGroup).to(beNil())

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    func test_givenCategoryGroupIndex_whenCategoryGroup_thenReturnCategoryGroup() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let categoryGroup = interactor.categoryGroup(for: 1)

        expect(categoryGroup?.name).to(equal("Tata"))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    // MARK: - Category

    func test_givenWrongCategoryIndex_whenCategory_thenReturnNil() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let category = interactor.category(at: 0, for: 12)

        expect(category).to(beNil())

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    func test_givenWrongIndex_whenCategory_thenReturnNil() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let category = interactor.category(at: 12, for: 1)

        expect(category).to(beNil())

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    func test_givenCategoryIndex_whenCategory_thenReturnCategoryItem() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON2", achievementsIds: [])])]
        interactor.didGet(categoriesGroups: categoriesGroups)

        // When

        let category = interactor.category(at: 1, for: 1)

        expect(category?.name).to(equal("two"))
        expect(category?.iconUrl).to(equal("ICON2"))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    // MARK: - DidGet

    func test_givenCategoriesGroups_whenDidGet_thenUpdateCategories() {
        // Given

        let categoriesGroups = [CategoriesGroupResponseProtocolMock(name: "Toto", categories: []),
                                CategoriesGroupResponseProtocolMock(name: "Tata", categories: [AchievementsCategoryResponseProtocolMock(name: "One", icon: "ICON", achievementsIds: []), AchievementsCategoryResponseProtocolMock(name: "two", icon: "ICON", achievementsIds: [])])]

        // When

        interactor.didGet(categoriesGroups: categoriesGroups)

        // Then

        expect(self.output.updateCategoriesGroupsListCallsCount).to(equal(1))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    func test_givenNoCategoriesGroups_whenDidGet_thenUpdateCategories() {
        // Given

        let categoriesGroups: [CategoriesGroupResponseProtocol] = []

        // When

        interactor.didGet(categoriesGroups: categoriesGroups)

        // Then

        expect(self.output.notifyNoDataErrorCallsCount).to(equal(1))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
    }

    // MARK: - DidHanleError

    func test_givenUnknown_whenDidHandleError_thenOutputUnknownError() {
        // When

        interactor.didHandleError(error: .unknown)

        // Then

        expect(self.output.notifyUnknownErrorCallsCount).to(equal(1))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    func test_givenNetwork_whenDidHandleError_thenOutputNetworkError() {
        // When

        interactor.didHandleError(error: .network)

        // Then

        expect(self.output.notifyNetworkErrorCallsCount).to(equal(1))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyServerErrorCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }

    func test_givenServer_whenDidHandleError_thenOutputServerError() {
        // When

        interactor.didHandleError(error: .server)

        // Then

        expect(self.output.notifyServerErrorCallsCount).to(equal(1))

        expect(self.repository.getCalled).to(beFalse())
        expect(self.output.setDefaultValuesCalled).to(beFalse())
        expect(self.output.notifyLoadingCalled).to(beFalse())
        expect(self.output.notifyUnknownErrorCalled).to(beFalse())
        expect(self.output.notifyNetworkErrorCalled).to(beFalse())
        expect(self.output.updateCategoriesGroupsListCalled).to(beFalse())
        expect(self.output.notifyNoDataErrorCalled).to(beFalse())
    }
}
