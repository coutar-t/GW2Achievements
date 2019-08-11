// Generated using Sourcery 0.16.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import GW2AchievementsBusinessLogic
@testable import GW2Achievements
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class AchievementDetailPresenterInputMock: AchievementDetailPresenterInput {
    var output: AchievementDetailPresenterOutput?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

}
class AchievementDetailPresenterOutputMock: AchievementDetailPresenterOutput {

    //MARK: - updateView

    var updateViewAchievementCallsCount = 0
    var updateViewAchievementCalled: Bool {
        return updateViewAchievementCallsCount > 0
    }
    var updateViewAchievementReceivedAchievement: AchievementDetailViewModelProtocol?
    var updateViewAchievementReceivedInvocations: [AchievementDetailViewModelProtocol] = []
    var updateViewAchievementClosure: ((AchievementDetailViewModelProtocol) -> Void)?

    func updateView(achievement: AchievementDetailViewModelProtocol) {
        updateViewAchievementCallsCount += 1
        updateViewAchievementReceivedAchievement = achievement
        updateViewAchievementReceivedInvocations.append(achievement)
        updateViewAchievementClosure?(achievement)
    }

}
class AchievementDetailViewModelProtocolMock: AchievementDetailViewModelProtocol {
    var name: NSAttributedString {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: NSAttributedString!
    var description: NSAttributedString {
        get { return underlyingDescription }
        set(value) { underlyingDescription = value }
    }
    var underlyingDescription: NSAttributedString!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!
    var requirement: NSAttributedString {
        get { return underlyingRequirement }
        set(value) { underlyingRequirement = value }
    }
    var underlyingRequirement: NSAttributedString!

    init() {}

    init(name: NSAttributedString, description: NSAttributedString, iconUrl: String, requirement: NSAttributedString) {
      self.name = name
      self.description = description
      self.iconUrl = iconUrl
      self.requirement = requirement
    }
}
class AchievementViewModelProtocolMock: AchievementViewModelProtocol {
    var title: NSAttributedString {
        get { return underlyingTitle }
        set(value) { underlyingTitle = value }
    }
    var underlyingTitle: NSAttributedString!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!

    init() {}

    init(title: NSAttributedString, iconUrl: String) {
      self.title = title
      self.iconUrl = iconUrl
    }
}
class AchievementsListPresenterInputMock: AchievementsListPresenterInput {
    var output: AchievementsListPresenterOutput?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - numberOfSections

    var numberOfSectionsCallsCount = 0
    var numberOfSectionsCalled: Bool {
        return numberOfSectionsCallsCount > 0
    }
    var numberOfSectionsReturnValue: Int!
    var numberOfSectionsClosure: (() -> Int)?

    func numberOfSections() -> Int {
        numberOfSectionsCallsCount += 1
        return numberOfSectionsClosure.map({ $0() }) ?? numberOfSectionsReturnValue
    }

    //MARK: - numberOfRows

    var numberOfRowsInCallsCount = 0
    var numberOfRowsInCalled: Bool {
        return numberOfRowsInCallsCount > 0
    }
    var numberOfRowsInReceivedSection: Int?
    var numberOfRowsInReceivedInvocations: [Int] = []
    var numberOfRowsInReturnValue: Int!
    var numberOfRowsInClosure: ((Int) -> Int)?

    func numberOfRows(in section: Int) -> Int {
        numberOfRowsInCallsCount += 1
        numberOfRowsInReceivedSection = section
        numberOfRowsInReceivedInvocations.append(section)
        return numberOfRowsInClosure.map({ $0(section) }) ?? numberOfRowsInReturnValue
    }

    //MARK: - viewModel

    var viewModelForAtCallsCount = 0
    var viewModelForAtCalled: Bool {
        return viewModelForAtCallsCount > 0
    }
    var viewModelForAtReceivedArguments: (row: Int, section: Int)?
    var viewModelForAtReceivedInvocations: [(row: Int, section: Int)] = []
    var viewModelForAtReturnValue: AchievementViewModelProtocol!
    var viewModelForAtClosure: ((Int, Int) -> AchievementViewModelProtocol)?

