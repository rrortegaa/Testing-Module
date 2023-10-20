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
  
  var sutName = NameValidation() // System or Object under test
  var sutPassword = PasswordValidation() // System or Object under test

  func testSignUp_whenNameIsGiven_ShouldPass() {
    
    /* Given */
    let firstName = "Rose"
    
    /* When */
    let validName = sutName.validateFirstName(name: firstName)
    
    /* Then */
    XCTAssertTrue(validName, "True: If name is given")
  }
  
  func testSignUp_whenNameGivenIsEmpty_ShouldNotPass() {
    
    /* Given */
    let firstName = ""
    
    /* When */
    let noValidName = sutName.validateFirstName(name: firstName)
    
    /* Then/Assert */
    XCTAssertFalse(noValidName, "False: If name is empty")
  }
  
  func testSignUp_whenNameGivenIsMinorTo3Characters_ShouldNotPass() {
    
    /* Given */
    let firstName = "Be"
    
    /* When */
    let noValidName = sutName.validateFirstName(name: firstName)
    
    XCTAssertFalse(noValidName, "False: If name is minor to 3 characters")
  }
  
  func testSignUp_whenNameGivenIsMayorTo10Characters_ShouldNotPass() {
    
    let firstName = "Guadalupita"

    let noValidName = sutName.validateFirstName(name: firstName)
    
    XCTAssertFalse(noValidName, "False: If name is mayor to 10 characters")
  }
  
  func testSignUp_whenPasswordIsGivenAndAreEquals_ShouldPass() {
    
    let storedPassword = "Aa12345678"
    var password = "Aa12345678"
    
    let validPassword = sutPassword.validatePassword(password: password, storedPassword: storedPassword)
    
    XCTAssertTrue(validPassword, "True: If password and storedPassword are equals")
  }
  
  func testSignUp_whenPasswordIsGivenAndNotAreEquals_ShouldNotPass() {
    
    let storedPassword = "Aa12345678"
    var password = "Ab12345677"
    
    let validPassword = sutPassword.validatePassword(password: password, storedPassword: storedPassword)
    
    XCTAssertFalse(validPassword, "False: If password and storedPassword are not equals")
  }
  
}
