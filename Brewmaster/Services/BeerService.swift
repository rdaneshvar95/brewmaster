//
//  BeerService.swift
//  Brewmaster
//
//  Created by Reza Daneshvar on 19/07/2021.
//

struct BeerService {
    func getBeers(completion: @escaping ([Beer]) -> Void) {
        NetworkManager().request(path: "beers") { (beers: [Beer]) in completion(beers) }
    }
}
