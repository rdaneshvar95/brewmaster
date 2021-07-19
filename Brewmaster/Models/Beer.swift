//
//  Beer.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 19/07/2021.
//

import UIKit

struct Beer: Codable {
    let name: String
    let tagline: String
    let description: String
    let imageURL: String
}

extension Beer {
    enum CodingKeys: String, CodingKey {
        case name, tagline, description
        case imageURL = "imageUrl"
    }
}
