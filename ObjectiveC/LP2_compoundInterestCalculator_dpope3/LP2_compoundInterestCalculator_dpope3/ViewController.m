//
//  ViewController.m
//  LP2_compoundInterestCalculator_dpope3
//
//  Created by dez on 4/25/17.
//  Copyright © 2017 assignment3 Drewry Pope. All rights reserved.
//

#import "ViewController.h"
#import "Validator.h"
#import "CompoundInterestHelper.h"

@interface ViewController ()

@end

@implementation ViewController {
    NSDecimalNumber *principalAmount;
    NSDecimalNumber *interestRatePct;
    NSDecimalNumber *resultValue;
    NSInteger numberOfYears;
    NSInteger timesPerYear;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _calcInterestButton.layer.borderColor = [UIColor colorWithRed:0.02 green:0.00 blue:1.00 alpha:1.0].CGColor;
    _calcInterestButton.layer.borderWidth = 1.0f;
    _calcInterestButton.layer.cornerRadius = 5;
    
    _outputTextView.layer.borderColor = [UIColor darkGrayColor].CGColor;
    _outputTextView.layer.borderWidth = 1.0f;
    _outputTextView.layer.cornerRadius = 5;
    
    _outputTextView.keyboardType = UIKeyboardTypeNumberPad;
    _principalTextField.keyboardType = UIKeyboardTypeNumberPad;
    _rateTextField.keyboardType = UIKeyboardTypeNumberPad;
    _numYearsTextField.keyboardType = UIKeyboardTypeNumberPad;
    _timesPerYearTextField.keyboardType = UIKeyboardTypeNumberPad;
    
    [_principalTextField becomeFirstResponder];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)calculateCompoundInterest:(id)sender {
    _outputTextView.text = @"";
    [self refreshUIKeyboards];
    if ([self textFieldsAreValid]){
        NSNumberFormatter  *numFormat = [[NSNumberFormatter alloc] init];
        [numFormat setNumberStyle:NSNumberFormatterCurrencyStyle];
        [numFormat setLenient:YES];
                
        principalAmount = [NSDecimalNumber decimalNumberWithString:_principalTextField.text];
        interestRatePct = [NSDecimalNumber decimalNumberWithString:_rateTextField.text];
        numberOfYears = [[NSNumber numberWithInt: [_numYearsTextField.text intValue]] integerValue];
        timesPerYear = [[NSNumber numberWithInt: [_timesPerYearTextField.text intValue]] integerValue];
        
        _outputTextView.text = [NSString stringWithFormat:@"%@ invested at %@%% for %ld years compounded %ld times per year is %@", [numFormat stringFromNumber:principalAmount], interestRatePct, (long)numberOfYears, (long)timesPerYear, [numFormat stringFromNumber: [CompoundInterestHelper compoundInterestForPrincipal: principalAmount withInterestRatePct: interestRatePct overNumberOfYears: numberOfYears timesPerYear: timesPerYear]]];
        [self refreshUI];
    }
}


- (bool)textFieldsAreValid {
    
    bool allFieldsAreValid = YES;
    bool principalFieldValid = YES;
    bool ratePctFieldValid = YES;
    bool numberOfYearsFieldValid = YES;
    bool timesPerYearFieldValid = YES;
    
    if ([Validator isEmptyField: _principalTextField.text]) {
        allFieldsAreValid = NO;
        principalFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Principal Amount is Empty. "];
    } else if ([Validator isInvalidDecimalNumber: [NSDecimalNumber decimalNumberWithString: _principalTextField.text]]) {
        allFieldsAreValid = NO;
        principalFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Principal Amount is Invalid. "];
    }
    
    if ([Validator isEmptyField: _rateTextField.text]) {
        allFieldsAreValid = NO;
        ratePctFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Interest Rate Pct is Empty. "];
    } else if ([Validator isInvalidDecimalNumber: [NSDecimalNumber decimalNumberWithString:_rateTextField.text]]) {
        allFieldsAreValid = NO;
        ratePctFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Interest Rate Pct is Invalid. "];
    }
    
    if ([Validator isEmptyField: _numYearsTextField.text]) {
        allFieldsAreValid = NO;
        numberOfYearsFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Number of Years is Empty. "];
    } else if ([Validator isInvalidInteger: (NSInteger*)[_numYearsTextField.text integerValue]]) {
        allFieldsAreValid = NO;
        numberOfYearsFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Number of Years is Invalid. "];
    }
    
    if([Validator isEmptyField: _timesPerYearTextField.text]) {
        allFieldsAreValid = NO;
        timesPerYearFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Times per Year is Empty. "];
    }else if ([Validator isInvalidInteger: (NSInteger*)[_timesPerYearTextField.text integerValue]]) {
        allFieldsAreValid = NO;
        timesPerYearFieldValid = NO;
        _outputTextView.text = [_outputTextView.text stringByAppendingString: @"| Times per Year is Invalid. "];
    }
    
    _outputTextView.text = allFieldsAreValid ? _outputTextView.text : [_outputTextView.text stringByAppendingString:@"|"];
    
    _principalTextField.text = principalFieldValid ? _principalTextField.text : @"";
    _rateTextField.text = ratePctFieldValid ? _rateTextField.text : @"";
    _numYearsTextField.text = numberOfYearsFieldValid ? _numYearsTextField.text : @"";
    _timesPerYearTextField.text = timesPerYearFieldValid ? _timesPerYearTextField.text : @"";
    
    return allFieldsAreValid;
}
         
         
- (void)refreshUI {
    _principalTextField.text = @"";
    _rateTextField.text = @"";
    _numYearsTextField.text = @"";
    _timesPerYearTextField.text = @"";
}
         
         
- (void)refreshUIKeyboards {
    [_principalTextField resignFirstResponder];
    [_rateTextField resignFirstResponder];
    [_numYearsTextField resignFirstResponder];
    [_timesPerYearTextField resignFirstResponder];
}
         
         
@end
