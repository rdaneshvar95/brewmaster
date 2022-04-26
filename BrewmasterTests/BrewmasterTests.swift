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

    func testRegisterBeerCell() {
        let controller = BeersTableViewController()
        let cell = controller.tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.reuseIdentifier)

        XCTAssertNotNil(cell)
    }

    func testListPageHasOneSection() {
        let controller = BeersTableViewController()
        XCTAssertEqual(controller.tableView.numberOfSections, 1)
    }

    func testListPageNumberOfRows() {
        let beer = Beer(name: "beerName",
                        tagline: "beerTagline",
                        description: "beerDescription",
                        imageURL: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")

        let dataSource = BeersDataSource()
        dataSource.append([beer])

        let tablewView = UITableView()
        tablewView.dataSource = dataSource
        tablewView.reloadData()

        XCTAssertEqual(tablewView.numberOfRows(inSection: 0), 1)
    }

    func testSetDataSource() {
        let controller = BeersTableViewController()
        XCTAssertTrue(controller.tableView.dataSource is BeersDataSource)
    }

    func testDataSourceAppend() {
        let dataSource = BeersDataSource()
        let beer = Beer(name: "beerName",
                        tagline: "beerTagline",
                        description: "beerDescription",
                        imageURL: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
        dataSource.append([beer])
        XCTAssertEqual(dataSource.beers.count, 1)
    }

    func testDataSourceGet() {
        let dataSource = BeersDataSource()
        let beer = Beer(name: "beerName",
                        tagline: "beerTagline",
                        description: "beerDescription",
                        imageURL: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
        dataSource.append([beer])
        XCTAssertEqual(dataSource.getBeer(at: 0).name, "beerName")
        XCTAssertEqual(dataSource.getBeer(at: 0).tagline, "beerTagline")
        XCTAssertEqual(dataSource.getBeer(at: 0).description, "beerDescription")
        XCTAssertEqual(dataSource.getBeer(at: 0).imageURL, "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
    }

    func testDataSourceSetSearchKeyClearsData() {
        let dataSource = BeersDataSource()
        let beer = Beer(name: "beerName",
                        tagline: "beerTagline",
                        description: "beerDescription",
                        imageURL: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
        dataSource.append([beer])
        dataSource.setSearchKey(searchKey: "test 1")

        XCTAssertTrue(dataSource.beers.isEmpty)
    }

    func testDataSourceSetSearchKey() {
        let dataSource = BeersDataSource()
        dataSource.setSearchKey(searchKey: "test 1")

        XCTAssertEqual(dataSource.searchKey, "test_1")
    }

    func testBeerCellConfiguration() {
        let beer = Beer(name: "beerName",
                        tagline: "beerTagline",
                        description: "beerDescription",
                        imageURL: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")

        let cell = BeerTableViewCell()
        cell.configure(title: beer.name, subtitle: beer.tagline, details: beer.description, imageURL: beer.imageURL)

        let expected = beer.name + "\n" + beer.tagline + "\n\n" + beer.description
        XCTAssertEqual(cell.textLabel?.text, expected)
    }

    func testDetailsPageHasTapGesture() {
        let controller = BeerDetailsViewController(beerDetails: .mock)
        XCTAssertEqual(controller.view.gestureRecognizers?.count, 1)
    }

    func testBeerModelInit() {
        let beer = Beer(name: "beerName",
                        tagline: "beerTagline",
                        description: "beerDescription",
                        imageURL: "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
        XCTAssertEqual(beer.name, "beerName")
        XCTAssertEqual(beer.tagline, "beerTagline")
        XCTAssertEqual(beer.description, "beerDescription")
        XCTAssertEqual(beer.imageURL, "https://www.google.com/images/branding/googlelogo/1x/googlelogo_color_272x92dp.png")
    }

    func testCacheManagerInsertAndGet() {
        CacheManager.shared.insert(image: UIImage(), for: "test")
        let image = CacheManager.shared.getImage(for: "test")
        XCTAssertNotNil(image)
    }
}
