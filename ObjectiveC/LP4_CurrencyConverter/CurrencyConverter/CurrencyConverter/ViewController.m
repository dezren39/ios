//
//  ViewController.m
//  CurrencyConverter
//
//  Created by Pope, Drewry on 4/10/17.
//  Copyright © 2017 assignmentInClass4 Drew Pope. All rights reserved.
//

#import "ViewController.h"
#import "Validator.h"
#import "CurrencyRateModel.h"

@interface ViewController () {
    //Declare private instance variables here...
    
    // NOTE: ***Cannot initialize here - must do
    // within implementation block below.
    NSArray *_pickerFromData;
    NSArray *_pickerToData;
    
    // These next two will be used as indexes into the above arrays.
    NSInteger selectedFromCurrency;
    NSInteger selectedToCurrency;
    
    NSDecimalNumber *oneHundred;
    NSDecimalNumber *rateFrom;
    NSDecimalNumber *fromAmount;
    NSDecimalNumber *toAmount;
}

//Add any private class variables here.

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //Alter button appearance
    convertButton.layer.backgroundColor = [UIColor colorWithRed:0.9f green:0.9f blue: 0.9f alpha: 1.0f].CGColor;
    convertButton.layer.borderColor = [UIColor magentaColor].CGColor;
    convertButton.layer.borderWidth = 0.5;
    convertButton.layer.cornerRadius = 8;
    
    //Initialize our pickerview data in our array instance variables.
    _pickerFromData = @[@"US Dollar", @"Euro", @"British Pound", @"Japanese Yen"];
    _pickerToData = @[@"Euro", @"US Dollar", @"British Pound", @"Japanese Yen"];
    
    self.pickerFrom.delegate = self;
    self.pickerFrom.dataSource = self;
    self.pickerTo.delegate = self;
    self.pickerTo.dataSource = self;
    
    
}
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{   //Classes can be accessed with object.property
    //shortcut- self.pickerfrom could be coded as _pickerFrom
    if (pickerView == _pickerFrom) {
        return _pickerFromData.count;
    } else if (pickerView == _pickerTo) {
        return _pickerToData.count;
    }
    return 0;
}

// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (pickerView == _pickerFrom) {
        return _pickerFromData[row];
    } else if (pickerView == _pickerTo) {
        return _pickerToData[row];
    }
    return @"";
}

// Capture the picker view selection
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    // This method is triggered whenever the user makes a change to the picker selection.
    // The parameter named row and component represents what was selected.
    if (pickerView == _pickerFrom) {
        selectedFromCurrency = row;
    } else if (pickerView == _pickerTo) {
        selectedToCurrency = row;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*if(![touch.view isMemberOfClass:[UITextField class]]) {
 [touch.view endEditing:YES];
 }*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    [touch.view endEditing: ![touch.view isMemberOfClass:[UITextField class]]];
}

- (IBAction)convertCurrency:(UIButton *)sender {
    
    //responseLabel.text = [NSString stringWithFormat:@"%li = %@\n%li = %@", selectedFromCurrency, _pickerFromData[selectedFromCurrency], selectedToCurrency, _pickerToData[selectedToCurrency]];

    //Validate the user's input.
    //
    // 1:) Ensure the from currency is different from the to currency.
    // 2:) Then check validity of entered from currency amount.
    if ([Validator isDifferentFromCurrency: _pickerFromData[selectedFromCurrency] thanToCurrency: _pickerToData[selectedToCurrency]]) {
        responseLabel.text = @"fromCurrency != toCurrency - Good!";
        if ([Validator isValidFromAmount:[fromAmountTextfield text]]) {
            //responseLabel.text = @"VALID";
            //Get the exchange rate to use in our currency conversion.
            rateFrom = [CurrencyRateModel exchangeRateFrom: _pickerFromData[selectedFromCurrency] to: _pickerToData[selectedToCurrency]];
            
            // It is now safe to convert fromAmountTextField.text to NSDecimalNumber
            // since we just validated it.
            fromAmount = [NSDecimalNumber decimalNumberWithString:fromAmountTextfield.text];
            
            NSDecimalNumberHandler *roundUp = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode: NSRoundUp scale:[NSNumber numberWithInt:2] raiseOnExactness:NO raiseOnOverflow:NO raiseOnUnderflow:NO raiseOnDivideByZero:YES];
            
            // Convert an integer constant of 100 to be an NSDecimalNumber
            
            oneHundred = [NSDecimalNumber numberWithInt:100];
            //[NSDecimalNumber decimalNumberWithDecimal:[[NSNumber numberWithInt:100] decimalValue]];
            //[NSDecimalNumber decimalNumberWithDecimal:[@100 decimalValue]];
            //oneHundred = [NSDecimalNumber numberWithInteger:[oneHundo integerValue];
            //NSLog(@"%@", oneHundred);
            
            responseLabel.text = [NSString stringWithFormat:@"1 %@ equals\n%@ %@", _pickerFromData[selectedFromCurrency], rateFrom, _pickerToData[selectedToCurrency]];
            
            rateFrom = [rateFrom decimalNumberByMultiplyingBy:oneHundred];
            
            toAmount = [[fromAmount decimalNumberByMultiplyingBy:rateFrom] decimalNumberByDividingBy:oneHundred withBehavior:roundUp];
            
            toAmountTextField.text = [NSNumberFormatter localizedStringFromNumber: toAmount numberStyle:NSNumberFormatterCurrencyStyle];
         
        } else {
            responseLabel.text = @"Invalid amount! Please enter a valid amount for the currency you wish to convert from.";

            fromAmountTextfield.text = @"";
        }

    } else {
        responseLabel.text = @"Your convert from and convert to currencies must be different! Please change at least one of your currency types.";
    }
}
@end
