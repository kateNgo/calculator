//
//  Calculator.m
//  calc
//
//  Created by phuong on 30/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "Calculator.h"

const NSString* INCOMPLETE_EXPRESSION_ERRO = @"Incomplete expression. Expected input of the form [number] [operator number ...]";
const char ADD = '+';
const char SUBTRACT = '-';
const char MULTIPLE = '*';
const char DIVIDE = '/';
const char MODULE = '%';
const NSString* OPERATORS=@"+-*/%";
const NSString* ADD_SUBTRACT=@"+-";
const NSString* MULTI_DIVIDE=@"*/%";

const NSString*  DIGIT=@"0123456789";


@implementation Calculator {
    
}
+(int) calculateArithmetic: (NSString*) n1 and: (NSString *)n2 withOperator:(char) ope {
    int result =0;
    switch (ope) {
        case ADD :
            result = [n1 intValue] + [n2 intValue];
            break;
        case SUBTRACT :
            result = [n1 intValue] - [n2 intValue];
            break;
        case MULTIPLE :
            result = [n1 intValue] * [n2 intValue];
            break;
        case DIVIDE :
            result = [n1 intValue] / [n2 intValue];
            break;
        case MODULE :
            result = [n1 intValue] % [n2 intValue];
            break;
        default:
            break;
    }
    return result;
}
+(int) calculate: (NSMutableArray *) items {
        NSMutableArray *newArray = [[NSMutableArray alloc]init];
        // Firstly, reduce the express by calculating operators such as * / %
        int n = 0, i = 0;
        while (i < [items count]) {
            if (i % 2 == 0) {
                // This is an operand
                newArray[n] = items[i];
            } else {
                // This is an operator
                if ([ADD_SUBTRACT containsString: items[i]]) {
                    newArray[n] = items[i];
                } else {
                    n--;
                    char ope = [items[i] characterAtIndex:0];
                    int newValue = [Calculator calculateArithmetic:newArray[n] and:items[++i] withOperator: ope];
                    newArray[n]= [[NSString alloc] initWithFormat:@"%d" ,newValue];
                }
            }
            i++;
            n++;
        } // end while
        // finaly, calculate with operators like + -
        i = 1;
        int result = [newArray[0] intValue];
        while (i<[newArray count]) {
            char ope = [newArray[i] characterAtIndex:0];
            result = [self calculateArithmetic: [NSString stringWithFormat:@"%d", result] and:newArray[++i] withOperator: ope];
            i++;
        }
        return result;
}

+(BOOL) validate:(NSMutableArray *) items {
    // number of items in a expression should be an odd number
    if ( [items count] % 2 == 0) {
        NSLog(@"%@", INCOMPLETE_EXPRESSION_ERRO);
        return NO;
    } else {
        int i = 0;
        while (i<[items count]) {
            NSString *str = items[i];
            if (i % 2 == 0) {
                // this item must be an integer value
                int intValue = [str intValue];
                if ([[NSString stringWithFormat:@"%d",intValue] isEqualToString:str]) {
                    // This is an integer value
                    i++;
                }else {
                    NSLog(@"Invalid number: %@", str);
                    return NO;
                }
            } else {
                // This item must be an operator like + - * / %
                if (str.length != 1 ){
                    NSLog(@"Unknown operator %@", str);
                    return NO;
                } else if ( ![OPERATORS containsString:str] ) {
                    NSLog(@"Unknown operator %@", str);
                    return NO;
                } else {
                    i++;
                }
            }
        }
    }
    return YES;
}
@end
