//
//  AchievementDetailViewController.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class AchievementDetailViewController: UIViewController {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var achievementNameLabel: UILabel!
    @IBOutlet weak var achievementDescriptionLabel: UILabel!
    @IBOutlet weak var achievementRequirementLabel: UILabel!

    var presenter: AchievementDetailPresenterInput!

    override func viewDidLoad() {
        super.viewDidLoad()

        presenter.viewDidLoad()
    }

}

extension AchievementDetailViewController: AchievementDetailPresenterOutput {
    func updateView(achievement: AchievementDetailViewModelProtocol) {
        iconImageView.kf.setImage(with: URL(string: achievement.iconUrl))
        achievementNameLabel.attributedText = achievement.name
        achievementDescriptionLabel.attributedText = achievement.description
        achievementRequirementLabel.attributedText = achievement.requirement
    }
}
