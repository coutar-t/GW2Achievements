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














class AchievementItemProtocolMock: AchievementItemProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!

    init() {}

    init(name: String, iconUrl: String) {
      self.name = name
      self.iconUrl = iconUrl
    }
}
class AchievementResponseProtocolMock: AchievementResponseProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var description: String {
        get { return underlyingDescription }
        set(value) { underlyingDescription = value }
    }
    var underlyingDescription: String!
    var requirement: String {
        get { return underlyingRequirement }
        set(value) { underlyingRequirement = value }
    }
    var underlyingRequirement: String!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!

    init() {}

    init(name: String, description: String, requirement: String, iconUrl: String) {
      self.name = name
      self.description = description
      self.requirement = requirement
      self.iconUrl = iconUrl
    }
}
class AchievementsCategoryResponseProtocolMock: AchievementsCategoryResponseProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var icon: String {
        get { return underlyingIcon }
        set(value) { underlyingIcon = value }
    }
    var underlyingIcon: String!
    var achievementsIds: [Int] = []

    init() {}

    init(name: String, icon: String, achievementsIds: [Int]) {
      self.name = name
      self.icon = icon
      self.achievementsIds = achievementsIds
    }
}
class AchievementsListInteractorInputMock: AchievementsListInteractorInput {
    var output: AchievementsListInteractorOutput?

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

    //MARK: - numberOfAchievements

    var numberOfAchievementsForCallsCount = 0
    var numberOfAchievementsForCalled: Bool {
        return numberOfAchievementsForCallsCount > 0
    }
    var numberOfAchievementsForReceivedCategory: Int?
    var numberOfAchievementsForReceivedInvocations: [Int] = []
    var numberOfAchievementsForReturnValue: Int!
    var numberOfAchievementsForClosure: ((Int) -> Int)?

    func numberOfAchievements(for category: Int) -> Int {
        numberOfAchievementsForCallsCount += 1
        numberOfAchievementsForReceivedCategory = category
        numberOfAchievementsForReceivedInvocations.append(category)
        return numberOfAchievementsForClosure.map({ $0(category) }) ?? numberOfAchievementsForReturnValue
    }

    //MARK: - achievement

    var achievementAtForCallsCount = 0
    var achievementAtForCalled: Bool {
        return achievementAtForCallsCount > 0
    }
    var achievementAtForReceivedArguments: (index: Int, category: Int)?
    var achievementAtForReceivedInvocations: [(index: Int, category: Int)] = []
    var achievementAtForReturnValue: AchievementItemProtocol?
    var achievementAtForClosure: ((Int, Int) -> AchievementItemProtocol?)?

    func achievement(at index: Int, for category: Int) -> AchievementItemProtocol? {
        achievementAtForCallsCount += 1
        achievementAtForReceivedArguments = (index: index, category: category)
        achievementAtForReceivedInvocations.append((index: index, category: category))
        return achievementAtForClosure.map({ $0(index, category) }) ?? achievementAtForReturnValue
    }

}
class AchievementsListInteractorModuleFactoryProtocolMock: AchievementsListInteractorModuleFactoryProtocol {

    //MARK: - interactor

    var interactorRepositoryCallsCount = 0
    var interactorRepositoryCalled: Bool {
        return interactorRepositoryCallsCount > 0
    }
    var interactorRepositoryReceivedRepository: AchievementsListRepositoryInput?
    var interactorRepositoryReceivedInvocations: [AchievementsListRepositoryInput] = []
    var interactorRepositoryReturnValue: AchievementsListInteractorInput!
    var interactorRepositoryClosure: ((AchievementsListRepositoryInput) -> AchievementsListInteractorInput)?

    func interactor(repository: AchievementsListRepositoryInput) -> AchievementsListInteractorInput {
        interactorRepositoryCallsCount += 1
        interactorRepositoryReceivedRepository = repository
        interactorRepositoryReceivedInvocations.append(repository)
        return interactorRepositoryClosure.map({ $0(repository) }) ?? interactorRepositoryReturnValue
    }

}
class AchievementsListInteractorOutputMock: AchievementsListInteractorOutput {

    //MARK: - setDefaultValues

