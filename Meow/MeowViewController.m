//
//  MeowTableViewController.m
//  Meow
//
//  Created by Jason Rush on 8/17/12.
//  Copyright (c) 2012 Fizzawizza. All rights reserved.
//

#import "MeowViewController.h"

@implementation MeowViewController

- (id)init {
    self = [super init];
    if (self) {
        NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"meow" ofType:@"wav"]];
        AudioServicesCreateSystemSoundID((CFURLRef)url, &meowSound);
    }
    return self;
}

- (void)dealloc {
    AudioServicesDisposeSystemSoundID(meowSound);
    [super dealloc];
}

- (void)viewDidLoad {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"meow"] forState:UIControlStateNormal];
    button.frame = CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height);
    [button addTarget:self action:@selector(buttonPressed:) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:button];
}

- (void)buttonPressed:(id)sender {
    AudioServicesPlaySystemSound(meowSound);
}

@end
