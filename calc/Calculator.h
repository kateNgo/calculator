//
//  Calculator.h
//  calc
//
//  Created by phuong on 30/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import <Foundation/Foundation.h>
// #define operator1 = @"*/%";
// #define operator2 = @"+-";


@interface Calculator : NSObject{
}
-(id) init;
-(NSMutableArray *) parseExpression:(NSArray *) items withNumberItem:(int) length;

-(int) calculate:(NSMutableArray *) items;
-(BOOL) validateInput:(NSArray *)inputArray;
-(BOOL) isValidOperator:(char)ch;
-(BOOL) isValidNumber:(NSString *)str;

@end
