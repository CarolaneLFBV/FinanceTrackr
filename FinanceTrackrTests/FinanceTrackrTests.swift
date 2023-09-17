//
//  FinanceTrackrTests.swift
//  FinanceTrackrTests
//
//  Created by Carolane Lefebvre on 16/09/2023.
//

import XCTest
@testable import FinanceTrackr

final class FinanceTrackrTests: XCTestCase {

    var transaction: Transaction?
    
    override func setUp() {
        super.setUp()
        
        do {
            let testBundle = Bundle(for: type(of: self))
            if let url = testBundle.url(forResource: "transaction", withExtension: "json") {
                let jsonData = try Data(contentsOf: url)
                self.transaction = try JSONDecoder().decode(Transaction.self, from: jsonData)
            }
        } catch {
            print("Error: Couldn't load from Bundle")
        }
    }
    
    func testName() {
        XCTAssertEqual(transaction?.transactionName, "")
    }

}
