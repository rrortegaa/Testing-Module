//
//  SignUp_Testing_Tests.swift
//  SignUp-Testing-Tests
//
//  Created by Rose on 19/10/23.
//

/* Example made by Test Driven Development Methodology (TDD) */

import XCTest
@testable import SignUp_Testing

final class SignUp_Testing_Tests: XCTestCase {

  func testSignUp_whenNameIsGiven_ShouldPass() {
    
    /* Given */
    let firstName = "Rose"
    let sut = NameValidation()
    
    /* When */
    let validName = sut.validateFirstName(name: firstName)
    
    /* Then */
    XCTAssertTrue(validName, "True: If name is given")
  }
  
  func testSignUp_whenNameGivenIsEmpty_ShouldNotPass() {
    
    /* Given */
    let firstName = ""
    let sut = NameValidation()
    
    /* When */
    let noValidName = sut.validateFirstName(name: firstName)
    
    /* Then/Assert */
    XCTAssertFalse(noValidName, "False: If name is empty")
  }
  
  func testSignUp_whenNameGivenIsMinorTo3Characters_ShouldNotPass() {
    
    /* Given */
    let firstName = "Be"
    let sut = NameValidation()
    
    /* When */
    let noValidName = sut.validateFirstName(name: firstName)
    
    XCTAssertFalse(noValidName, "False: If name is minor to 3 characters")
  }
  
  func testSignUp_whenNameGivenIsMayorTo10Characters_ShouldNotPass() {
    
    let firstName = "Guadalupita"
    let sut = NameValidation()
    let noValidName = sut.validateFirstName(name: firstName)
    
    XCTAssertFalse(noValidName, "False: If name is mayor to 10 characters")
  }
  
}
