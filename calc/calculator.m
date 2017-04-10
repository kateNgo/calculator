//
//  Calculator.m
//  calc
//
//  Created by phuong on 30/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "calculator.h"

const char ADD = '+';
const char SUBTRACT = '-';
const char MULTIPLE = 'x';
const char DIVIDE = '/';
const char MODULE = '%';
const NSString* OPERATORS=@"+-x/%";
const NSString* ADDITIVE=@"+-";
const NSString* MULTIPLICATIVE=@"x/%";
const NSString* INCOMPLETE_EXPRESSION_ERRO = @"Incomplete expression. Expected input of the form [number] [operator number ...]\n";
const NSString* INVALID_NUMBER_ERRO = @"Invalid number: %@\n";
const NSString* UNKNOW_OPERATOR_ERRO = @"Unknow operator: %@\n";
const NSString* DIVIDE_BY_ZERO_ERRO = @"Division by zero\n";

@implementation calculator

-(NSNumber *) calculateArithmetic: (NSString*) n1 and: (NSString *)n2 withOperator:(char) ope {
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
            if ([n2 intValue] == 0){
                NSLog(@"%@",DIVIDE_BY_ZERO_ERRO);
                return nil;
            }
            result = [n1 intValue] / [n2 intValue];
            break;
        case MODULE :
            result = [n1 intValue] % [n2 intValue];
            break;
        default:
            break;
    }
    return [NSNumber numberWithInt:result] ;
}

-(NSNumber *) calculate: (NSMutableArray *) items {
    int result = 0;
    if ([self validate:items]) {
        NSMutableArray *newArray = [[NSMutableArray alloc]init];
        // Firstly, reduce the express by calculating operators such as * / %
        int n = 0, i = 0;
        while (i < [items count]) {
            if (i % 2 == 0) {
                // This is an operand
                newArray[n] = items[i];
            } else {
                // This is an operator
                if ([ADDITIVE containsString: items[i]]) {
                    newArray[n] = items[i];
                } else {
                    n--;
                    char ope = [items[i] characterAtIndex:0];
                    NSNumber *newValue = [self calculateArithmetic:newArray[n] and:items[++i] withOperator: ope];
                    if (newValue != nil){
                        newArray[n]= [[NSString alloc] initWithFormat:@"%d" ,[newValue intValue]];
                    } else {
                            return nil;
                    }
                }
            }
            i++;
            n++;
        } // end while
        // finally, calculate with operators: + -
        i = 1;
        result = [newArray[0] intValue];
        while (i<[newArray count]) {
            char ope = [newArray[i] characterAtIndex:0];
            result = [[self calculateArithmetic: [NSString stringWithFormat:@"%d", result] and:newArray[++i] withOperator: ope] intValue];
            i++;
        }
        return [NSNumber numberWithInt: result];

    }else{
        return nil;
    }
}

-(BOOL) validate:(NSMutableArray *) items {
    // number of items in a expression should be an odd number
    
        int i = 0;
        while (i<[items count]) {
            NSString *str = items[i];
            if (i % 2 == 0) {
                // this item must be an integer value
                if ([self isInteger:str]){
                    i++;
                }else {
                    return NO;
                }
            } else {
                // This item must be an operator like + - * / %
                if ((str.length == 1) && ([OPERATORS containsString:str]) ){
                    i++;
                } else {
                    NSLog(UNKNOW_OPERATOR_ERRO, str);
                    return NO;
                }
            }
        
    }
    return YES;
}
-(BOOL) isInteger:(NSString *) str{
    char c = [str characterAtIndex:0];
    BOOL isSymbol = NO;
    NSString *value ;
    if ( (c == '+') || (c == '-')){
        // str starts with - or +
        NSCharacterSet *symbols = [NSCharacterSet characterSetWithCharactersInString:@"+-"];
        value = [str stringByTrimmingCharactersInSet:symbols];
        isSymbol = YES;
    } else {
        value = str;
    }
    NSCharacterSet *alphaSet = [NSCharacterSet alphanumericCharacterSet];
    BOOL valid = [[value stringByTrimmingCharactersInSet:alphaSet] isEqualToString:@""];
    if (valid){
        // check over flow integer
        int intValue = [value intValue];
        NSString *compareStr ;
        if (isSymbol) {
            compareStr = [NSString stringWithFormat:@"%c%d",c,intValue];
        }else {
            compareStr = [NSString stringWithFormat:@"%d",intValue];
        }
        if ([compareStr isEqualToString:str]) {
            return YES;
        }else {
            NSLog(INVALID_NUMBER_ERRO, str);
            return NO;
        }
    }else {
        NSLog(INVALID_NUMBER_ERRO, str);
        return NO;
    }
}
 
@end
