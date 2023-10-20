//
//  ContentView.swift
//  TipCalculationApp
//
//  Created by Rose on 18/10/23.
//

import SwiftUI

struct ContentView: View {
  @State private var enteredAmount: String = ""
  @State private var tipAmount: Double = 0
  @State private var totalAmount: Double = 0
  @State private var tipSlider: Double = 15
  var body: some View {
    VStack(spacing: 40) {
      VStack {
        Text("Enter Bill Amount")
          .foregroundColor(.secondary)
        TextField("0.00" , text: $enteredAmount)
          .font(.system(size: 70, weight: .semibold, design: .rounded))
          .keyboardType(.decimalPad)
          .multilineTextAlignment(.center)
      }
      Text("Tip \(tipSlider, specifier: "%.0f")%")
      Slider(value: $tipSlider, in: 0...10, step: 1)
        .onChange(of: tipSlider) { _ in
          guard let amount = Double(enteredAmount) else {
            print("Invalid entry")
            return
          }
          guard let tip = Calculation().calculateTip(of: amount, with: tipSlider) else {
            print("Bill amount or tip cannot be negative")
            return
          }
          tipAmount = tip
          totalAmount = amount + tipAmount
        }
      VStack {
        Text(tipAmount, format: .currency(code: "USD"))
          .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/.bold())
        Text("Tip:")
          .foregroundColor(.secondary)
          .font(.caption)
      }
      .padding(40)
      VStack {
        Text(totalAmount, format: .currency(code: "USD"))
          .font(.title.bold())
        Text("Total:")
          .foregroundColor(.secondary)
          .font(.caption)
      }
    }
      .padding(40)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
  
struct Calculation {
  
  func calculateTip(of enteredAmount: Double, with tip: Double) -> Double? {
    
    guard enteredAmount >= 0 && tip >= 0 else { return nil }
    let tipPercentage = tip / 100
    return enteredAmount * tipPercentage
  }
}
