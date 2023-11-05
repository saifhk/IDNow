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
    func testFetchTreasureSuccess() {
            let expectation = XCTestExpectation(description: "Fetching treasure should succeed")
        treasureViewModel.fetchTreasure ()
        print("reasureViewModel.state : \(treasureViewModel.state)")
        switch treasureViewModel.state {
        case .loaded(let treasure):
            XCTAssertNotNil(treasure)
            expectation.fulfill()
        case .loadError(let error):
            XCTFail("Fetching treasure should not fail error : \(error)")
        case .initial, .loading:
            break
        }
            wait(for: [expectation], timeout: 15.0)
        }
    
    func testFetchTreasureFailure() {
        let expectation = XCTestExpectation(description: "Fetching treasure should failed")
        
    }

}
