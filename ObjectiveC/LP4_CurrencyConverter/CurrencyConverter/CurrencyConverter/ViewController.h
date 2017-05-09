//
//  ViewController.h
//  CurrencyConverter
//
//  Created by Pope, Drewry on 4/10/17.
//  Copyright © 2017 assignmentInClass4 Drew Pope. All rights reserved.
//
#import <UIKit/UIKit.h>
@interface ViewController : UIViewController <UIPickerViewDataSource, UIPickerViewDelegate>{
    __weak IBOutlet UITextField *fromAmountTextfield;
    __weak IBOutlet UITextField *toAmountTextField;
    __weak IBOutlet UIButton *convertButton;
    __weak IBOutlet UILabel *responseLabel;
}
@property (weak, nonatomic) IBOutlet UIPickerView *pickerFrom;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerTo;
- (IBAction)convertCurrency:(UIButton *)sender;
@end
