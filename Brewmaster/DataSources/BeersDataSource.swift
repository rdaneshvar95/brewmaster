//
//  BeersDataSource.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 19/07/2021.
//

import UIKit

class BeersDataSource: NSObject {

    private var beers: [Beer]

    init(beers: [Beer]) {
        self.beers = beers
    }

    func getBeer(at index: Int) -> Beer {
        beers[index]
    }

    func append(_ beers: [Beer]) {
        self.beers.append(contentsOf: beers)
    }
}

extension BeersDataSource: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        beers.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reuseIdentifier,
                                                 for: indexPath) as! BeerTableViewCell
        let beer = beers[indexPath.row]
        cell.configure(title: beer.name, subtitle: beer.tagline, details: beer.description, imageURL: beer.imageURL)
        return cell
    }
}
