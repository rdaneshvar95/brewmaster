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
}
