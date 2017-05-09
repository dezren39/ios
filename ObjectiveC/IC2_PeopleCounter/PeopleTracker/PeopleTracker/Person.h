//
//  Person.h
//  PeopleTracker
//
//  Created by Pope, Drewry on 3/29/17.
//  Copyright © 2017 assignmentInClass2 Drew Pope. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject {
    //Properties...
    //
    // Declare instance variables (properties)
    // of our Person class. Each instance of
    // the class will have these properties
    // available for use. (public)
    //
    // Instance variables stored the individual
    // characteristics of each object instance
    // of the class, while class variables would
    // be shared by all instances of the class,
    // and accessed directly via the class name.

    //Objects -> Pointers
    NSString *firstName;
    NSString *lastName;
    //Primitive Data Types -> Not Pointers
    int age;
    
}

//Method Declarations...
//
// Declare the public methods of our class. We
// won't implement the dtails of the method here
// as that will be done in the .m implementation
// file.
//
// These declarations will "expose" the method
// names to outside code that imports this
// class.

//Instance methods are declared prefixing a '-'.
//Class methods are declared prefixing a '+'.

- (void)collectInfo;

- (void)printInfo;

+ (void)death;
@end
