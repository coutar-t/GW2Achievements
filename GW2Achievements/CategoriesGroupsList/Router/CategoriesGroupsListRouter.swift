//
//  CategoriesGroupsListRouter.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit

class CategoriesGroupsListRouter: CategoriesGroupsListRouterProtocol {
    weak var parentViewController: UIViewController?

    func routeToAchievementsList() {
        let viewController = AchievementListModuleFactory().makeView()

        parentViewController?.navigationController?.pushViewController(viewController,
                                                 animated: true)
    }
}
