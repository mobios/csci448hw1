//
//  CalculatorViewController.m
//  Calculator
//
//  Created by user26378 on 1/20/15.
//  Copyright (c) 2015 jonweldon. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()
@property (nonatomic) BOOL userInMiddleOfEnteringNumber;
@property (nonatomic,strong) CalculatorBrain *brain;
@end

@implementation CalculatorViewController

@synthesize display;
@synthesize userInMiddleOfEnteringNumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if(!_brain)
        _brain = [[CalculatorBrain alloc] init];
    return _brain;
}

- (IBAction)digitPressed:(UIButton *)sender
{
    if(self.userInMiddleOfEnteringNumber)
    {
        self.display.text = [self.display.text stringByAppendingString:[sender currentTitle]];
    }
    else
    {
        self.display.text = [sender currentTitle];
        self.userInMiddleOfEnteringNumber = YES;
    }
    
}

- (IBAction)enterPressed
{
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userInMiddleOfEnteringNumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender
{
    if(self.userInMiddleOfEnteringNumber)
        [self enterPressed];
    self.display.text = [NSString stringWithFormat:@"%g",[self.brain performOperation:[sender currentTitle]]];
}

@end