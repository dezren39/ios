//
//  CurrencyRateModel.h
//  CurrencyConverter
//
//  Created by Pope, Drewry on 4/17/17.
//  Copyright © 2017 assignmentInClass4 Drew Pope. All rights reserved.
//

#import <Foundation/Foundation.h>


// Declare public constants

extern NSString *const USD;
extern NSString *const Euro;
extern NSString *const GBP;
extern NSString *const Yen;

@interface CurrencyRateModel : NSObject
+ (NSDecimalNumber *)exchangeRateFrom:(NSString *)fromCurrency to:(NSString *)toCurrency;
@end
