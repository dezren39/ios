//
//  Validator.h
//  LP2_compoundInterestCalculator_dpope3
//
//  Created by dez on 4/25/17.
//  Copyright © 2017 assignment3 Drewry Pope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Validator : NSObject
+ (bool) isEmptyField: (NSString*) textValue;

+ (bool) isInvalidDecimalNumber: (NSDecimalNumber*) numberValue;

+ (bool) isInvalidInteger: (NSInteger*) integerValue;
    @end
