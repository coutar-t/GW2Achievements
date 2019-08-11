// Generated using Sourcery 0.16.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

// swiftlint:disable line_length
// swiftlint:disable variable_name

import Foundation
import GW2AchievementsBusinessLogic
#if os(iOS) || os(tvOS) || os(watchOS)
import UIKit
#elseif os(OSX)
import AppKit
#endif














class CategoriesGroupsListInteractorInputMock: CategoriesGroupsListInteractorInput {
    var output: CategoriesGroupsListInteractorOutput?

    //MARK: - retrieve

    var retrieveCallsCount = 0
    var retrieveCalled: Bool {
        return retrieveCallsCount > 0
    }
    var retrieveClosure: (() -> Void)?

    func retrieve() {
        retrieveCallsCount += 1
        retrieveClosure?()
    }

    //MARK: - numberOfCategories

    var numberOfCategoriesCallsCount = 0
    var numberOfCategoriesCalled: Bool {
        return numberOfCategoriesCallsCount > 0
    }
    var numberOfCategoriesReturnValue: Int!
    var numberOfCategoriesClosure: (() -> Int)?

    func numberOfCategories() -> Int {
        numberOfCategoriesCallsCount += 1
        return numberOfCategoriesClosure.map({ $0() }) ?? numberOfCategoriesReturnValue
    }

    //MARK: - numberOfCategoriesGroups

    var numberOfCategoriesGroupsForCallsCount = 0
    var numberOfCategoriesGroupsForCalled: Bool {
        return numberOfCategoriesGroupsForCallsCount > 0
    }
    var numberOfCategoriesGroupsForReceivedCategory: Int?
    var numberOfCategoriesGroupsForReceivedInvocations: [Int] = []
    var numberOfCategoriesGroupsForReturnValue: Int!
    var numberOfCategoriesGroupsForClosure: ((Int) -> Int)?

    func numberOfCategoriesGroups(for category: Int) -> Int {
        numberOfCategoriesGroupsForCallsCount += 1
        numberOfCategoriesGroupsForReceivedCategory = category
        numberOfCategoriesGroupsForReceivedInvocations.append(category)
        return numberOfCategoriesGroupsForClosure.map({ $0(category) }) ?? numberOfCategoriesGroupsForReturnValue
    }

    //MARK: - categoryGroup

    var categoryGroupAtForCallsCount = 0
    var categoryGroupAtForCalled: Bool {
        return categoryGroupAtForCallsCount > 0
    }
    var categoryGroupAtForReceivedArguments: (index: Int, category: Int)?
    var categoryGroupAtForReceivedInvocations: [(index: Int, category: Int)] = []
    var categoryGroupAtForReturnValue: CategoryGroupItemProtocol?
    var categoryGroupAtForClosure: ((Int, Int) -> CategoryGroupItemProtocol?)?

    func categoryGroup(at index: Int, for category: Int) -> CategoryGroupItemProtocol? {
        categoryGroupAtForCallsCount += 1
        categoryGroupAtForReceivedArguments = (index: index, category: category)
        categoryGroupAtForReceivedInvocations.append((index: index, category: category))
        return categoryGroupAtForClosure.map({ $0(index, category) }) ?? categoryGroupAtForReturnValue
    }

}
class CategoriesGroupsListInteractorOutputMock: CategoriesGroupsListInteractorOutput {

}
class CategoryGroupItemProtocolMock: CategoryGroupItemProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!

    init() {}

    init(name: String) {
      self.name = name
    }
}
