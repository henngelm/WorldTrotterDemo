//
//  ConversionViewController.swift
//  WorldTrotterDemo
//
//  Created by Henngel Mojica on 2/14/18.
//  Copyright © 2018 Henngel Mojica. All rights reserved.
//

import UIKit

class ConversionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet var celsiusLabel: UILabel!
    @IBOutlet var textField: UITextField!
//    implementing the Temperature Conversion
    var fahrenheitValue: Measurement<UnitTemperature>? { //property observer
        didSet {
            updateCelsiusLabel()
        }
    }
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    

//    number formatter
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField){
        if let text = textField.text, let value = Double(text) {
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func updateCelsiusLabel() {
        if let celsiusValue = celsiusValue {
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateCelsiusLabel()
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        preventing multiple decimal separators
        let existingTextHasDecimalSeparator = textField.text?.range(of: ".")
        let replacementTextHasDecimalSeparator = string.range(of: ".")

//       Bronze challenge Disallow Alphabetic Characters
        let alphabeticCharacters = NSCharacterSet.letters
        let existingTextHasAlphabeticCharacters = textField.text?.rangeOfCharacter(from: alphabeticCharacters)
        let replacementTextHasAlphabeticCharacters = string.rangeOfCharacter(from: alphabeticCharacters)
        
        if existingTextHasDecimalSeparator != nil,
            replacementTextHasDecimalSeparator != nil { //        preventing multiple decimal separators
            return false
        } else if existingTextHasAlphabeticCharacters != nil ||
                    replacementTextHasAlphabeticCharacters != nil { //       Bronze challenge Disallow Alphabetic Characters
                return false
        } else {
            return true
        }
    }
}
