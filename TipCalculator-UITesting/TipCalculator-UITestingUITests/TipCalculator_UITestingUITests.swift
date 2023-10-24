//
//  TipCalculator_UITestingUITests.swift
//  TipCalculator-UITestingUITests
//
//  Created by Rose on 20/10/23.
//

import XCTest

final class TipCalculator_UITestingUITests: XCTestCase {

  override func setUpWithError() throws {
  
    continueAfterFailure = false
  }

  func testTipCalculator_whenInputsValuesAreGiven_andButtonPressed_shouldPass() throws {

    let app = XCUIApplication()
    app.launch()
    /* Activar button Record UI Test */
    
    let title = app.staticTexts["TIP CALCULATOR"]
    XCTAssertTrue(title.exists, "El título es necesario")
    
    let billInput = app.textFields[" Total de la cuenta? "]
    XCTAssertTrue(billInput.exists, "Este textField es necesario")
    XCTAssertTrue(billInput.waitForExistence(timeout: 3000), "Espera 3s y verifica que el textField existe")
    billInput.tap()
    billInput.typeText("2000") // Given -> parámetro a probar
  
    let numberOfPersonsInput = app.textFields[" # de personas? "]
    XCTAssert(numberOfPersonsInput.exists, "El número de personas es necesario")
    numberOfPersonsInput.tap()
    numberOfPersonsInput.typeText("4") // Given -> parámetro a probar

    let tipPercentageInput = app.textFields[" % de propina?"]
    XCTAssert(tipPercentageInput.exists, "El porcentaje de propina es necesario")
    tipPercentageInput.tap()
    tipPercentageInput.typeText("20") // Given -> parámetro a probar
    
    let calculateButton = app.staticTexts["Calcular"]
    XCTAssertTrue(calculateButton.exists, "Este botón no existe o ha sido modificado y es requerido para calcular la cuenta individual")
    calculateButton.tap()
        /* /* Son equivalentes */
    app/*@START_MENU_TOKEN@*/.staticTexts["Calcular"]/*[[".buttons[\"Calcular\"].staticTexts[\"Calcular\"]",".staticTexts[\"Calcular\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
    XCUIApplication().staticTexts["Calcular"].tap()
    XCTAssertTrue(XCUIApplication().staticTexts["Calcular"].exists)
    */
    
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.tap()

    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
