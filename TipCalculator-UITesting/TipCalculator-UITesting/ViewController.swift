//
//  ViewController.swift
//  TipCalculator-UITesting
//
//  Created by Rose on 20/10/23.
//

import UIKit

class ViewController: UIViewController {
  var totalTextField : UITextField?
  var personasTextField : UITextField?
  var porcentaTextField : UITextField?
  var firstLabel : UILabel?
  var totalLabel : UILabel?
  var calcularButton : UIButton?
  var width = UIScreen.main.bounds.width
  var height = UIScreen.main.bounds.height
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .darkGray
    initUI()
  }
  
  func initUI(){
    firstLabel = UILabel(frame: CGRect(x: 70, y: 50, width: width - 150 , height: 40))
    firstLabel?.textAlignment = NSTextAlignment.center
    firstLabel?.backgroundColor = .black
    firstLabel?.textColor = .red
    firstLabel?.layer.cornerRadius = 10
    firstLabel?.layer.borderColor = UIColor.black.cgColor
    firstLabel?.layer.borderWidth = 3
    firstLabel?.text = "TIP CALCULATOR"
    view.addSubview(firstLabel!)
    //--------------- Total_Field ---------------
    totalTextField = UITextField(frame: CGRect(x: 20, y: 140, width: width - 40, height: 40))               //inicializar un objeto
    totalTextField?.textAlignment = NSTextAlignment.center // para centrar el texto dentro de el text field
    //es lo que indica que es lo que vamos a ingresar en cajas de texto, por lo regular es gris
    totalTextField?.placeholder = " Total de la cuenta? "
    totalTextField?.backgroundColor = .white
    totalTextField?.layer.cornerRadius = 10
    totalTextField?.layer.borderColor = UIColor.black.cgColor
    totalTextField?.layer.borderWidth = 3
    totalTextField?.keyboardType = .decimalPad
    view.addSubview(totalTextField!)
    //--------------- Personas_Field ---------------
    personasTextField = UITextField(frame: CGRect(x: 20, y: 230, width: width - 40, height: 40))
    personasTextField?.placeholder = " # de personas? "
    personasTextField?.textAlignment = NSTextAlignment.center
    personasTextField?.backgroundColor = .white
    personasTextField?.layer.cornerRadius = 10
    personasTextField?.layer.borderColor = UIColor.cyan.cgColor
    personasTextField?.layer.borderWidth = 3
    personasTextField?.keyboardType = .decimalPad
    view.addSubview(personasTextField!)
    //--------------- Porcentaje_Field ---------------
    porcentaTextField = UITextField(frame: CGRect(x: 20, y: 320, width: width - 40, height: 40))
    porcentaTextField?.placeholder = " % de propina?"
    porcentaTextField?.textAlignment = NSTextAlignment.center
    porcentaTextField?.backgroundColor = .white
    porcentaTextField?.layer.cornerRadius = 10
    porcentaTextField?.layer.borderColor = UIColor.red.cgColor
    porcentaTextField?.layer.borderWidth = 3
    porcentaTextField?.keyboardType = .decimalPad
    view.addSubview(porcentaTextField!)
    //--------------- Calcula_Button ---------------
    calcularButton = UIButton(frame: CGRect(x: 60, y: 500, width: width - 120, height: 40))
    calcularButton?.backgroundColor = .black
    calcularButton?.layer.cornerRadius = 10
    calcularButton?.setTitle("Calcular", for: .normal)
    calcularButton?.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
    view.addSubview(calcularButton!)
    //--------------- Label_text ---------------
    totalLabel = UILabel(frame: CGRect(x: 70, y: 410, width: width - 150 , height: 40))
    totalLabel?.textAlignment = NSTextAlignment.center
    totalLabel?.backgroundColor = .black
    totalLabel?.layer.cornerRadius = 10
    totalLabel?.textColor = .yellow
    totalLabel?.text = " "
    view.addSubview(totalLabel!)
  }
  
  @objc func buttonAction() {
    print("Boton presionado")
    var alertText = ""
    var cuenta : Float = 0.0
    var personas = 1
    var porcentaje : Float = 0.0
    var tip : Float = 0
    var totalPerPerson : Float = 0.0
    if let totalCuenta = totalTextField?.text {//aqui trae el texto y lo guarda el la variable
      if let totalNumber = Float(totalCuenta) { // if let.. es si puedo crearla, no es un if
        print("El total de la cuenta es : \(totalNumber)")
        cuenta = totalNumber
      } else {
        print("Ingresa un dato valido para el total ")
        alertText = "Ingresa un valor valido para el total de la cuenta"
      }
    }
    if let totalPersonas = personasTextField?.text {
      if let personasNumber = Int(totalPersonas) {
        print("El total de personas es: \(personasNumber)")
        personas = personasNumber
      } else {
        print("Ingresa un dato valido para personas")
        alertText = "Ingresa un valor valido para el numero de personas"
      }
    }
    if let porcentajeText = porcentaTextField?.text {
      if let porcentajeNumber = Float(porcentajeText) {
        print("El porcentaje de propina es : \(porcentajeNumber)")
        porcentaje = porcentajeNumber
      } else {
        print("Ingresa un dato valido para el porcentaje")
        alertText = "Ingresa un valor valido para el porcentaje"
      }
      if alertText.isEmpty {
        tip = (cuenta * porcentaje) / 100
        print(" La propina es: \(tip)")
        totalPerPerson = (cuenta + tip ) / Float(personas)
        print(" Esto es el total por persona \(totalPerPerson)" )
        totalLabel?.text = "Pago por persona: $\(totalPerPerson)"
      } else {
        let alert = UIAlertController(title: "Error de datos", message: alertText, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK :( ", style: .default, handler: nil))
        self.present(alert,animated: true, completion: nil)
      }
    }
  }
}
