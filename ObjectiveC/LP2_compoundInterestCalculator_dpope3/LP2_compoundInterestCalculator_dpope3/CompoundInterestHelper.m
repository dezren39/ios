//
//  CompoundInterestHelper.m
//  LP2_compoundInterestCalculator_dpope3
//
//  Created by dez on 4/25/17.
//  Copyright © 2017 assignment3 Drewry Pope. All rights reserved.
//

#import "CompoundInterestHelper.h"

@implementation CompoundInterestHelper {
    
}
+ (NSDecimalNumber*) compoundInterestForPrincipal: (NSDecimalNumber*)principalValue
                              withInterestRatePct: (NSDecimalNumber*) ratePct
                                overNumberOfYears: (NSInteger) numYears
                                     timesPerYear: (NSInteger) numTimesPerYear {
    
    NSDecimalNumber *one = [[NSDecimalNumber alloc] initWithInt:1];
    NSDecimalNumber *oneHundred = [[NSDecimalNumber alloc] initWithInt:100];
    NSDecimalNumber *timesPerYearDecimal = [[NSDecimalNumber alloc] initWithInteger:numTimesPerYear];
    NSDecimalNumber *correctInterestRate = [ratePct decimalNumberByDividingBy:oneHundred];
    NSDecimalNumber *rateOverTimesPerYear = [correctInterestRate decimalNumberByDividingBy: timesPerYearDecimal];
    NSDecimalNumber *sumResult = [rateOverTimesPerYear decimalNumberByAdding: one];
    NSUInteger powerValue = numYears * numTimesPerYear;
    NSDecimalNumber *factorAmount = [sumResult decimalNumberByRaisingToPower:powerValue];
    NSLog(@"Made IT.");
    return [principalValue decimalNumberByMultiplyingBy:factorAmount];
}
@end
