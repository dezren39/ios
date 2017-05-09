//
//  Validator.h
//  CurrencyConverter
//
//  Created by Pope, Drewry on 4/12/17.
//  Copyright © 2017 assignmentInClass4 Drew Pope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject
+ (BOOL)isDifferentFromCurrency:(NSString *)fromCurrencyType thanToCurrency:(NSString *)toCurrencyType;
+ (BOOL)isValidFromAmount:(NSString *)fromCurrencyAmountText;

@end
