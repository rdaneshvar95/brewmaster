//
//  BeerTableViewCell.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 18/07/2021.
//

import UIKit

class BeerTableViewCell: UITableViewCell {
    static let reuseIdentifier = "BeerTableViewCell"

    private let titleAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15, weight: .bold),
        NSAttributedString.Key.foregroundColor : UIColor.white
    ]

    private let subtitleAttributes = [
        NSAttributedString.Key.font: UIFont.systemFont(ofSize: 14, weight: .semibold),
        NSAttributedString.Key.foregroundColor : UIColor.lightGray
    ]

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        textLabel?.numberOfLines = 5
        textLabel?.textColor = .white

        detailTextLabel?.textColor = AppColor.yellow
        detailTextLabel?.text = "MORE INFO"
        detailTextLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, subtitle: String, details: String, image: UIImage) {
        imageView?.image = UIImage(named: "promotion")

        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: title + "\n", attributes: titleAttributes))
        text.append(NSAttributedString(string: subtitle + "\n\n", attributes: subtitleAttributes))
        text.append(NSAttributedString(string: details, attributes: subtitleAttributes))

        textLabel?.attributedText = text
    }
}
