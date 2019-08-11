//
//  AchievementDetailInteractorInput.swift
//  GW2AchievementsBusinessLogic
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

// sourcery: AutoMockableBusinessLogic
public protocol AchievementDetailInteractorInput: class {
    var output: AchievementDetailInteractorOutput? { get set }

    func retrieve()
}
