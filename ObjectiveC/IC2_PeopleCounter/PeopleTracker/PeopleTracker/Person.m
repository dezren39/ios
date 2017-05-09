//
//  Person.m
//  PeopleTracker
//
//  Created by Pope, Drewry on 3/29/17.
//  Copyright © 2017 assignmentInClass2 Drew Pope. All rights reserved.
//

#import "Person.h"

@implementation Person

- (void)collectInfo {

    NSLog(@"What is the first name?");
    char cString[40];
    scanf("\n%[^\n]", cString);
    
    //Convert our cString to NSString
    firstName = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    
    NSLog(@"What is the last name?");
    scanf("\n%[^\n]", cString);
    
    lastName = [NSString stringWithCString:cString encoding:NSUTF8StringEncoding];
    
    NSLog(@"How old is %@ %@?", firstName, lastName);
    scanf("%i", &age);
}

- (void)printInfo {
    NSLog(@"%@ %@ is %i old.", firstName, lastName, age);
}

+ (void)death {
    // Don't do this.
     while(true) {
         //fork();
         int counter = 0;
         while(counter < 100){
             int temp = 0;
             while(temp < counter){
                 NSLog(@"I'm afraid I can't stop, Jim.\nIt's already too late...");
                 temp += 1;
             }
             counter += 1;
         }
     }
}

@end
