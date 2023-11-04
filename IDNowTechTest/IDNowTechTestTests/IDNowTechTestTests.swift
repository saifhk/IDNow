//
//  IDKnowTechTestTests.swift
//  IDKnowTechTestTests
//
//  Created by user on 31/10/2023.
//

import XCTest
@testable import IDNowTechTest

class IDNowTechTestTests: XCTestCase {

    var treasureViewModel: TreasureViewModel!

        override func setUp() {
            super.setUp()
            treasureViewModel = TreasureViewModel()
        }

    override func tearDown() {
         treasureViewModel = nil
         super.tearDown()
     }

     func testTreasureViewModelStartHunt() {
         let expectation = XCTestExpectation(description: "Treasure hunt completed")

         treasureViewModel.onTreasureFound = { treasure in
             XCTAssertEqual(treasure.type, "Gold", "Treasure type should be Gold")
             XCTAssertEqual(treasure.message, "You found a treasure!", "Treasure message should match")
             expectation.fulfill()
         }

         treasureViewModel.startHunt()

         wait(for: [expectation], timeout: 10) // Adjust the timeout as needed
     }

}