    var setDefaultValuesCallsCount = 0
    var setDefaultValuesCalled: Bool {
        return setDefaultValuesCallsCount > 0
    }
    var setDefaultValuesClosure: (() -> Void)?

    func setDefaultValues() {
        setDefaultValuesCallsCount += 1
        setDefaultValuesClosure?()
    }

    //MARK: - setTitle

    var setTitleCallsCount = 0
    var setTitleCalled: Bool {
        return setTitleCallsCount > 0
    }
    var setTitleReceivedTitle: String?
    var setTitleReceivedInvocations: [String] = []
    var setTitleClosure: ((String) -> Void)?

    func setTitle(_ title: String) {
        setTitleCallsCount += 1
        setTitleReceivedTitle = title
        setTitleReceivedInvocations.append(title)
        setTitleClosure?(title)
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

    //MARK: - notifyLoading

    var notifyLoadingCallsCount = 0
    var notifyLoadingCalled: Bool {
        return notifyLoadingCallsCount > 0
    }
    var notifyLoadingClosure: (() -> Void)?

    func notifyLoading() {
        notifyLoadingCallsCount += 1
        notifyLoadingClosure?()
    }

    //MARK: - notifyServerError

    var notifyServerErrorCallsCount = 0
    var notifyServerErrorCalled: Bool {
        return notifyServerErrorCallsCount > 0
    }
    var notifyServerErrorClosure: (() -> Void)?

    func notifyServerError() {
        notifyServerErrorCallsCount += 1
        notifyServerErrorClosure?()
    }

    //MARK: - notifyNetworkError

    var notifyNetworkErrorCallsCount = 0
    var notifyNetworkErrorCalled: Bool {
        return notifyNetworkErrorCallsCount > 0
    }
    var notifyNetworkErrorClosure: (() -> Void)?

    func notifyNetworkError() {
        notifyNetworkErrorCallsCount += 1
        notifyNetworkErrorClosure?()
    }

    //MARK: - notifyUnknownError

    var notifyUnknownErrorCallsCount = 0
    var notifyUnknownErrorCalled: Bool {
        return notifyUnknownErrorCallsCount > 0
    }
    var notifyUnknownErrorClosure: (() -> Void)?

    func notifyUnknownError() {
        notifyUnknownErrorCallsCount += 1
        notifyUnknownErrorClosure?()
    }

    //MARK: - notifyNoDataError

    var notifyNoDataErrorCallsCount = 0
    var notifyNoDataErrorCalled: Bool {
        return notifyNoDataErrorCallsCount > 0
    }
    var notifyNoDataErrorClosure: (() -> Void)?

    func notifyNoDataError() {
        notifyNoDataErrorCallsCount += 1
        notifyNoDataErrorClosure?()
    }

}
class AchievementsListRepositoryInputMock: AchievementsListRepositoryInput {
    var output: AchievementsListRepositoryOutput?

    //MARK: - get

    var getForCallsCount = 0
    var getForCalled: Bool {
        return getForCallsCount > 0
    }
    var getForReceivedIds: [String]?
    var getForReceivedInvocations: [[String]] = []
    var getForClosure: (([String]) -> Void)?

    func get(for ids: [String]) {
        getForCallsCount += 1
        getForReceivedIds = ids
        getForReceivedInvocations.append(ids)
        getForClosure?(ids)
    }

}
class AchievementsListRepositoryOutputMock: AchievementsListRepositoryOutput {

    //MARK: - didGet

    var didGetAchievementsCallsCount = 0
    var didGetAchievementsCalled: Bool {
        return didGetAchievementsCallsCount > 0
    }
    var didGetAchievementsReceivedAchievements: [AchievementResponseProtocol]?
    var didGetAchievementsReceivedInvocations: [[AchievementResponseProtocol]] = []
    var didGetAchievementsClosure: (([AchievementResponseProtocol]) -> Void)?

    func didGet(achievements: [AchievementResponseProtocol]) {
        didGetAchievementsCallsCount += 1
        didGetAchievementsReceivedAchievements = achievements
        didGetAchievementsReceivedInvocations.append(achievements)
        didGetAchievementsClosure?(achievements)
    }

    //MARK: - didHandleError

