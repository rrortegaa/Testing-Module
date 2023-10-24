//
//  NameValidation.swift
//  SignUp-Testing
//
//  Created by Rose on 19/10/23.
//

import Foundation

class NameValidation {
  
  func validateFirstName(name: String) -> Bool {
    
    var returnValue = true
    
    if name.isEmpty {
      
      returnValue = false
      
    } else if name.count < ParametersConstants.firstNameMinLenght || name.count > ParametersConstants.firstNameMaxLenght {
      
      returnValue = false
      
    }
    return returnValue
  }
}
