//
//  BrewmasterSnapshotTests.swift
//  BrewmasterSnapshotTests
//
//  Created by Reza Daneshvar on 2022-04-26.
//

import SnapshotTesting
import XCTest

@testable import Brewmaster

class BrewmasterSnapshotTests: XCTestCase {

    func testBeersTableViewController() {
        let viewController = BeersTableViewController()
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8))
    }

    func testBeerDetailsViewController() {
        let viewController = BeerDetailsViewController(beerDetails: .mock)
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8))
    }
    
    func testBeerDetailsViewController_longDetails() {
        let longDetails = Array(repeating: "mockDetails", count: 100).joined(separator: "")
        let mock = BeerDetails.mock
        let mockWithLongDetails = BeerDetails(title: mock.title,
                                              subtitle: mock.subtitle,
                                              details: longDetails,
                                              imageURL: mock.imageURL)

        let viewController = BeerDetailsViewController(beerDetails: mockWithLongDetails)
        assertSnapshot(matching: viewController, as: .image(on: .iPhone8))
    }
}
