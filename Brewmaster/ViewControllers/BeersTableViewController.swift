//
//  BeersTableViewController.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 17/07/2021.
//

import UIKit

class BeersTableViewController: UITableViewController {

    private var dataSource: BeersDataSource!

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTitleView()
        configureNavigationBar()
        configureHeaderView()

        view.backgroundColor = AppColor.background

        tableView.separatorColor = .darkGray
        tableView.register(BeerTableViewCell.self, forCellReuseIdentifier: BeerTableViewCell.reuseIdentifier)

        BeerService().getBeers { [weak self] (beers) in
            DispatchQueue.main.async {
                self?.dataSource = BeersDataSource(beers: beers)
                self?.tableView.dataSource = self?.dataSource

                self?.tableView.reloadData()
            }
        }
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

    func configureHeaderView() {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 0, height: 88))

        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = AppColor.yellow
        containerView.layer.cornerRadius = 14

        let title = NSMutableAttributedString(string: "Weekend Offers\n",
                                              attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium)])
        title.append(NSMutableAttributedString(string: "Free Shipping on orders over 60€",
                                               attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 13, weight: .regular)]))

        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.attributedText = title

        let imageView = UIImageView(image: UIImage(named: "promotion"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit

        containerView.addSubview(label)
        containerView.addSubview(imageView)

        headerView.addSubview(containerView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 8),
            containerView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -12),
            containerView.leftAnchor.constraint(equalTo: headerView.leftAnchor, constant: 12),
            containerView.rightAnchor.constraint(equalTo: headerView.rightAnchor, constant: -12),

            label.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            label.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: imageView.leftAnchor, constant: -12),

            imageView.widthAnchor.constraint(equalToConstant: 60),
            imageView.heightAnchor.constraint(equalToConstant: 60),
            imageView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            imageView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -12)
        ])

        tableView.tableHeaderView = headerView
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = dataSource.getBeer(at: indexPath.row)
        let detailsViewController = BeerDetailsViewController(title: beer.name,
                                                              subtitle: beer.tagline,
                                                              details: beer.description,
                                                              imageURL: beer.imageURL)
        detailsViewController.modalPresentationStyle = .pageSheet
        showDetailViewController(detailsViewController, sender: self)
    }
}
