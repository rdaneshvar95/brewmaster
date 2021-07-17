//
//  BeersTableViewController.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 17/07/2021.
//

import UIKit

class BeersTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTitleView()
        configureNavigationBar()

        view.backgroundColor = AppColor.background
    }

    func configureTitleView() {
        let titleLabel = UILabel()
        titleLabel.textColor = .white

        let title = NSMutableAttributedString(string: "Beer ",
                                              attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .light)])
        title.append(NSMutableAttributedString(string: "Box",
                                               attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 24, weight: .bold)]))
        titleLabel.attributedText = title
        navigationItem.titleView = titleLabel
    }

    func configureNavigationBar() {
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.barTintColor = AppColor.background
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.isTranslucent = false
    }
}
