//
//  RubGestureRecgonizer.m
//  Meow
//
//  Created by Jason Rush on 8/17/12.
//  Copyright (c) 2012 Fizzawizza. All rights reserved.
//

#import "RubGestureRecgonizer.h"
#import <UIKit/UIGestureRecognizerSubclass.h>

#define MOVE_AMT_PER_RUB     25

@implementation RubGestureRecgonizer

@synthesize startPoint;

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    self.startPoint = [touch locationInView:self.view];
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    // Make sure we've moved a minimum amount since curTickleStart
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    CGFloat moveAmt = point.x - startPoint.x;
    if (ABS(moveAmt) >= MOVE_AMT_PER_RUB) {
        [self setState:UIGestureRecognizerStateEnded];
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [self reset];
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event {
    [self reset];
}

- (void)reset {
    self.startPoint = CGPointZero;
    if (self.state == UIGestureRecognizerStatePossible) {
        [self setState:UIGestureRecognizerStateFailed];
    }
}

@end
