//
//  CurrencyRateModel.m
//  CurrencyConverter
//
//  Created by Pope, Drewry on 4/17/17.
//  Copyright © 2017 assignmentInClass4 Drew Pope. All rights reserved.
//

#import "CurrencyRateModel.h"
NSString *const USD = @"US Dollar";
NSString *const Euro = @"Euro";
NSString *const GBP = @"British Pound";
NSString *const Yen = @"Japanese Yen";

@implementation CurrencyRateModel

+ (NSDecimalNumber *)exchangeRateFrom:(NSString *)fromCurrency to:(NSString *)toCurrency {
    NSDictionary *conversionRates = @{
                                     USD:@{Euro: [NSDecimalNumber decimalNumberWithString:@"0.94"],
                                           GBP: [NSDecimalNumber decimalNumberWithString:@"0.8"],
                                           Yen: [NSDecimalNumber decimalNumberWithString:@"108.97"]},
                                     Euro:@{USD: [NSDecimalNumber decimalNumberWithString:@"1.06"],
                                            GBP: [NSDecimalNumber decimalNumberWithString:@"0.85"],
                                            Yen: [NSDecimalNumber decimalNumberWithString:@"116.04"]},
                                     GBP:@{USD: [NSDecimalNumber decimalNumberWithString:@"1.18"],
                                           Euro: [NSDecimalNumber decimalNumberWithString:@"1.256"],
                                           Yen: [NSDecimalNumber decimalNumberWithString:@"136.903"]},
                                     Yen:@{USD: [NSDecimalNumber decimalNumberWithString:@"0.0092"],
                                           Euro: [NSDecimalNumber decimalNumberWithString:@"0.0086"],
                                           GBP: [NSDecimalNumber decimalNumberWithString:@"0.0073"]}};

    //[conversionRates valueForKeyPath: [NSString stringWithFormat:@"%@.%@", fromCurrency, toCurrency]];
    //NSLog(@"\nfromCurrency = %@\ntoCurrency = %@\n\nExchange Rate = %@", fromCurrency, toCurrency, conversionRates[fromCurrency][toCurrency]);
    return conversionRates[fromCurrency][toCurrency];
}
@end
