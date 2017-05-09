//
//  ViewController.h
//  NumberGuessiOS
//
//  Created by Pope, Drewry on 4/3/17.
//  Copyright © 2017 assignmentInClass3 Drew Pope. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
    IBOutlet UITextField *guessTextField;
    __weak IBOutlet UILabel *responseLabel;
    
    NSInteger target;
    NSInteger tries;
    NSInteger guess;
}

@property(strong, nonatomic) NSString * xyz;

- (IBAction)submitGuess;

@end