    func viewModel(for row: Int, at section: Int) -> AchievementViewModelProtocol {
        viewModelForAtCallsCount += 1
        viewModelForAtReceivedArguments = (row: row, section: section)
        viewModelForAtReceivedInvocations.append((row: row, section: section))
        return viewModelForAtClosure.map({ $0(row, section) }) ?? viewModelForAtReturnValue
    }

    //MARK: - selectRow

    var selectRowForAtCallsCount = 0
    var selectRowForAtCalled: Bool {
        return selectRowForAtCallsCount > 0
    }
    var selectRowForAtReceivedArguments: (row: Int, section: Int)?
    var selectRowForAtReceivedInvocations: [(row: Int, section: Int)] = []
    var selectRowForAtClosure: ((Int, Int) -> Void)?

    func selectRow(for row: Int, at section: Int) {
        selectRowForAtCallsCount += 1
        selectRowForAtReceivedArguments = (row: row, section: section)
        selectRowForAtReceivedInvocations.append((row: row, section: section))
        selectRowForAtClosure?(row, section)
    }

}
class AchievementsListPresenterOutputMock: AchievementsListPresenterOutput {

    //MARK: - setTitle

    var setTitleTitleCallsCount = 0
    var setTitleTitleCalled: Bool {
        return setTitleTitleCallsCount > 0
    }
    var setTitleTitleReceivedTitle: String?
    var setTitleTitleReceivedInvocations: [String] = []
    var setTitleTitleClosure: ((String) -> Void)?

    func setTitle(title: String) {
        setTitleTitleCallsCount += 1
        setTitleTitleReceivedTitle = title
        setTitleTitleReceivedInvocations.append(title)
        setTitleTitleClosure?(title)
    }

    //MARK: - showLoading

    var showLoadingCallsCount = 0
    var showLoadingCalled: Bool {
        return showLoadingCallsCount > 0
    }
    var showLoadingClosure: (() -> Void)?

    func showLoading() {
        showLoadingCallsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    var hideLoadingCallsCount = 0
    var hideLoadingCalled: Bool {
        return hideLoadingCallsCount > 0
    }
    var hideLoadingClosure: (() -> Void)?

    func hideLoading() {
        hideLoadingCallsCount += 1
        hideLoadingClosure?()
    }

    //MARK: - updateAchievementsList

    var updateAchievementsListCallsCount = 0
    var updateAchievementsListCalled: Bool {
        return updateAchievementsListCallsCount > 0
    }
    var updateAchievementsListClosure: (() -> Void)?

    func updateAchievementsList() {
        updateAchievementsListCallsCount += 1
        updateAchievementsListClosure?()
    }

    //MARK: - showError

    var showErrorWithRetryMessageCallsCount = 0
    var showErrorWithRetryMessageCalled: Bool {
        return showErrorWithRetryMessageCallsCount > 0
    }
    var showErrorWithRetryMessageReceivedArguments: (message: String, retryMessage: String)?
    var showErrorWithRetryMessageReceivedInvocations: [(message: String, retryMessage: String)] = []
    var showErrorWithRetryMessageClosure: ((String, String) -> Void)?

    func showError(with message: String, retryMessage: String) {
        showErrorWithRetryMessageCallsCount += 1
        showErrorWithRetryMessageReceivedArguments = (message: message, retryMessage: retryMessage)
        showErrorWithRetryMessageReceivedInvocations.append((message: message, retryMessage: retryMessage))
        showErrorWithRetryMessageClosure?(message, retryMessage)
    }

}
class AchievementsListRouterProtocolMock: AchievementsListRouterProtocol {

    //MARK: - routeToAchievementDetail

    var routeToAchievementDetailCallsCount = 0
    var routeToAchievementDetailCalled: Bool {
        return routeToAchievementDetailCallsCount > 0
    }
    var routeToAchievementDetailClosure: (() -> Void)?

