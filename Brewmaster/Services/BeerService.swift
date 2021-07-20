//
//  BeerService.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 19/07/2021.
//

import Foundation

struct BeerService {
    private let baseURL = "https://api.punkapi.com/v2/"

    func getBeers(page: Int = 0, searchKey: String? = nil, completion: @escaping ([Beer]) -> Void) {
        var queryItems: [URLQueryItem] = []

        if page > 0 {
            queryItems.append(URLQueryItem(name: "page", value: "\(page)"))
        }

        if let searchKey = searchKey {
            queryItems.append(URLQueryItem(name: "beer_name", value: searchKey))
        }

        var components = URLComponents(string: baseURL + "beers")!
        components.queryItems = queryItems

        NetworkManager().request(url: components.url!) { (beers: [Beer]) in completion(beers) }
    }
}
