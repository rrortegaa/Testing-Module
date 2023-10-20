//
//  PasswordValidation.swift
//  SignUp-Testing
//
//  Created by Rose on 19/10/23.
//

import Foundation

class PasswordValidation {
  
  func validatePassword(password: String, storedPassword: String) -> Bool {
    
    var returnValue = false
    
    if password == storedPassword {
      returnValue = true
    }
    return returnValue
    
  }
}
