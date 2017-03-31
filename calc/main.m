//
//  main.m
//  calc
//

#import <Foundation/Foundation.h>
#import "Calculator.h"

#define Operator @"+-*/"
#define digits @"0123456789 \0"
/*
-(NSMutableArray*) parseWith:(int) argc and:(char[] *)argv
{
    NSMutableArray *items = [[NSMutableArray alloc] init];
    if (length >=2){
        for(int i=1;i<argc;i++){
            [items addObject:[NSString stringWithUTF8String:argv[i]]]];
        }
    }else{
        NSLog(@"Non argument supplied");
    }
    return items;
}
*/
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Calculator *calc = [[Calculator alloc] init];
        //NSMutableArray *items = parse(argc, argv);
        
        NSMutableArray *items=[[NSMutableArray alloc] init];
       // NSLog(@"There are %d arguments", argc);
        if (argc >=2){
            for(int i=1;i<argc;i++){
                [items addObject:[NSString stringWithUTF8String:argv[i]]];
            }
            
        }else{
            NSLog(@"Non argument supplied");
            return 1;
        }
        
       // NSLog(@"equation is %@",items);
        NSLog(@"result: %d", [calc calculate:items]);
        
        
        /*
        NSString *str = expression;
        str = [str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        NSLog(@"str:%@", str);
        
        NSArray *operands = [str componentsSeparatedByCharactersInSet:
                               [NSCharacterSet characterSetWithCharactersInString:Operator]
                               ];
        NSArray *operators = [str componentsSeparatedByCharactersInSet:
                              [NSCharacterSet characterSetWithCharactersInString:digits]
                              ];
        
        NSLog(@"%d operands", [operands count]);
        for(int i=0;i<[operands count];i++){
            NSLog(@"%@\n", operands[i]);
        }
        NSLog(@"%d operators", [operators count]);
        for(int i=0;i<[operators count];i++){
            NSLog(@"%@\n", operators[i]);
        }
        */
        
    }
    return 0;
}
