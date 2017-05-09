//
//  ViewController.swift
//  LP3_currencyConverter
//
//  Created by Pope, Drewry on 5/8/17.
//  Copyright © 2017 assignmentInClass5 Drew Pope. All rights reserved.
//

import UIKit

class ViewController: UIViewController,  UIPickerViewDelegate, UIPickerViewDataSource {
    let pickerFromData = ["US Dollar", "Euro", "British Pound", "Japanese Yen"]
    let pickerToData = ["Euro", "US Dollar", "British Pound", "Japanese Yen"]

    var selectedFromCurrency:Int = 0
    var selectedToCurrency:Int = 0

    var rateFrom:Double = 0
    var fromAmount:Double = 0
    var toAmount:Double = 0
    
    @IBOutlet weak var fromAmountTextField: UITextField!
    @IBOutlet weak var toAmountTextField: UITextField!
    
    @IBOutlet weak var convertButton: UIButton!
    
    @IBOutlet weak var responseLabel: UILabel!

    @IBOutlet weak var pickerFrom: UIPickerView!
    @IBOutlet weak var pickerTo: UIPickerView!

    @IBAction func convertCurrency(_ sender: Any) {
        if (Validator.isDifferent(fromCurrencyType:pickerFromData[selectedFromCurrency], thanToCurrency: pickerToData[selectedToCurrency])) {
            if(Validator.isValid(currencyAmount: fromAmountTextField.text!)) {
                rateFrom = CurrencyRateModel.exchangeRates(fromCurrency: pickerFromData[selectedFromCurrency], toCurrency: pickerToData[selectedToCurrency])
                fromAmount = Double(fromAmountTextField.text!)!
   
                responseLabel.text = String(format: "1.00 %@ equals %@ %.02f", locale: Locale.current, arguments: [ pickerFromData[selectedFromCurrency], rateFrom, pickerToData[selectedToCurrency]])
                rateFrom *= 100
                toAmount = (fromAmount * rateFrom) / 100
                    toAmountTextField.text = String(format: "%.02f", locale: Locale.current, arguments: [toAmount])
            }else {
                responseLabel.text = "Invalid amount! Please enter a valid amount for the currency you wish to convert from."
                fromAmountTextField.text = ""
                toAmountTextField.text = ""
            }
        } else {
            responseLabel.text = "Your convert from and convert to currencies must be different! Please change at least one of your currency types."
            toAmountTextField.text = ""
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        responseLabel.layer.masksToBounds = true
        responseLabel.layer.cornerRadius = 8
        
        convertButton.layer.backgroundColor = UIColor.init(colorLiteralRed: 0.9, green: 0.9, blue: 0.9, alpha: 1.0).cgColor
        convertButton.layer.borderColor = UIColor.magenta.cgColor
        convertButton.layer.borderWidth = 0.5
        convertButton.layer.cornerRadius = 8
        
        self.pickerFrom.delegate = self;
        self.pickerFrom.dataSource = self;
        self.pickerTo.delegate = self;
        self.pickerTo.dataSource = self;
    }
    
    public func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if (pickerView == pickerFrom) {
            selectedFromCurrency = row;
        } else if (pickerView == pickerTo) {
            selectedToCurrency = row;
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent:Int) -> Int {
        if (pickerView == pickerFrom) {
            return pickerFromData.count
        } else if (pickerView == pickerTo) {
            return pickerToData.count
        }
        return 0;
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if (pickerView == pickerFrom) {
            return pickerFromData[row]
        } else if (pickerView == pickerTo) {
            return pickerToData[row]
        }
        return ""
    }
}
