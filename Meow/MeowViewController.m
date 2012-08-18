//
//  MeowTableViewController.m
//  Meow
//
//  Created by Jason Rush on 8/17/12.
//  Copyright (c) 2012 Fizzawizza. All rights reserved.
//

#import "MeowViewController.h"
#import "RubGestureRecgonizer.h"

@implementation MeowViewController

- (id)init {
    self = [super init];
    if (self) {
        NSURL *url;
        
        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"meow" ofType:@"wav"]];
        AudioServicesCreateSystemSoundID((CFURLRef)url, &meowSound);

        url = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"purr" ofType:@"wav"]];
        AudioServicesCreateSystemSoundID((CFURLRef)url, &purrSound);
    }
    return self;
}

- (void)dealloc {
    AudioServicesDisposeSystemSoundID(meowSound);
    AudioServicesDisposeSystemSoundID(purrSound);
    [super dealloc];
}

- (void)viewDidLoad {
    UIImage *image = [UIImage imageNamed:@"meow"];
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.userInteractionEnabled = YES;

    UITapGestureRecognizer *tapGestureRecgonizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    tapGestureRecgonizer.numberOfTapsRequired = 1;
    [imageView addGestureRecognizer:tapGestureRecgonizer];
    [tapGestureRecgonizer release];

    
    RubGestureRecgonizer *rubGestureRecgonizer = [[RubGestureRecgonizer alloc] initWithTarget:self action:@selector(handleRub:)];
    [imageView addGestureRecognizer:rubGestureRecgonizer];
    [rubGestureRecgonizer release];

    [self.view addSubview:imageView];
}

- (void)handleTap:(UIGestureRecognizer *)sender {
    NSLog(@"Tap");
    AudioServicesPlaySystemSound(meowSound);
}

- (void)handleRub:(UIGestureRecognizer *)sender {
    NSLog(@"Rub");
    AudioServicesPlaySystemSound(purrSound);
}

@end
