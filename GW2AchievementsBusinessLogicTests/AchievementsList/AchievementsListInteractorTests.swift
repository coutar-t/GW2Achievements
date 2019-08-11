//
//  AchievementsListInteractorTests.swift
//  GW2AchievementsBusinessLogicTests
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import XCTest
import Nimble
@testable import GW2AchievementsBusinessLogic

class AchievementsListInteractorTests: XCTestCase {
    var interactor: AchievementsListInteractor!
    var repositoryMock: AchievementsListRepositoryInputMock!
    var currentRepositoryMock: CurrentCategoryRepositoryInputMock!
    var currentAchievementRepositoryMock: CurrentAchievementRepositoryInputMock!
    var outputMock: AchievementsListInteractorOutputMock!
    
    override func setUp() {
        super.setUp()
        
        repositoryMock = AchievementsListRepositoryInputMock()
        currentRepositoryMock = CurrentCategoryRepositoryInputMock()
        outputMock = AchievementsListInteractorOutputMock()
        currentAchievementRepositoryMock = CurrentAchievementRepositoryInputMock()
        interactor = AchievementsListInteractor(currentRepository: currentRepositoryMock,
                                                repository: repositoryMock, currentAchievementRepository: currentAchievementRepositoryMock)
        interactor.output = outputMock
    }
    
    // MARK: - Retrieve
    
    func test_whenRetrieve_thenOutputSetDefaultValuesAndNotifyLoadingCurrentRepositoryGet() {
        // When
        
        interactor.retrieve()
        
        // Then
        
        expect(self.currentRepositoryMock.getCallsCount).to(equal(1))
        expect(self.outputMock.setDefaultValuesCallsCount).to(equal(1))
        expect(self.outputMock.notifyLoadingCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - NumberOfCategories
    
    func test_givenNoAchievements_whenNumberOfCategories_thenReturnZero() {
        // When
        
        let numberOfCategories = interactor.numberOfCategories()
        
        // Then
        
        expect(numberOfCategories).to(equal(0))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenAchievements_whenNumberOfCategories_thenReturnOne() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        let numberOfCategories = interactor.numberOfCategories()
        
        // Then
        
        expect(numberOfCategories).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - NumberOfAchievements
    
    func test_givenWrongCategory_whenNumberOfAchievements_thenReturnZero() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        let numberOfAchievements = interactor.numberOfAchievements(for: 1)
        
        // Then
        
        expect(numberOfAchievements).to(equal(0))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenCategory_whenNumberOfAchievements_thenReturnZero() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        let numberOfAchievements = interactor.numberOfAchievements(for: 0)
        
        // Then
        
        expect(numberOfAchievements).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - Achievement
    
    func test_givenWrongCategory_whenAchievement_thenReturnNil() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        let achievement = interactor.achievement(at: 0, for: 12)
        
        // Then
        
        expect(achievement).to(beNil())
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenWrongIndex_whenAchievement_thenReturnNil() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        let achievement = interactor.achievement(at: 12, for: 0)
        
        // Then
        
        expect(achievement).to(beNil())
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenCategory_whenAchievement_thenReturnNil() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        let achievement = interactor.achievement(at: 0, for: 0)
        
        // Then
        
        expect(achievement?.name).to(equal("Toto"))
        expect(achievement?.iconUrl).to(equal("ICON"))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - SelectAchievement
    
    func test_givenWrongCategory_whenSelectAchievement_thenDoNothing() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        interactor.selectAchievement(at: 0, for: 12)
        
        // Then
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenWrongIndex_whenSelectAchievement_thenDoNothing() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        interactor.selectAchievement(at: 12, for: 0)
        
        // Then
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenCategory_whenSelectAchievement_thenOutputRouteToAchievementDetail() {
        // Given
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // When
        
        interactor.selectAchievement(at: 0, for: 0)
        
        // Then
        
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementReceivedCurrentAchievement?.name).to(equal("Toto"))
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementReceivedCurrentAchievement?.requirement).to(equal("Required"))
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementReceivedCurrentAchievement?.description).to(equal("Description"))
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementReceivedCurrentAchievement?.iconUrl).to(equal("ICON"))
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCallsCount).to(equal(1))
        expect(self.outputMock.routeToAchievementDetailCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
    }
    
    
    // MARK: - DidGetCategory
    
    func test_whenDidGetCategory_thenRepositoryGetOutputSetTitle() {
        // When
        
        interactor.didGet(category: CurrentCategoryRepositoryResponseProtocolMock(name: "Title", iconUrl: "ICON", achievements: [1,2,3]))
        
        // Then
        
        expect(self.repositoryMock.getForCallsCount).to(equal(1))
        expect(self.repositoryMock.getForReceivedIds).to(equal(["1", "2", "3"]))
        expect(self.outputMock.setTitleCallsCount).to(equal(1))
        expect(self.outputMock.setTitleReceivedTitle).to(equal("Title"))
        
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - DidHandleError
    
    func test_whenDidHandleError_thenOutputNotifyUnknownError() {
        // When
        
        interactor.didHandleError()
        
        // Then
        
        expect(self.outputMock.notifyUnknownErrorCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - DidGetAchievements
    
    func test_givenDidGetNoAchievements_whenDidGetAchievements_thenOutputNoData() {
        // When
        
        interactor.didGet(achievements: [])
        
        // Then
        
        expect(self.outputMock.notifyNoDataErrorCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_givenDidGetAchievements_whenDidGetAchievements_thenOutputUpdateAchievements() {
        // When
        
        interactor.didGet(achievements: [AchievementResponseProtocolMock(name: "Toto", description: "Description", requirement: "Required", iconUrl: "ICON")])
        
        // Then
        
        expect(self.outputMock.updateAchievementsListCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    // MARK: - DidHandleError
    
    func test_whenDidHandleErrorNetwork_thenOutputNotifyNetworkError() {
        // When
        
        interactor.didHandleError(error: .network)
        
        // Then
        
        expect(self.outputMock.notifyNetworkErrorCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_whenDidHandleErrorServer_thenOutputNotifyServerError() {
        // When
        
        interactor.didHandleError(error: .server)
        
        // Then
        
        expect(self.outputMock.notifyServerErrorCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.notifyUnknownErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
    
    func test_whenDidHandleErrorUnknown_thenOutputNotifyUnknownError() {
        // When
        
        interactor.didHandleError(error: .unknown)
        
        // Then
        
        expect(self.outputMock.notifyUnknownErrorCallsCount).to(equal(1))
        
        expect(self.repositoryMock.getForCalled).to(beFalse())
        expect(self.currentRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentRepositoryMock.saveCurrentCategoryCalled).to(beFalse())
        expect(self.currentRepositoryMock.getCalled).to(beFalse())
        expect(self.outputMock.updateAchievementsListCalled).to(beFalse())
        expect(self.outputMock.notifyNoDataErrorCalled).to(beFalse())
        expect(self.outputMock.notifyServerErrorCalled).to(beFalse())
        expect(self.outputMock.notifyNetworkErrorCalled).to(beFalse())
        expect(self.outputMock.setTitleCalled).to(beFalse())
        expect(self.outputMock.setDefaultValuesCalled).to(beFalse())
        expect(self.outputMock.notifyLoadingCalled).to(beFalse())
        expect(self.outputMock.routeToAchievementDetailCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.clearCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.saveCurrentAchievementCalled).to(beFalse())
        expect(self.currentAchievementRepositoryMock.getCalled).to(beFalse())
        
    }
}
