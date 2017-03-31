//
//  Calculator.m
//  calc
//
//  Created by phuong on 30/3/17.
//  Copyright © 2017 UTS. All rights reserved.
//

#import "Calculator.h"

@implementation Calculator{
    NSString *operator1 ;
    NSString *operator2;
}
    
-(id) init{
    self = [super init];
    if (self){
        operator1 =@"*/%";
        operator2 =@"+-";
    }
    return self;
}
-(NSMutableArray *) parseExpression:(NSArray *) theArray withNumberItem:(int) length{
    
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (length >=2){
        for(int i=1;i<length;i++){
            [items addObject:[NSString stringWithFormat:@"%@",[theArray objectAtIndex:i ]]];
        }
    }else{
        NSLog(@"Non argument supplied");
    }
    return items;
    
}
-(int) addNumber:(int) firstNumber withNumber:(int) secondNumber{
    
    return firstNumber + secondNumber;
}
-(int) subtractNumber:(int) firstNumber byNumber:(int) secondNumber{
    return firstNumber - secondNumber;
}
-(int) divideNumber:(int) firstNumber byNumber:(int) secondNumber{
    return firstNumber/secondNumber;
}
-(int) multipleNumber:(int) firstNumber withNumber:(int) secondNumber{
    return firstNumber*secondNumber;
}
-(int) moduleNumber:(int) firstNumber byNumber:(int) secondNumber{
    return firstNumber % secondNumber;
}
-(int) calculate:(NSMutableArray *) items{
    NSMutableArray *array=[[NSMutableArray alloc]init];
    int n=0;
    int i=0;
    while (i<[items count]){
        if (i%2 == 0){
            // operands
            array[n] = items[i];
            
        }else{
            // operators
            if ([operator2 containsString:items[i]]){
                // not priority
                array[n] = items[i];
                
            }else{
                n--;
                if ([items[i] isEqualToString:@"*"]){
                    // more priority
                    int newValue = [array[n] intValue] * [items[++i] intValue] ;
                    array[n] = [[NSString alloc] initWithFormat:@"%d" ,newValue];
                    
                }else if ([items[i] isEqualToString:@"/"]){
                    // more priority
                    // check devide by zero here
                    int newValue = [array[n ] intValue] / [items[++i] intValue] ;
                    array[n] = [[NSString alloc] initWithFormat:@"%d", newValue];
                }else if ([items[i] isEqualToString:@"%"]){
                    // more priority
                    // check devide zero here
                    int newValue = [array[n] intValue] % [items[++i] intValue] ;
                    array[n] = [[NSString alloc] initWithFormat:@"%d", newValue];
                }
            }
            
        }
        i++;
        n++;
        
    }
    //NSLog(@"array: %@", array);
    
    i = 1;
    int result = [array[0] intValue];
    while (i<[array count]){
        if ( [array[i] isEqualToString:@"+" ]){
            result = result + [array[++i] intValue];
            
        }else if ( [array[i] isEqualToString:@"-" ]){
            result = result - [array[++i] intValue];
            
        }
        i++;
    }
    //NSLog(@"Result: %d", result);
    return result;
}
-(BOOL) validateInput:(NSArray *)inputArray{
    
    return 0;
}
-(BOOL) isValidOperator:(char)ch{
    return 0;
}
-(BOOL) isValidNumber:(NSString *)str{
    return 0;
}

@end
