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


@interface calculator : NSObject{
}

/**
 This method is to calculate valid expression
 the operators are just like + - * / %
 the operator are integer number
 @param items
        array of items in the expression such as operand operator operand ....
 @return int 
         the result of the expression
 */
-(NSNumber *) calculate:(NSMutableArray *) items;

/**
  This is to calculate an arithmetic expression like + - * / %
  @param n1 the first operand
  @param n2 the second operand
  @param ope the operator
  @return int the result of the calculation
 */
-(NSNumber *) calculateArithmetic: (NSString*) n1 and: (NSString *)n2 withOperator:(char) ope;

/**
  This method is to validate all items in the expression
  Number of items in the array must be an odd number.
  item at even index in the array must be an  operand and integer value
  item at odd index in the array must be an operator like + - * / %
 */
-(BOOL) validate:(NSMutableArray *) items;
-(BOOL) isInteger:(NSString *) str;
@end

