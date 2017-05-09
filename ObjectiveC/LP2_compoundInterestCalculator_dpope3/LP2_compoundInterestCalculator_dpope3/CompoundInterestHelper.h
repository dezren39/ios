//
//  CompoundInterestHelper.h
//  LP2_compoundInterestCalculator_dpope3
//
//  Created by dez on 4/25/17.
//  Copyright © 2017 assignment3 Drewry Pope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CompoundInterestHelper : NSObject
+ (NSDecimalNumber*) compoundInterestForPrincipal: (NSDecimalNumber*)principalValue withInterestRatePct: (NSDecimalNumber*) ratePct overNumberOfYears: (NSInteger) numYears timesPerYear: (NSInteger) numTimesPerYear;
@end
