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

    private var imageURL: String?
    private let indicator = UIActivityIndicatorView(frame: CGRect(x: 0, y: 45, width: 25, height: 25))

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)

        backgroundColor = .clear
        selectionStyle = .none

        imageView?.contentMode = .scaleAspectFit
        imageView?.addSubview(indicator)

        textLabel?.numberOfLines = 5
        textLabel?.textColor = .white

        detailTextLabel?.textColor = AppColor.yellow
        detailTextLabel?.text = "MORE INFO"
        detailTextLabel?.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(title: String, subtitle: String, details: String, imageURL: String) {
        imageView?.image = UIImage.placeholder(CGSize(width: 25, height: 120))

        indicator.startAnimating()

        self.imageURL = imageURL
        NetworkManager().load(imageURL, width: 25) { image in
            guard self.imageURL == imageURL else { return }

            DispatchQueue.main.async {
                self.indicator.stopAnimating()
                self.imageView?.image = image
            }
        }

        let text = NSMutableAttributedString()
        text.append(NSAttributedString(string: title, attributes: titleAttributes))
        text.append(NSAttributedString(string: "\n" + subtitle, attributes: subtitleAttributes))
        text.append(NSAttributedString(string: "\n\n" + details, attributes: subtitleAttributes))

        textLabel?.attributedText = text
    }
}
