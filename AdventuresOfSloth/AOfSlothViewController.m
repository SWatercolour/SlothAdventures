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
    // Animate the sloth. Code copies from web. This will need to get faster as 'time' property of GameBrain goes by.
    
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
    
	// I'm using this bit to set up everything, including the game brain. Not sure if this is right. GameBrain seems more fundamental than the view controller, so seems more correct to set that up somewhere first.
    
    // Make a Sloth object.
    id theSloth = [[NSObject alloc] init];
    
    // Make a Brain. I don't know how to use this 'game' object later though :( *edit apparently it works with _game. No idea why! But warns that it's unused?
    GameBrain *game = [[GameBrain alloc] init];
    
    // Set the font of scoreLabel
    [self.scoreLabel setFont:[UIFont fontWithName:@"04b19" size:65]];
    
    // Animate the sloth
    [self animateSloth:theSloth];
    
    [self updateScore];

    
    
    
}


//
-(void)updateScore
{
    // Magic _ making a reappearance
    _scoreLabel.text = [NSString stringWithFormat:@"%d",_game.score];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