    var didHandleErrorErrorCallsCount = 0
    var didHandleErrorErrorCalled: Bool {
        return didHandleErrorErrorCallsCount > 0
    }
    var didHandleErrorErrorReceivedError: AchievementsListRepositoryError?
    var didHandleErrorErrorReceivedInvocations: [AchievementsListRepositoryError] = []
    var didHandleErrorErrorClosure: ((AchievementsListRepositoryError) -> Void)?

    func didHandleError(error: AchievementsListRepositoryError) {
        didHandleErrorErrorCallsCount += 1
        didHandleErrorErrorReceivedError = error
        didHandleErrorErrorReceivedInvocations.append(error)
        didHandleErrorErrorClosure?(error)
    }

}
class CategoriesGroupResponseProtocolMock: CategoriesGroupResponseProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var categories: [AchievementsCategoryResponseProtocol] = []

    init() {}

    init(name: String, categories: [AchievementsCategoryResponseProtocol]) {
      self.name = name
      self.categories = categories
    }
}
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

    var categoryGroupForCallsCount = 0
    var categoryGroupForCalled: Bool {
        return categoryGroupForCallsCount > 0
    }
    var categoryGroupForReceivedCategory: Int?
    var categoryGroupForReceivedInvocations: [Int] = []
    var categoryGroupForReturnValue: CategoryGroupItemProtocol?
    var categoryGroupForClosure: ((Int) -> CategoryGroupItemProtocol?)?

    func categoryGroup(for category: Int) -> CategoryGroupItemProtocol? {
        categoryGroupForCallsCount += 1
        categoryGroupForReceivedCategory = category
        categoryGroupForReceivedInvocations.append(category)
        return categoryGroupForClosure.map({ $0(category) }) ?? categoryGroupForReturnValue
    }

    //MARK: - category

    var categoryAtForCallsCount = 0
    var categoryAtForCalled: Bool {
        return categoryAtForCallsCount > 0
    }
    var categoryAtForReceivedArguments: (index: Int, category: Int)?
    var categoryAtForReceivedInvocations: [(index: Int, category: Int)] = []
    var categoryAtForReturnValue: CategoryItemProtocol?
    var categoryAtForClosure: ((Int, Int) -> CategoryItemProtocol?)?

    func category(at index: Int, for category: Int) -> CategoryItemProtocol? {
        categoryAtForCallsCount += 1
        categoryAtForReceivedArguments = (index: index, category: category)
        categoryAtForReceivedInvocations.append((index: index, category: category))
        return categoryAtForClosure.map({ $0(index, category) }) ?? categoryAtForReturnValue
    }

}
class CategoriesGroupsListInteractorModuleFactoryProtocolMock: CategoriesGroupsListInteractorModuleFactoryProtocol {

    //MARK: - interactor

    var interactorRepositoryCallsCount = 0
    var interactorRepositoryCalled: Bool {
        return interactorRepositoryCallsCount > 0
    }
    var interactorRepositoryReceivedRepository: CategoriesGroupsListRepositoryInput?
    var interactorRepositoryReceivedInvocations: [CategoriesGroupsListRepositoryInput] = []
    var interactorRepositoryReturnValue: CategoriesGroupsListInteractorInput!
    var interactorRepositoryClosure: ((CategoriesGroupsListRepositoryInput) -> CategoriesGroupsListInteractorInput)?

    func interactor(repository: CategoriesGroupsListRepositoryInput) -> CategoriesGroupsListInteractorInput {
        interactorRepositoryCallsCount += 1
        interactorRepositoryReceivedRepository = repository
        interactorRepositoryReceivedInvocations.append(repository)
        return interactorRepositoryClosure.map({ $0(repository) }) ?? interactorRepositoryReturnValue
    }

}
class CategoriesGroupsListInteractorOutputMock: CategoriesGroupsListInteractorOutput {

    //MARK: - setDefaultValues

    var setDefaultValuesCallsCount = 0
    var setDefaultValuesCalled: Bool {
        return setDefaultValuesCallsCount > 0
    }
    var setDefaultValuesClosure: (() -> Void)?

    func setDefaultValues() {
        setDefaultValuesCallsCount += 1
        setDefaultValuesClosure?()
    }

    //MARK: - updateCategoriesGroupsList

