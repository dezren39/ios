//
//  main.m
//  PeopleTracker
//
//  Created by Pope, Drewry on 3/29/17.
//  Copyright © 2017 assignmentInClass2 Drew Pope. All rights reserved.

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *newPerson;
        NSMutableArray *people = [[NSMutableArray alloc] init];
        bool repeat;
        
        // Create new person objects, collect info about each
        // person, print the info, and store each Person object
        // we create into our people array.
        do {
            newPerson = [[Person alloc] init];
            char response[6] = "";

            [newPerson collectInfo];
            [newPerson printInfo];
            [people addObject: newPerson];
            
            NSLog(@"Would you like to add another? (Y/N)");
            scanf("\n%[^\n]", response);

            repeat = response[0] != 'n' && response[0] != 'N' ? YES:NO;
        } while (repeat == YES);
        
        //Display number of people in array and then print each array element.
        NSLog(@"\n\nNumber of people in the people array: %lu", (unsigned long)people.count);
        for (Person *eachPerson in people) {
            [eachPerson printInfo];
        }
    }
    return 0;
}
