//
//  LocaleProtocol.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation

protocol LocaleProtocol {
    var languageCode: String? { get }
}

extension Locale: LocaleProtocol {}