    func routeToAchievementDetail() {
        routeToAchievementDetailCallsCount += 1
        routeToAchievementDetailClosure?()
    }

}
class CategoriesGroupViewModelProtocolMock: CategoriesGroupViewModelProtocol {
    var title: NSAttributedString {
        get { return underlyingTitle }
        set(value) { underlyingTitle = value }
    }
    var underlyingTitle: NSAttributedString!

    init() {}

    init(title: NSAttributedString) {
      self.title = title
    }
}
class CategoriesGroupsListPresenterInputMock: CategoriesGroupsListPresenterInput {
    var output: CategoriesGroupsListPresenterOutput?

    //MARK: - viewDidLoad

    var viewDidLoadCallsCount = 0
    var viewDidLoadCalled: Bool {
        return viewDidLoadCallsCount > 0
    }
    var viewDidLoadClosure: (() -> Void)?

    func viewDidLoad() {
        viewDidLoadCallsCount += 1
        viewDidLoadClosure?()
    }

    //MARK: - numberOfSections

    var numberOfSectionsCallsCount = 0
    var numberOfSectionsCalled: Bool {
        return numberOfSectionsCallsCount > 0
    }
    var numberOfSectionsReturnValue: Int!
    var numberOfSectionsClosure: (() -> Int)?

    func numberOfSections() -> Int {
        numberOfSectionsCallsCount += 1
        return numberOfSectionsClosure.map({ $0() }) ?? numberOfSectionsReturnValue
    }

    //MARK: - numberOfRows

    var numberOfRowsInCallsCount = 0
    var numberOfRowsInCalled: Bool {
        return numberOfRowsInCallsCount > 0
    }
    var numberOfRowsInReceivedSection: Int?
    var numberOfRowsInReceivedInvocations: [Int] = []
    var numberOfRowsInReturnValue: Int!
    var numberOfRowsInClosure: ((Int) -> Int)?

    func numberOfRows(in section: Int) -> Int {
        numberOfRowsInCallsCount += 1
        numberOfRowsInReceivedSection = section
        numberOfRowsInReceivedInvocations.append(section)
        return numberOfRowsInClosure.map({ $0(section) }) ?? numberOfRowsInReturnValue
    }

    //MARK: - sectionViewModel

    var sectionViewModelAtCallsCount = 0
    var sectionViewModelAtCalled: Bool {
        return sectionViewModelAtCallsCount > 0
    }
    var sectionViewModelAtReceivedSection: Int?
    var sectionViewModelAtReceivedInvocations: [Int] = []
    var sectionViewModelAtReturnValue: CategoriesGroupViewModelProtocol!
    var sectionViewModelAtClosure: ((Int) -> CategoriesGroupViewModelProtocol)?

    func sectionViewModel(at section: Int) -> CategoriesGroupViewModelProtocol {
        sectionViewModelAtCallsCount += 1
        sectionViewModelAtReceivedSection = section
        sectionViewModelAtReceivedInvocations.append(section)
        return sectionViewModelAtClosure.map({ $0(section) }) ?? sectionViewModelAtReturnValue
    }

    //MARK: - viewModel

    var viewModelForAtCallsCount = 0
    var viewModelForAtCalled: Bool {
        return viewModelForAtCallsCount > 0
    }
    var viewModelForAtReceivedArguments: (row: Int, section: Int)?
    var viewModelForAtReceivedInvocations: [(row: Int, section: Int)] = []
    var viewModelForAtReturnValue: CategoryViewModelProtocol!
    var viewModelForAtClosure: ((Int, Int) -> CategoryViewModelProtocol)?

    func viewModel(for row: Int, at section: Int) -> CategoryViewModelProtocol {
        viewModelForAtCallsCount += 1
        viewModelForAtReceivedArguments = (row: row, section: section)
        viewModelForAtReceivedInvocations.append((row: row, section: section))
        return viewModelForAtClosure.map({ $0(row, section) }) ?? viewModelForAtReturnValue
    }

