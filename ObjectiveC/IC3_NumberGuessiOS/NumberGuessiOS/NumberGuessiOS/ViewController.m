//
//  ViewController.m
//  NumberGuessiOS
//
//  Created by Pope, Drewry on 4/3/17.
//  Copyright © 2017 assignmentInClass3 Drew Pope. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view, typically from a nib.
    
    // Call setupGame to do set up tasks for the game.
    [self setupGame];
    
}

- (void)setupGame {
    tries = 0;
    target = arc4random() % 100 + 1; // 1 - 100
    
    //Clear guess textfield and response label.
    guessTextField.text = @"";
    responseLabel.text = @"";
    
    [guessTextField becomeFirstResponder];
}

- (IBAction)submitGuess {
    //NSLog(@"Your guess of %@ was submitted.", guessTextField.text);
    
    //Obtain guess.
    
    guess = guessTextField.text.integerValue;
    
    if (guess > 0 && guess <= 100) {
        tries += 1;
        
        if (guess > target) {
            responseLabel.text = [NSString stringWithFormat:@"Guess #%li (%li) was too high.\n\nGuess lower...", (long)tries, (long)guess];

        } else if (guess < target) {
            responseLabel.text = [NSString stringWithFormat:@"Guess #%li (%li) was too low.\n\nGuess lower...", (long)tries, (long)guess];

        } else {
            //responseLabel.text = [NSString stringWithFormat:@"Guess #%li (%li) was correct!\n\nIt only took you %li guesses", (long)tries, (long)guess, (long)tries];
            responseLabel.text = [NSString stringWithFormat:@"Guess #%li (%li) was correct!\n\nIt only took you %li guesses", (long)tries, (long)guess, (long)tries];
            //Add a popup alert that informs the user of their victory,
            //number of guesses it took them, and asks if they would like to play again.
            //If they do, reset target answer, and number of tries.
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Correct" message: [NSString stringWithFormat:@"Guess #%li (%li) was correct!\n\nIt only took you %li guesses.", (long)tries, (long)guess, (long)tries] preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *playAgainAction = [UIAlertAction actionWithTitle:@"Play Again" style:UIAlertActionStyleDefault handler: ^(UIAlertAction * action) {
                [self setupGame];
            }];
            [alert addAction: playAgainAction];
            [self presentViewController:alert animated:YES completion:nil];
        }

    } else {
        responseLabel.text = [NSString stringWithFormat:@"\"%@\" was invalid. Please guess a number between 1 and 100.", guessTextField.text];
    }
    guessTextField.text = @"";
}
@end
