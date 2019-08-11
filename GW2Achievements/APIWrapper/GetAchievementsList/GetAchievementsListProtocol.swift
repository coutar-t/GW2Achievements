//
//  GetAchievementsListProtocol.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

protocol GetAchievementsListAPIWrapperProtocol {
    func fetchAchievements(ids: [String],
                           success: @escaping ([AchievementItem]) -> Void,
                           failure: @escaping (Error) -> Void)
}
