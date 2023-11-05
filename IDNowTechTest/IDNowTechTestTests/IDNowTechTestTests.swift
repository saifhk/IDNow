//
//  IDKnowTechTestTests.swift
//  IDKnowTechTestTests
//
//  Created by user on 31/10/2023.
//

import XCTest
import Combine
@testable import IDNowTechTest

class IDNowTechTestTests: XCTestCase {
    var treasureViewModel: TreasureViewModel!
    private var cancellables: Set<AnyCancellable> = []
    
    override func setUp() {
            super.setUp()
            treasureViewModel = TreasureViewModel()
        }
    override func tearDown() {
         treasureViewModel = nil
         super.tearDown()
     }
    
    func testInitialState() {
            XCTAssertEqual(treasureViewModel.state, .initial)
        }
    
    func testFetchingTreasureLoaded() {
        let expectation = XCTestExpectation(description: "Treasure data loaded")
        treasureViewModel.fetchTreasure()
        DispatchQueue.global().async {
            self.treasureViewModel.$state
                .sink { state in
                    if case .loaded(_) = state {
                        expectation.fulfill()
                    }
                }
                .store(in: &self.cancellables)
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchTreasureSuccess(){
        let expectation = XCTestExpectation(description: "Treasure data loaded")
        treasureViewModel.fetchTreasure()
        DispatchQueue.global().async {            self.treasureViewModel.$state
                .sink { state in
                    if case .loaded(let treasure) = state {
                        XCTAssertNotNil(treasure)
                        expectation.fulfill()
                    }
                    if case .loadError(let error) = state {
                        XCTFail("the treasure is failed :\(error.debugDescription)")
                    }
                }
                .store(in: &self.cancellables)
        }
        wait(for: [expectation], timeout: 10.0)
    }
    
    func testFetchTreasureFailure() {
        let expectation = XCTestExpectation(description: "Fetching treasure should failed")
        treasureViewModel.fetchTreasure()
        switch self.treasureViewModel.state{
        case .loadError(let error):
            XCTAssertEqual(error, error.debugDescription)
            expectation.fulfill()
        case .loaded(_):
            XCTFail("Fetching treasure should fail")
        case .initial, .loading:
                expectation.fulfill()
        }
    }
}