    var updateCategoriesGroupsListCallsCount = 0
    var updateCategoriesGroupsListCalled: Bool {
        return updateCategoriesGroupsListCallsCount > 0
    }
    var updateCategoriesGroupsListClosure: (() -> Void)?

    func updateCategoriesGroupsList() {
        updateCategoriesGroupsListCallsCount += 1
        updateCategoriesGroupsListClosure?()
    }

    //MARK: - notifyLoading

    var notifyLoadingCallsCount = 0
    var notifyLoadingCalled: Bool {
        return notifyLoadingCallsCount > 0
    }
    var notifyLoadingClosure: (() -> Void)?

    func notifyLoading() {
        notifyLoadingCallsCount += 1
        notifyLoadingClosure?()
    }

    //MARK: - notifyServerError

    var notifyServerErrorCallsCount = 0
    var notifyServerErrorCalled: Bool {
        return notifyServerErrorCallsCount > 0
    }
    var notifyServerErrorClosure: (() -> Void)?

    func notifyServerError() {
        notifyServerErrorCallsCount += 1
        notifyServerErrorClosure?()
    }

    //MARK: - notifyNetworkError

    var notifyNetworkErrorCallsCount = 0
    var notifyNetworkErrorCalled: Bool {
        return notifyNetworkErrorCallsCount > 0
    }
    var notifyNetworkErrorClosure: (() -> Void)?

    func notifyNetworkError() {
        notifyNetworkErrorCallsCount += 1
        notifyNetworkErrorClosure?()
    }

    //MARK: - notifyUnknownError

    var notifyUnknownErrorCallsCount = 0
    var notifyUnknownErrorCalled: Bool {
        return notifyUnknownErrorCallsCount > 0
    }
    var notifyUnknownErrorClosure: (() -> Void)?

    func notifyUnknownError() {
        notifyUnknownErrorCallsCount += 1
        notifyUnknownErrorClosure?()
    }

    //MARK: - notifyNoDataError

    var notifyNoDataErrorCallsCount = 0
    var notifyNoDataErrorCalled: Bool {
        return notifyNoDataErrorCallsCount > 0
    }
    var notifyNoDataErrorClosure: (() -> Void)?

    func notifyNoDataError() {
        notifyNoDataErrorCallsCount += 1
        notifyNoDataErrorClosure?()
    }

}
class CategoriesGroupsListRepositoryInputMock: CategoriesGroupsListRepositoryInput {
    var output: CategoriesGroupsListRepositoryOutput?

    //MARK: - get

    var getCallsCount = 0
    var getCalled: Bool {
        return getCallsCount > 0
    }
    var getClosure: (() -> Void)?

    func get() {
        getCallsCount += 1
        getClosure?()
    }

}
class CategoriesGroupsListRepositoryOutputMock: CategoriesGroupsListRepositoryOutput {

    //MARK: - didGet

    var didGetCategoriesGroupsCallsCount = 0
    var didGetCategoriesGroupsCalled: Bool {
        return didGetCategoriesGroupsCallsCount > 0
    }
    var didGetCategoriesGroupsReceivedCategoriesGroups: [CategoriesGroupResponseProtocol]?
    var didGetCategoriesGroupsReceivedInvocations: [[CategoriesGroupResponseProtocol]] = []
    var didGetCategoriesGroupsClosure: (([CategoriesGroupResponseProtocol]) -> Void)?

    func didGet(categoriesGroups: [CategoriesGroupResponseProtocol]) {
        didGetCategoriesGroupsCallsCount += 1
        didGetCategoriesGroupsReceivedCategoriesGroups = categoriesGroups
        didGetCategoriesGroupsReceivedInvocations.append(categoriesGroups)
        didGetCategoriesGroupsClosure?(categoriesGroups)
    }

    //MARK: - didHandleError

    var didHandleErrorErrorCallsCount = 0
    var didHandleErrorErrorCalled: Bool {
        return didHandleErrorErrorCallsCount > 0
    }
    var didHandleErrorErrorReceivedError: CategoriesGroupsListRepositoryError?
    var didHandleErrorErrorReceivedInvocations: [CategoriesGroupsListRepositoryError] = []
    var didHandleErrorErrorClosure: ((CategoriesGroupsListRepositoryError) -> Void)?

