//
//  AchievementItem.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

/*
 {
 "id": 96,
 "name": "Norn Specialty Armors",
 "description": "Legendary vestments befitting your saga.",
 "requirement": "Soulbind  unique piece of norn cultural armor.",
 "locked_text": "",
 "type": "Default",
 "flags": [
 "Permanent"
 ],
 "bits": [
 {
 "type": "Text",
 "text": "Tier 1 Boots"
 }
 ],
 "tiers": [
 {
 "count": 1,
 "points": 1
 }
 ]
 }
 */

struct AchievementItem: Codable {
    var id: Int
    var name: String
    var icon: String?
    var description: String
    var requirement: String
    var locked_text: String
    var type: String
    var flags: [String]
}
