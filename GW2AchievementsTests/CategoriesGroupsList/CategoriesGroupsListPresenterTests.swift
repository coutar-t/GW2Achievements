//
//  CategoriesGroupsListPresenterTests.swift
//  GW2AchievementsTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2Achievements

class CategoriesGroupsListPresenterTests: XCTestCase {

    var presenter: CategoriesGroupsListPresenter!
    var interactorMock: CategoriesGroupsListInteractorInputMock!
    var outputMock: CategoriesGroupsListPresenterOutputMock!
    var routerMock: CategoriesGroupsListRouterProtocolMock!

    override func setUp() {
        super.setUp()

        interactorMock = CategoriesGroupsListInteractorInputMock()
        routerMock = CategoriesGroupsListRouterProtocolMock()
        presenter = CategoriesGroupsListPresenter(interactor: interactorMock,
                                                  router: routerMock)
        outputMock = CategoriesGroupsListPresenterOutputMock()
        presenter.output = outputMock
    }

    // MARK: - ViewDidLoad

    func test_whenViewDidLoad_thenInteractorRetrieve() {
        // When

        presenter.viewDidLoad()

        // Then

        expect(self.interactorMock.retrieveCallsCount).to(equal(1))
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())

    }

    // MARK: - NumberOfSections

    func test_whenNumberOfSections_thenInteractorNumberOfCategories() {
        // Given

        interactorMock.numberOfCategoriesReturnValue = 12

        // When

        let sections = presenter.numberOfSections()

        // Then

        expect(sections).to(equal(12))
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCallsCount).to(equal(1))
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    // MARK: - NumberOfCategoriesGroups

    func test_whenNumberOfCategoriesGroups_thenInteractorNumberOfCategoriesGroups() {
        // Given

        interactorMock.numberOfCategoriesGroupsForReturnValue = 12

        // When

        let rows = presenter.numberOfRows(in: 10)

        // Then

        expect(self.interactorMock.numberOfCategoriesGroupsForReceivedCategory).to(equal(10))
        expect(rows).to(equal(12))
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCallsCount).to(equal(1))

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    // MARK: - SectionViewModel

    func test_givenNilItem_whenSectionViewModel_thenReturnDefaultViewModel() {
        // Given

        interactorMock.categoryGroupForReturnValue = nil

        // When

        let viewModel = presenter.sectionViewModel(at: 1)

        // Then

        expect(self.interactorMock.categoryGroupForReceivedCategory).to(equal(1))

        expect(viewModel.title).to(equal(NSAttributedString(string: "", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCallsCount).to(equal(1))
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_givenItem_whenSectionViewModel_thenReturnViewModel() {
        // Given

        interactorMock.categoryGroupForReturnValue = CategoryGroupItemProtocolMock(name: "Toto")

        // When

        let viewModel = presenter.sectionViewModel(at: 1)

        // Then

        expect(self.interactorMock.categoryGroupForReceivedCategory).to(equal(1))

        expect(viewModel.title).to(equal(NSAttributedString(string: "Toto", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCallsCount).to(equal(1))
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())

    }

    // MARK: - ViewModel

    func test_givenNilItem_whenViewModel_thenReturnDefaultViewModel() {
        // Given

        interactorMock.categoryAtForReturnValue = nil

        // When

        let viewModel = presenter.viewModel(for: 1, at: 2)

        // Then

        expect(self.interactorMock.categoryAtForReceivedArguments?.category).to(equal(2))
        expect(self.interactorMock.categoryAtForReceivedArguments?.index).to(equal(1))
        expect(viewModel.iconUrl).to(equal(""))
        expect(viewModel.title).to(equal(NSAttributedString(string: "", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCallsCount).to(equal(1))
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_givenItem_whenViewModel_thenReturnViewModel() {
        // Given

        interactorMock.categoryAtForReturnValue = CategoryItemProtocolMock(name: "Toto", iconUrl: "Icon")

        // When

        let viewModel = presenter.viewModel(for: 1, at: 2)

        // Then

        expect(self.interactorMock.categoryAtForReceivedArguments?.category).to(equal(2))
        expect(self.interactorMock.categoryAtForReceivedArguments?.index).to(equal(1))
        expect(viewModel.iconUrl).to(equal("Icon"))
        expect(viewModel.title).to(equal(NSAttributedString(string: "Toto", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCallsCount).to(equal(1))
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    // MARK: - SetDefaultValues

    func test_whenSetDefaultValues_thenOutputSetTitle() {
        // When

        presenter.setDefaultValues()

        // Then

        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal(L10n.Categories.List.title))
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    // MARK: - UpdateCategoriesGroupsList

    func test_whenUpdateCategoriesGroupsList_thenOutputUpdateCategoriesGroupsAndHideLoading() {
        // When

        presenter.updateCategoriesGroupsList()

        // Then

        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.updateCategoriesGroupsCallsCount).to(equal(1))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyLoading_thenOutputShowLoading() {
        // When

        presenter.notifyLoading()

        // Then

        expect(self.outputMock.showLoadingCallsCount).to(equal(1))
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyServerError_thenOutputHideLoadingAndShowError() {
        // When

        presenter.notifyServerError()

        // Then
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal(L10n.Categories.List.Error.Server.message))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal(L10n.Categories.List.Error.Server.retry))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyNetworkError_thenOutputHideLoadingAndShowError() {
        // When

        presenter.notifyNetworkError()

        // Then
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal(L10n.Categories.List.Error.Network.message))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal(L10n.Categories.List.Error.Network.retry))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyUnknownError_thenOutputHideLoadingAndShowError() {
        // When

        presenter.notifyUnknownError()

        // Then
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal(L10n.Categories.List.Error.Unknown.message))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal(L10n.Categories.List.Error.Unknown.retry))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyNoDataError_thenOutputHideLoadingAndUpdateCategories() {
        // When

        presenter.notifyNoDataError()

        // Then
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.updateCategoriesGroupsCallsCount).to(equal(1))
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())
    }

    // MARK: - RouteToAchievementsList

    func test_whenRouteToAchievementsList_thenRouterRouteToAchievementsList() {
        // When

        presenter.routeToAchievementsList()

        // Then
        expect(self.routerMock.routeToAchievementsListCallsCount).to(equal(1))

        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
    }

    // MARK: - SelectRow

    func test_whenSelectRow_thenInteractorSelectCategory() {
        // When

        presenter.selectRow(for: 5, at: 6)

        // Then

        expect(self.interactorMock.selectCategoryAtForCallsCount).to(equal(1))
        expect(self.interactorMock.selectCategoryAtForReceivedArguments?.category).to(equal(6))
        expect(self.interactorMock.selectCategoryAtForReceivedArguments?.index).to(equal(5))
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateCategoriesGroupsCalled).to(beFalse())
        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.categoryAtForCalled).to(beFalse())
        expect(self.interactorMock.categoryGroupForCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesGroupsForCalled).to(beFalse())

        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.routerMock.routeToAchievementsListCalled).to(beFalse())

    }

}
