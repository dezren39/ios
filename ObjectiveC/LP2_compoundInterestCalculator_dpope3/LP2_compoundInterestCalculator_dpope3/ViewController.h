//
//  ViewController.h
//  LP2_compoundInterestCalculator_dpope3
//
//  Created by dez on 4/25/17.
//  Copyright © 2017 assignment3 Drewry Pope. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *principalTextField;
@property (weak, nonatomic) IBOutlet UITextField *rateTextField;
@property (weak, nonatomic) IBOutlet UITextField *numYearsTextField;
@property (weak, nonatomic) IBOutlet UITextField *timesPerYearTextField;
@property (weak, nonatomic) IBOutlet UIButton *calcInterestButton;
@property (weak, nonatomic) IBOutlet UITextView *outputTextView;
- (IBAction)calculateCompoundInterest:(id)sender;
@end

