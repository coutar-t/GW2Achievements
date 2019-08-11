//
//  AchievementCategorisGroupItem.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

/*
 {
 "id": "A4ED8379-5B6B-4ECC-B6E1-70C350C902D2",
 "name": "Story Journal",
 "description": "Achievements related to the story journal.",
 "order": 3,
 "categories": [
 203
 ]
 }
 */

struct AchievementCategoriesGroupItem: Codable {
    var id: String
    var name: String
    var description: String
    var order: Int
    var categories: [Int]
}
