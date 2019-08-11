//
//  AchievementsListViewController.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 11/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class AchievementsListViewController: UIViewController {
    @IBOutlet weak var achievementsTableView: UITableView!
    @IBOutlet weak var loaderIndicatorView: UIActivityIndicatorView!

    var presenter: AchievementsListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

        achievementsTableView.dataSource = self
        achievementsTableView.delegate = self
        presenter.viewDidLoad()

        achievementsTableView.estimatedRowHeight = 44
        achievementsTableView.rowHeight = UITableView.automaticDimension
    }
}

extension AchievementsListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter.selectRow(for: indexPath.row, at: indexPath.section)
    }
}

extension AchievementsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let viewModel = presenter.viewModel(for: indexPath.row, at: indexPath.section)
        let cell = tableView.dequeueReusableCell(withIdentifier: "AchievementsListCell", for: indexPath) as! AchievementsListCell
        cell.titleLabel.attributedText = viewModel.title
cell.achievementImageView.kf.setImage(with: URL(string: viewModel.iconUrl))
        return cell
    }
}

extension AchievementsListViewController: AchievementsListPresenterOutput {
    func setTitle(title: String) {
        self.title = title
    }

    func showLoading() {
        achievementsTableView.isHidden = true
        loaderIndicatorView.isHidden = false
        loaderIndicatorView.startAnimating()
    }

    func hideLoading() {
        achievementsTableView.isHidden = false
        loaderIndicatorView.isHidden = true
        loaderIndicatorView.stopAnimating()
    }

    func updateAchievementsList() {
        achievementsTableView.reloadData()
    }

    func showError(with message: String, retryMessage: String) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let retryButton = UIAlertAction(title: retryMessage, style: .default) { (_) in
            // Retry
        }
        alertView.addAction(retryButton)
        self.present(alertView, animated: true, completion: nil)
    }
}