    //MARK: - selectRow

    var selectRowForAtCallsCount = 0
    var selectRowForAtCalled: Bool {
        return selectRowForAtCallsCount > 0
    }
    var selectRowForAtReceivedArguments: (row: Int, section: Int)?
    var selectRowForAtReceivedInvocations: [(row: Int, section: Int)] = []
    var selectRowForAtClosure: ((Int, Int) -> Void)?

    func selectRow(for row: Int, at section: Int) {
        selectRowForAtCallsCount += 1
        selectRowForAtReceivedArguments = (row: row, section: section)
        selectRowForAtReceivedInvocations.append((row: row, section: section))
        selectRowForAtClosure?(row, section)
    }

}
class CategoriesGroupsListPresenterOutputMock: CategoriesGroupsListPresenterOutput {

    //MARK: - setTitle

    var setTitleTitleCallsCount = 0
    var setTitleTitleCalled: Bool {
        return setTitleTitleCallsCount > 0
    }
    var setTitleTitleReceivedTitle: String?
    var setTitleTitleReceivedInvocations: [String] = []
    var setTitleTitleClosure: ((String) -> Void)?

    func setTitle(title: String) {
        setTitleTitleCallsCount += 1
        setTitleTitleReceivedTitle = title
        setTitleTitleReceivedInvocations.append(title)
        setTitleTitleClosure?(title)
    }

    //MARK: - showLoading

    var showLoadingCallsCount = 0
    var showLoadingCalled: Bool {
        return showLoadingCallsCount > 0
    }
    var showLoadingClosure: (() -> Void)?

    func showLoading() {
        showLoadingCallsCount += 1
        showLoadingClosure?()
    }

    //MARK: - hideLoading

    var hideLoadingCallsCount = 0
    var hideLoadingCalled: Bool {
        return hideLoadingCallsCount > 0
    }
    var hideLoadingClosure: (() -> Void)?

    func hideLoading() {
        hideLoadingCallsCount += 1
        hideLoadingClosure?()
    }

    //MARK: - updateCategoriesGroups

    var updateCategoriesGroupsCallsCount = 0
    var updateCategoriesGroupsCalled: Bool {
        return updateCategoriesGroupsCallsCount > 0
    }
    var updateCategoriesGroupsClosure: (() -> Void)?

    func updateCategoriesGroups() {
        updateCategoriesGroupsCallsCount += 1
        updateCategoriesGroupsClosure?()
    }

    //MARK: - showError

    var showErrorWithRetryMessageCallsCount = 0
    var showErrorWithRetryMessageCalled: Bool {
        return showErrorWithRetryMessageCallsCount > 0
    }
    var showErrorWithRetryMessageReceivedArguments: (message: String, retryMessage: String)?
    var showErrorWithRetryMessageReceivedInvocations: [(message: String, retryMessage: String)] = []
    var showErrorWithRetryMessageClosure: ((String, String) -> Void)?

    func showError(with message: String, retryMessage: String) {
        showErrorWithRetryMessageCallsCount += 1
        showErrorWithRetryMessageReceivedArguments = (message: message, retryMessage: retryMessage)
        showErrorWithRetryMessageReceivedInvocations.append((message: message, retryMessage: retryMessage))
        showErrorWithRetryMessageClosure?(message, retryMessage)
    }

}
class CategoriesGroupsListRouterProtocolMock: CategoriesGroupsListRouterProtocol {

    //MARK: - routeToAchievementsList

    var routeToAchievementsListCallsCount = 0
    var routeToAchievementsListCalled: Bool {
        return routeToAchievementsListCallsCount > 0
    }
    var routeToAchievementsListClosure: (() -> Void)?

    func routeToAchievementsList() {
        routeToAchievementsListCallsCount += 1
        routeToAchievementsListClosure?()
    }

}
