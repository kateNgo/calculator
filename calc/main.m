//
//  main.m
//  calc
//

#import <Foundation/Foundation.h>
#import "calculator.h"

// Declare functions

/**
 This method is to parse input from command line into array of string that including operators and operands
 This convert char[] into array of NSString
 @param argc number of arguments
 @param argv array of arguments
 @return NSMutableArray an array of NSString
 */

NSMutableArray* parseInput(int argc, const char * argv[]);


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableArray *items = parseInput(argc, argv);
        calculator *calc = [[calculator alloc] init];
        NSNumber * n = [calc calculate:items];
        if (n != nil){
            int result = [n intValue];
            printf("%d", result);
            return 0;
        }else{
            return 1;
        }
        
        
    }
    
    
}

// Implement functions

NSMutableArray * parseInput (int argc, const char * argv[]) {
    NSMutableArray *items=[[NSMutableArray alloc] init];
    // there is at least 1 argument input
    if (argc >= 2) {
        for (int i = 1 ; i < argc;i++) {
            [items addObject:[NSString stringWithUTF8String:argv[i]]];
        }
    }
    return items;
}
