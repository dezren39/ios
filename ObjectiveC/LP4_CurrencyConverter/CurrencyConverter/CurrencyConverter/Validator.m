//
//  Validator.m
//  CurrencyConverter
//
//  Created by Pope, Drewry on 4/12/17.
//  Copyright © 2017 assignmentInClass4 Drew Pope. All rights reserved.
//

#import "Validator.h"

@implementation Validator
+ (BOOL)isDifferentFromCurrency:(NSString *)fromCurrencyType thanToCurrency:(NSString *)toCurrencyType {
    //NSLog(@"fromCurrency = %@ thanToCurrency = %@", fromCurrencyType, toCurrencyType);
    return fromCurrencyType == toCurrencyType ? NO : YES;
}
+ (BOOL)isValidFromAmount:(NSString *)fromCurrencyAmountText {
    /*
    NSDecimalNumber *fromCurrencyAmount;
    
    if (!fromCurrencyAmountText.length){
        return NO;
    } else if ([fromCurrencyAmount = [NSDecimalNumber decimalNumberWithString: fromCurrencyAmountText] isEqualToNumber:[NSDecimalNumber notANumber]]){
        return NO;
    } else if ([fromCurrencyAmount doubleValue] <= 0) {
        return NO;
    } else {
        return YES;
    } */
    NSDecimalNumber *fromCurrencyAmount = [NSDecimalNumber decimalNumberWithString: fromCurrencyAmountText];
    return fromCurrencyAmount == NSDecimalNumber.notANumber || [fromCurrencyAmount doubleValue] <= 0 ? NO : YES;
}

@end
