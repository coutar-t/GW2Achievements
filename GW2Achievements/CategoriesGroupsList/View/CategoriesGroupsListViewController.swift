//
//  CategoriesGroupsListViewController.swift
//  GW2Achievements
//
//  Created by Thibaut Coutard on 10/08/2019.
//  Copyright © 2019 Thibaut Coutard. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher

class CategoriesGroupsListViewController: UIViewController {
    @IBOutlet weak var categoriesGroupsTableView: UITableView!
    @IBOutlet weak var loaderActivityIndicator: UIActivityIndicatorView!
    var presenter: CategoriesGroupsListPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
//        categoriesGroupsTableView.delegate = self
        categoriesGroupsTableView.dataSource = self
    }
}

extension CategoriesGroupsListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return presenter.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.numberOfRows(in: section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: "CategoriesGroupsListCell") as! CategoriesGroupsListCell
        let viewModel = presenter.viewModel(for: indexPath.row, at: indexPath.section)
        tableViewCell.titleLabel.attributedText = viewModel.title
        tableViewCell.groupImageView.kf.setImage(with: URL(string: viewModel.iconUrl))
        return tableViewCell
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return presenter.sectionViewModel(at: section).title.string
    }


}

extension CategoriesGroupsListViewController: CategoriesGroupsListPresenterOutput {
    func setTitle(title: String) {
        self.title = title
    }

    func showLoading() {
        loaderActivityIndicator.isHidden = false
        loaderActivityIndicator.startAnimating()
        categoriesGroupsTableView.isHidden = true
    }

    func hideLoading() {
        loaderActivityIndicator.isHidden = true
        loaderActivityIndicator.stopAnimating()
        categoriesGroupsTableView.isHidden = false
    }

    func updateCategoriesGroups() {
        categoriesGroupsTableView.reloadData()
    }

    func showError(with message: String, retryMessage: String) {
        let alertView = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let retryButton = UIAlertAction(title: retryMessage, style: .default) { [weak self] (_) in
            // Retry
        }
        alertView.addAction(retryButton)
        self.present(alertView, animated: true, completion: nil)
    }


}
