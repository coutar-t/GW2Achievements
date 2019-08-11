//
//  AchievementsListPresenterTests.swift
//  GW2AchievementsTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2Achievements

class AchievementsListPresenterTests: XCTestCase {
    var presenter: AchievementsListPresenter!
    var interactorMock: AchievementsListInteractorInputMock!
    var outputMock: AchievementsListPresenterOutputMock!

    override func setUp() {
        super.setUp()

        interactorMock = AchievementsListInteractorInputMock()
        presenter = AchievementsListPresenter(interactor: interactorMock)
        outputMock = AchievementsListPresenterOutputMock()
        presenter.output = outputMock
    }

    // MARK: - ViewDidLoad

    func test_whenViewDidLoad_thenInteractorRetrieve() {
        // When

        presenter.viewDidLoad()

        // Then


        expect(self.interactorMock.retrieveCallsCount).to(equal(1))

        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - NumberOfSections

    func test_whenNumberOfSections_thenInteractorNumberOfCategories() {
        // Given

        interactorMock.numberOfCategoriesReturnValue = 12

        // When

        let sections = presenter.numberOfSections()

        // Then

        expect(sections).to(equal(12))
        expect(self.interactorMock.numberOfCategoriesCallsCount).to(equal(1))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - NumberOfRows

    func test_whenNumberOfRows_thenInteractorNumberOfAchievements() {
        // Given

        interactorMock.numberOfAchievementsForReturnValue = 12

        // When

        let achievements = presenter.numberOfRows(in: 9)

        // Then

        expect(achievements).to(equal(12))
        expect(self.interactorMock.numberOfAchievementsForCallsCount).to(equal(1))
        expect(self.interactorMock.numberOfAchievementsForReceivedCategory).to(equal(9))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - ViewModel

    func test_givenNilItem_whenViewModel_thenReturnDefaultViewModel() {
        // Given

        interactorMock.achievementAtForReturnValue = nil

        // When

        let viewModel = presenter.viewModel(for: 5, at: 6)

        // Then

        expect(viewModel.iconUrl).to(equal(""))
        expect(viewModel.title).to(equal(NSAttributedString(string: "", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))
        expect(self.interactorMock.achievementAtForCallsCount).to(equal(1))
        expect(self.interactorMock.achievementAtForReceivedArguments?.category).to(equal(6))
        expect(self.interactorMock.achievementAtForReceivedArguments?.index).to(equal(5))


        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    func test_givenItemNoUrl_whenViewModel_thenReturnDefaultViewModel() {
        // Given

        interactorMock.achievementAtForReturnValue = AchievementItemProtocolMock(name: "Name", iconUrl: nil)

        // When

        let viewModel = presenter.viewModel(for: 5, at: 6)

        // Then

        expect(viewModel.iconUrl).to(equal(""))
        expect(viewModel.title).to(equal(NSAttributedString(string: "Name", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))
        expect(self.interactorMock.achievementAtForCallsCount).to(equal(1))
        expect(self.interactorMock.achievementAtForReceivedArguments?.category).to(equal(6))
        expect(self.interactorMock.achievementAtForReceivedArguments?.index).to(equal(5))


        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    func test_givenItem_whenViewModel_thenReturnDefaultViewModel() {
        // Given

        interactorMock.achievementAtForReturnValue = AchievementItemProtocolMock(name: "Name", iconUrl: "Icon")

        // When

        let viewModel = presenter.viewModel(for: 5, at: 6)

        // Then

        expect(viewModel.iconUrl).to(equal("Icon"))
        expect(viewModel.title).to(equal(NSAttributedString(string: "Name", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))
        expect(self.interactorMock.achievementAtForCallsCount).to(equal(1))
        expect(self.interactorMock.achievementAtForReceivedArguments?.category).to(equal(6))
        expect(self.interactorMock.achievementAtForReceivedArguments?.index).to(equal(5))


        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())

        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - SetDefaultValues

    func test_whenSetDefaultValues_thenOutputSetTitle() {
        // When

        presenter.setDefaultValues()

        // Then
        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal(L10n.Achievements.List.Title.default))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - SetTitle

    func test_whenSetTitle_thenOutputSetTitle() {
        // When

        presenter.setTitle("Title")

        // Then
        expect(self.outputMock.setTitleTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleTitleReceivedTitle).to(equal("Title"))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - UpdateAchievementsList

    func test_whenUpdateAchievementsList_thenOutputUpdateAchievementsList() {
        // When

        presenter.updateAchievementsList()

        // Then
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - NotifyLoading

    func test_whenNotifyLoading_thenOutputShowLoading() {
        // When

        presenter.notifyLoading()

        // Then
        
        expect(self.outputMock.showLoadingCallsCount).to(equal(1))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.hideLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
    }

    // MARK: - NotifyServerError

    func test_whenNotifyServerError_thenOutputShowError() {
        // When

        presenter.notifyServerError()

        // Then

        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal(L10n.Achievements.List.Error.Server.message))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal(L10n.Achievements.List.Error.Server.retry))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyNetworkError_thenOutputShowError() {
        // When

        presenter.notifyNetworkError()

        // Then

        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal(L10n.Achievements.List.Error.Network.message))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal(L10n.Achievements.List.Error.Network.retry))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyUnknownError_thenOutputShowError() {
        // When

        presenter.notifyUnknownError()

        // Then

        expect(self.outputMock.showErrorWithRetryMessageCallsCount).to(equal(1))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.message).to(equal(L10n.Achievements.List.Error.Unknown.message))
        expect(self.outputMock.showErrorWithRetryMessageReceivedArguments?.retryMessage).to(equal(L10n.Achievements.List.Error.Unknown.retry))
        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
    }

    func test_whenNotifyNoDataError_thenOutputHideLoadingUpdateAchievements() {
        // When

        presenter.notifyNoDataError()

        // Then

        expect(self.outputMock.hideLoadingCallsCount).to(equal(1))
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))

        expect(self.interactorMock.retrieveCalled).to(beFalse())
        expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
        expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
        expect(self.interactorMock.achievementAtForCalled).to(beFalse())
        expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())
        expect(self.outputMock.setTitleTitleCalled).to(beFalse())
        expect(self.outputMock.showLoadingCalled).to(beFalse())
    }
}

/*
 expect(self.interactorMock.retrieveCalled).to(beFalse())
 expect(self.interactorMock.numberOfCategoriesCalled).to(beFalse())
 expect(self.interactorMock.numberOfAchievementsForCalled).to(beFalse())
 expect(self.interactorMock.achievementAtForCalled).to(beFalse())

 expect(self.outputMock.setTitleTitleCalled).to(beFalse())
 expect(self.outputMock.showLoadingCalled).to(beFalse())
 expect(self.outputMock.hideLoadingCalled).to(beFalse())
 expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
 expect(self.outputMock.showErrorWithRetryMessageCalled).to(beFalse())

 */
