//
//  AchievementCategoryItem.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

/*
 {
 "id": 1,
 "name": "Slayer",
 "description": "",
 "order": 10,
 "icon": "https://render.guildwars2.com/file/E00460A2CAD85D47406EAB4213D1010B3E80C9B0/42675.png",
 "achievements": [
 1
 ]
 },
 */

struct AchievementCategoryItem: Codable {
    var id: Int
    var name: String
    var description: String
    var order: Int
    var icon: String
    var achievements: [Int]
}
