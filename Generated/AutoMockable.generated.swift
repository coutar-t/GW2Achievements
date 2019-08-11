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
