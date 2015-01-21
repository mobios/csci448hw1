//
//  CalculatorBrain.h
//  Calculator
//
//  Created by user26378 on 1/20/15.
//  Copyright (c) 2015 jonweldon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void)pushOperand:(double)operand;
- (double)performOperation:(NSString *)operation;

@end
