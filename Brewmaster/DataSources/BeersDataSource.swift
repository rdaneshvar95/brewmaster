//
//  BeersDataSource.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 19/07/2021.
//

import UIKit

class BeersDataSource: NSObject {

    private let pageSize = 25
    private var beers: [Beer] = []

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

extension BeersDataSource: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard indexPaths.contains(where: { $0.row >= beers.count - 1 }) else { return }

        BeerService().getBeers(page: beers.count / pageSize, completion: { beers in
            self.beers.append(contentsOf: beers)

            DispatchQueue.main.async {
                tableView.reloadData()
            }
        })
    }
}
