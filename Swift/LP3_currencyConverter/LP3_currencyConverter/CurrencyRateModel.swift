//
//  CurrencyRateModel.swift
//  LP3_currencyConverter
//
//  Created by Pope, Drewry on 5/8/17.
//  Copyright © 2017 assignmentInClass5 Drew Pope. All rights reserved.
//

import UIKit

class CurrencyRateModel: NSObject {
    static func exchangeRates(fromCurrency:String, toCurrency:String) -> Double {
        let conversionRates = ["US Dollar": ["Euro":0.94, "British Pound":0.8, "Japanese Yen":108.97],
                               "Euro": ["US Dollar":1.06, "British Pound":0.85, "Japanese Yen":116.04],
                               "British Pound": ["US Dollar":1.18, "Euro":1.256, "Japanese Yen":136.903],
                               "Japanese Yen": ["US Dollar":0.0092, "Euro":0.0086, "British Pound":0.0073]]
        return conversionRates[fromCurrency]![toCurrency]!
    }
}

