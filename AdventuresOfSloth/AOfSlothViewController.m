//
//  AOfSlothViewController.m
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 03/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import "AOfSlothViewController.h"

@interface AOfSlothViewController ()



@end

@implementation AOfSlothViewController

- (void)viewWillLoad
{

    
}

-(void)animateSloth:(NSObject*)theSloth
{
    
    NSArray *imageNames = @[@"Sloth0000", @"Sloth0001.png", @"Sloth0002.png", @"Sloth0003.png", @"Sloth0004.png",@"Sloth0003.png",@"Sloth0002.png",@"Sloth0001.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(000,330,92,71)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;
    animationImageView.animationRepeatCount = 0;

    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];

    
}


- (void)viewDidLoad
{
    [super viewDidLoad];    [self.backgroundImage setImage:[UIImage imageNamed: @"Mockup.png"]];
    
	// Do any additional setup after loading the view, typically from a nib.
    
    // Make a Sloth
    id theSloth = [[TheSloth alloc] init];
    
    //self.scoreLabel.font = [UIFont fontWithName:@"04B_19__.TTF" size:12];
    
    [self.scoreLabel setFont:[UIFont fontWithName:@"04b19" size:65]];
    
    // Animate the sloth
    [self animateSloth:theSloth];

    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
