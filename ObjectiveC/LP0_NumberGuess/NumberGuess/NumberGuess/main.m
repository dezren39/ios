//
//  main.m
//  NumberGuess
//
//  Created by Pope, Drewry on 3/27/17.
//  Copyright © 2017 assignment0 Drew Pope. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /*
        int num = 100;
        double discount = 0.25;
        char myChar = 'm';
        BOOL isDone = NO;
        
        const double PI = 3.14159;
        
        NSLog(@"Some think the Honjo Masamune would fetch a huge sum like $%i%c or more.\n\nHowever, because of difficulty authenticating it, you might only get the discount rate of %.2f%c. Chances of auctioning off in Japan? %i", num, myChar, discount, myChar, isDone);
        */
        int repeat = 0;
        int answer;
        int tries;
        int guess;
        
        do {
            tries = 0;
            answer = arc4random() % 100 + 1;
        
            NSLog(@"The number is %i", answer);

            while (guess != answer) {
                tries += 1;
                
                NSLog(@"Guess #%i: ", tries);
                scanf("%i", &guess);
                
                if (guess > answer) {
                    NSLog(@"Sorry, try lower.");
                } else if (guess < answer) {
                    NSLog(@"Sorry, try higher.");
                }
            }
            
            NSLog(@"Success! It took %i tries to guess %i.", tries, answer);
            
            NSLog(@"Would you like to try again? 0 for no.");
            scanf("%i", &repeat);
        } while (repeat != 0);
        NSLog(@"\n");
    }
    return 0;
}
