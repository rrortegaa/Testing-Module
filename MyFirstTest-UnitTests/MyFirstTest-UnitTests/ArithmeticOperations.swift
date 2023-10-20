//
//  ArithmeticOperations.swift
//  MyFirstTest-UnitTests
//
//  Created by Rose on 17/10/23.
//

import Foundation

class ArithmeticOperations {
  
  func addition(summand1: Double, summand2: Double) -> Double {
    
    return summand1 + summand2
  }
  
  func subtraction(minuend: Double, subtrahend: Double) -> Double {
    
    return minuend - subtrahend
  }
  
  func ArraysAddition(augend: Array<Int>, addend: Array<Int>) -> Array<Int> {
    var result = [Int]()
    
    for i in 0..<augend.count {
      result.append(augend[i] + addend[i])
    }
    
    return result
  }
  
  func multiplication(multiplier: Double, multiplicand: Double) -> Double {
    
    return multiplier * multiplicand
  }
  
  func division(dividend: Double, divisor: Double) -> Double {
    
    return dividend / divisor
  }
  
}