    func didHandleError(error: CategoriesGroupsListRepositoryError) {
        didHandleErrorErrorCallsCount += 1
        didHandleErrorErrorReceivedError = error
        didHandleErrorErrorReceivedInvocations.append(error)
        didHandleErrorErrorClosure?(error)
    }

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
class CategoryItemProtocolMock: CategoryItemProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!

    init() {}

    init(name: String, iconUrl: String) {
      self.name = name
      self.iconUrl = iconUrl
    }
}
class CurrentCategoryRepositoryInputMock: CurrentCategoryRepositoryInput {
    var output: CurrentCategoryRepositoryOutput?

    //MARK: - get

    var getCallsCount = 0
    var getCalled: Bool {
        return getCallsCount > 0
    }
    var getClosure: (() -> Void)?

    func get() {
        getCallsCount += 1
        getClosure?()
    }

    //MARK: - save

    var saveCurrentCategoryCallsCount = 0
    var saveCurrentCategoryCalled: Bool {
        return saveCurrentCategoryCallsCount > 0
    }
    var saveCurrentCategoryReceivedCurrentCategory: CurrentCategoryRepositoryRequestProtocol?
    var saveCurrentCategoryReceivedInvocations: [CurrentCategoryRepositoryRequestProtocol] = []
    var saveCurrentCategoryClosure: ((CurrentCategoryRepositoryRequestProtocol) -> Void)?

    func save(currentCategory: CurrentCategoryRepositoryRequestProtocol) {
        saveCurrentCategoryCallsCount += 1
        saveCurrentCategoryReceivedCurrentCategory = currentCategory
        saveCurrentCategoryReceivedInvocations.append(currentCategory)
        saveCurrentCategoryClosure?(currentCategory)
    }

    //MARK: - clear

    var clearCallsCount = 0
    var clearCalled: Bool {
        return clearCallsCount > 0
    }
    var clearClosure: (() -> Void)?

    func clear() {
        clearCallsCount += 1
        clearClosure?()
    }

}
class CurrentCategoryRepositoryOutputMock: CurrentCategoryRepositoryOutput {

    //MARK: - didGet

    var didGetCategoryCallsCount = 0
    var didGetCategoryCalled: Bool {
        return didGetCategoryCallsCount > 0
    }
    var didGetCategoryReceivedCategory: CurrentCategoryRepositoryResponseProtocol?
    var didGetCategoryReceivedInvocations: [CurrentCategoryRepositoryResponseProtocol] = []
    var didGetCategoryClosure: ((CurrentCategoryRepositoryResponseProtocol) -> Void)?

    func didGet(category: CurrentCategoryRepositoryResponseProtocol) {
        didGetCategoryCallsCount += 1
        didGetCategoryReceivedCategory = category
        didGetCategoryReceivedInvocations.append(category)
        didGetCategoryClosure?(category)
    }

    //MARK: - didHandleError

    var didHandleErrorCallsCount = 0
    var didHandleErrorCalled: Bool {
        return didHandleErrorCallsCount > 0
    }
    var didHandleErrorClosure: (() -> Void)?

    func didHandleError() {
        didHandleErrorCallsCount += 1
        didHandleErrorClosure?()
    }

}
class CurrentCategoryRepositoryRequestProtocolMock: CurrentCategoryRepositoryRequestProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!
    var achievements: [Int] = []

    init() {}

    init(name: String, iconUrl: String, achievements: [Int]) {
      self.name = name
      self.iconUrl = iconUrl
      self.achievements = achievements
    }
}
class CurrentCategoryRepositoryResponseProtocolMock: CurrentCategoryRepositoryResponseProtocol {
    var name: String {
        get { return underlyingName }
        set(value) { underlyingName = value }
    }
    var underlyingName: String!
    var iconUrl: String {
        get { return underlyingIconUrl }
        set(value) { underlyingIconUrl = value }
    }
    var underlyingIconUrl: String!
    var achievements: [Int] = []

    init() {}

    init(name: String, iconUrl: String, achievements: [Int]) {
      self.name = name
      self.iconUrl = iconUrl
      self.achievements = achievements
    }
}
