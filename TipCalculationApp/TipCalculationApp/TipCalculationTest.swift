//
//  TipCalculationTest.swift
//  TipCalculationApp
//
//  Created by Rose on 18/10/23.
//

import XCTest
@testable import TipCalculationApp

final class TipCalculationTest: XCTestCase {
  
  let sut = Calculation()
  
  func test_tipCalculation_WhenPercentageTip_ShouldPass() {
    
    /* Given */
    let amountBill = 100.0
    let tipPercentage = 15.0
    let expectedResult = 15.0
    
    /* When */
    let tip = sut.calculateTip(of: amountBill, with: tipPercentage)
    
    /* Assert */
    XCTAssertEqual(tip, expectedResult)
  }
  
  func test_tipCalculation_WhenBillAmount_ShouldNotPass() {
    
    /* Given */
    let amountBill = -100.0
    let tipPercentage = 10.0
    
    /* When */
    let tip = sut.calculateTip(of: amountBill, with: tipPercentage)
    
    /* Assert */
    XCTAssertNil(tip)
  }

}
