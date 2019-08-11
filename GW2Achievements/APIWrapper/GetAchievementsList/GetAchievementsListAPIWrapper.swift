//
//  GetAchievementsListAPIWrapper.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

class GetAchievementsListAPIWrapper: GetAchievementsListAPIWrapperProtocol {
    private let apiWrapper: APIWrapperProtocol
    private let locale: LocaleProtocol

    init(apiWrapper: APIWrapperProtocol, locale: LocaleProtocol) {
        self.apiWrapper = apiWrapper
        self.locale = locale
    }

    func fetchAchievements(ids: [String],
                           success: @escaping ([AchievementItem]) -> Void,
                                     failure: @escaping (Error) -> Void) {
        guard let url = URL(string: "https://api.guildwars2.com/v2/achievements/?ids=\(ids.joined(separator: ","))&lang=\(locale.languageCode ?? "en")") else { return }

        DispatchQueue.global(qos: .background).async {
            self.apiWrapper.fetch(url: url,
                                  success: { (data) in
                                    DispatchQueue.main.async {
                                        do {
                                            try success(JSONDecoder().decode([AchievementItem].self, from: data))
                                        } catch let e {
                                            failure(e)
                                        }
                                    }
            }) { (error) in
                failure(error)
            }
        }
    }
}

