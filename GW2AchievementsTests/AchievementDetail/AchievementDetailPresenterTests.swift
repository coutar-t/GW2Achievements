//
//  AchievementDetailPresenterTests.swift
//  GW2AchievementsTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2Achievements

class AchievementDetailPresenterTests: XCTestCase {

    var presenter: AchievementDetailPresenter!
    var interactor: AchievementDetailInteractorInputMock!
    var output: AchievementDetailPresenterOutputMock!

    override func setUp() {
        super.setUp()

        interactor = AchievementDetailInteractorInputMock()
        output = AchievementDetailPresenterOutputMock()
        presenter = AchievementDetailPresenter(interactor: interactor)
        presenter.output = output
    }

    // MARK: - viewDidLoad

    func test_whenViewDidLoad_thenInteractorRetrieve() {
        // When

        presenter.viewDidLoad()

        // Then

        expect(self.interactor.retrieveCallsCount).to(equal(1))
        expect(self.output.updateViewAchievementCalled).to(beFalse())
    }

    func test_whenSetDefaultValues_thenOutputDoNothing() {
        // When

        presenter.setDefaultValues()

        // Then

        expect(self.interactor.retrieveCalled).to(beFalse())
        expect(self.output.updateViewAchievementCalled).to(beFalse())

    }

    func test_whenNotifyAchievement_thenOutputUpdateAchievement() {
        // When

        presenter.notifyAchievement(AchievementDetailItemProtocolMock(name: "Name", description: "Description", iconUrl: "iconUrl", requirement: "Requirement"))

        // Then

        expect(self.interactor.retrieveCalled).to(beFalse())
        expect(self.output.updateViewAchievementCallsCount).to(equal(1))
        expect(self.output.updateViewAchievementReceivedAchievement?.name).to(equal(NSAttributedString(string: "Name", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))
        expect(self.output.updateViewAchievementReceivedAchievement?.description).to(equal(NSAttributedString(string: "Description", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])))
        expect(self.output.updateViewAchievementReceivedAchievement?.requirement).to(equal(NSAttributedString(string: "Requirement", attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1)])))
        expect(self.output.updateViewAchievementReceivedAchievement?.iconUrl).to(equal("iconUrl"))
    }

    func test_givenNoUrl_whenNotifyAchievement_thenOutputUpdateAchievement() {
        // When

        presenter.notifyAchievement(AchievementDetailItemProtocolMock(name: "Name", description: "Description", iconUrl: nil, requirement: "Requirement"))

        // Then

        expect(self.interactor.retrieveCalled).to(beFalse())
        expect(self.output.updateViewAchievementCallsCount).to(equal(1))
        expect(self.output.updateViewAchievementReceivedAchievement?.name).to(equal(NSAttributedString(string: "Name", attributes: [.font: UIFont.preferredFont(forTextStyle: .title1)])))
        expect(self.output.updateViewAchievementReceivedAchievement?.description).to(equal(NSAttributedString(string: "Description", attributes: [.font: UIFont.preferredFont(forTextStyle: .body)])))
        expect(self.output.updateViewAchievementReceivedAchievement?.requirement).to(equal(NSAttributedString(string: "Requirement", attributes: [.font: UIFont.preferredFont(forTextStyle: .caption1)])))
        expect(self.output.updateViewAchievementReceivedAchievement?.iconUrl).to(equal(""))
    }
}
