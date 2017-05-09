//
//  Validator.swift
//  LP3_currencyConverter
//
//  Created by Pope, Drewry on 5/8/17.
//  Copyright © 2017 assignmentInClass5 Drew Pope. All rights reserved.
//

import UIKit

class Validator: NSObject {
    static func isDifferent(fromCurrencyType:String, thanToCurrency:String) -> Bool {
        return fromCurrencyType != thanToCurrency
    }
    
    static func isValid(currencyAmount:String) -> Bool {
        return Double(currencyAmount) ?? 0 > 0
    }
}
