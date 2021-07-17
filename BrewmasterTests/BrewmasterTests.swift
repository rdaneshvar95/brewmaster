//
//  BrewmasterTests.swift
//  BrewmasterTests
//
//  Created by Reza Daneshvar on 16/07/2021.
//

import XCTest
@testable import Brewmaster

class BrewmasterTests: XCTestCase {

    func testControllerHasTableView() {
        let controller = BeersTableViewController()

        XCTAssertNotNil(controller.tableView)
    }
}
