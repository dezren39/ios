//
//  Validator.m
//  LP2_compoundInterestCalculator_dpope3
//
//  Created by dez on 4/25/17.
//  Copyright © 2017 assignment3 Drewry Pope. All rights reserved.
//

#import "Validator.h"

@implementation Validator
+ (bool) isEmptyField: (NSString*) textValue {
    NSLog(@"%@", textValue);
    return [textValue  isEqual: @""] ? YES : NO;
}
+ (bool) isInvalidDecimalNumber: (NSDecimalNumber*) numberValue {
    return [NSDecimalNumber isKindOfClass:[numberValue class]] ||
            numberValue == [NSDecimalNumber notANumber] ? YES : NO;
}
+ (bool) isInvalidInteger: (NSInteger*) integerValue {
    //NSLog(@"%ld", (long)*integerValue);
    return integerValue <= 0 ? YES : NO;
}
@end
