//
//  BeerDetails.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 2022-04-26.
//

import Foundation

struct BeerDetails {
    let title: String
    let subtitle: String
    let details: String
    let imageURL: String
}

extension BeerDetails {

    static let mock = BeerDetails(title: "mockTitle",
                                  subtitle: "mockSubtitle",
                                  details: "mockDetails",
                                  imageURL: "mockImageURL")
}
