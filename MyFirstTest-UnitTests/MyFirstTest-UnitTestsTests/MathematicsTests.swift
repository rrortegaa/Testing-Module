//
//  MathematicsTests.swift
//  MyFirstTest-UnitTestsTests
//
//  Created by Rose on 17/10/23.
//

/*
 TTD Methodology
 1. Write a test to fail
 2. Make to pass
 3. Refactor -> Make it better
*/
/*
 CMD + U -> Run Unit Test
 
 TODO: 3 Test Cases for one function
 Suma -> First test
 SUT -> System Under Test OUT Object U T
*/

import XCTest
@testable import MyFirstTest_UnitTests

func makeSUT() -> ArithmeticOperations {
    let operation = ArithmeticOperations()
  return operation
}

final class MathematicsTests: XCTestCase {
  
  let sut = makeSUT()
  
  /* Primer test de operaciones matemáticas (Suma) */
  func testSumOfTwoNumbers_WhenTwoNumbersAreGiven_ResultShouldBePass() {
    
    /* Arrange - Given */
    let number1 = 40.0
    let number2 = 20.0
    let expectedResult = 60.0
    let expectedNumberToFail = 0.0
    
    /* Act - When */
    let additionResult = sut.addition(summand1: number1, summand2: number2)
    
    /* Assert - Then */
    XCTAssertEqual(additionResult, expectedResult)
    XCTAssertTrue(additionResult == expectedResult)
    XCTAssertFalse(additionResult == expectedNumberToFail)
  }
  
  /* Primer test de operaciones matemáticas (Resta) */
  func testSubtractionOfTwoNumbers_WhenTwoNumbersAreGiven_ResultShouldBePass() {
    
    let number1 = 40.0
    let number2 = 20.0
    let operation = ArithmeticOperations()
      
    let subtractionResult = operation.subtraction(minuend: number1, subtrahend: number2)
    
    XCTAssertEqual(subtractionResult, 20.0)
  }
  
  func testAdditionOfTwoArrays_WhenTwoArraysAreGiven_ResultShouldBePass() {
    
    let vector1 = [9, 8, 7]
    let vector2 = [6, 5, 4]
    let operation = ArithmeticOperations()
    
    let arraysAdditionResult = operation.ArraysAddition(augend: vector1, addend: vector2)
    
    XCTAssertEqual(arraysAdditionResult, [15, 13, 11])
  }
  
  func testMultiplicationOfTwoNumbers_WhenTwoNumbersAreGiven_ResultShouldBePass() {
    
    let number1 = 30.0
    let number2 = 3.0
    let expectedResult = 90.0
    let expectedNumberToFail = 0.0
    
    let multiplicationResult = sut.multiplication(multiplier: number1, multiplicand: number2)
    
    XCTAssertEqual(multiplicationResult, expectedResult)
    XCTAssertTrue(multiplicationResult == expectedResult)
    
  }
  
  func testDivisionOfTwoNumbers_WhenTwoNumbersAreGiven_ResultShouldBePass() {
    
    let number1 = 60.0
    let number2 = 4.0
    let expectedResult = 15.0
    let expectedNumberToFail = 0.0
    
    let divisionResult = sut.division(dividend: number1, divisor: number2)
    
    XCTAssertEqual(divisionResult, expectedResult)
    XCTAssertTrue(divisionResult == expectedResult)
  }


}
