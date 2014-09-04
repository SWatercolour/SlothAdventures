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
@synthesize game, TheTower;


- (void)viewWillLoad
{

    
}

-(void)TowerMoving
{
    game.time ++;
    int velFromTime = 1+(game.time/2000);
    
    
    // Move background
    _ScrollBG1.center = CGPointMake(_ScrollBG1.center.x-1,_ScrollBG1.center.y);
    _ScrollBG2.center = CGPointMake(_ScrollBG2.center.x-1,_ScrollBG2.center.y);
    
    // Relocate background so it scrolls infinitely
    if(_ScrollBG1.center.x == round(_ScrollBG1.frame.size.width/2))
    { _ScrollBG1.center = CGPointMake(round(_ScrollBG1.frame.size.width/2),_ScrollBG1.center.y);}

    if(_ScrollBG2.center.x == round(_ScrollBG2.frame.size.width/2))
    { _ScrollBG2.center = CGPointMake(round(_ScrollBG2.frame.size.width/2),_ScrollBG2.center.y);}
    
    
    // Move the icons
    _icon1v.center = CGPointMake(_icon1v.center.x -velFromTime, _icon1v.center.y);
    _icon2v.center = CGPointMake(_icon2v.center.x -velFromTime, _icon2v.center.y);
    _icon3v.center = CGPointMake(_icon3v.center.x -velFromTime, _icon3v.center.y);
    _icon4v.center = CGPointMake(_icon4v.center.x -velFromTime, _icon4v.center.y);
    
    // Add 1 score every 5 moments
    if(game.time % 5 == 0){ game.score += 1;}

    // Update Score label
    [self updateScore];
    
    
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    
    // Set off the timer
    TowerMovement = [NSTimer scheduledTimerWithTimeInterval:(0.02) target:self selector:@selector(TowerMoving) userInfo:nil repeats:YES];
    
    // Set the background images
    [self.ScrollBG1 setImage:[UIImage imageNamed:@"bushscroll.png"]];
    [self.ScrollBG2 setImage:[UIImage imageNamed:@"bushscroll.png"]];

    
    // Set Background image
    [self.backgroundImage setImage:[UIImage imageNamed: @"Mockup.png"]];
    
    
    // Make a Sloth object.
    id theSloth = [[NSObject alloc] init];
    
    // Make the tower object point to an instance of it
    TheTower = [[AOfSlothTower alloc] init];
    // Add Values to the Tower
    [TheTower addValueContents:4 l1:1 l2:2 l3:3 l4:4];
    // Add the images to the tower
    [self createTower:(TheTower)];
    
    
    // Make a Brain. I don't use it.
    game = [[GameBrain alloc] init];
    
    // Set the font of scoreLabel
    [self.scoreLabel setFont:[UIFont fontWithName:@"04b19" size:65]];
    
    // Animate the sloth
    [self animateSloth:theSloth];
    
    // Update the score (test / works)
    [self updateScore];
    
    
    
    
}
// Warnings everywhere!
- (IBAction)Button1Click:(id)sender {
    switch([self attemptTower:(TheTower)with:1])
    {
        case 0: { } break; // Wrong icon, do nothing.
        case 1: { destroyTowerObject:(TheTower);} break; // Correct icon, remove object.
        case 2: { destroyTower:(TheTower);} break; // Correct icon, remove tower.
            
    }
}

- (IBAction)Button2Click:(id)sender {
    switch([self attemptTower:(TheTower)with:3])
    {
        case 0: { } break; // Wrong icon, do nothing.
        case 1: { destroyTowerObject:(TheTower);} break; // Correct icon, remove object.
        case 2: { destroyTower:(TheTower);} break; // Correct icon, remove tower.
            
    }
}

- (IBAction)Button3Click:(id)sender {
    switch([self attemptTower:(TheTower) with:2])
    {
        case 0: { } break; // Wrong icon, do nothing.
        case 1: { destroyTowerObject:(TheTower);} break; // Correct icon, remove object.
        case 2: { destroyTower:(TheTower);} break; // Correct icon, remove tower.
            
    }
}
- (IBAction)Button4Click:(id)sender {
    switch([self attemptTower:(TheTower) with:4])
    {
        case 0: { } break; // Wrong icon, do nothing.
        case 1: { destroyTowerObject:(TheTower);} break; // Correct icon, remove object.
        case 2: { destroyTower:(TheTower);} break; // Correct icon, remove tower.
            
    }
}

-(void)createTower:(AOfSlothTower*)TowerInfo
{
    
    // Pick random items
    [TheTower addValueContents:(1+ arc4random() % 4)
                            l1:(1+arc4random() % 4)
                            l2:(1+arc4random() % 4)
                            l3:(1+arc4random() % 4)
                            l4:(1+arc4random() % 4)];
    
    

    // For each item in tower
    for (int i = 1; i<=TowerInfo.size; i++)
    {
        // While the level isn't -1 (blank)
        if([TowerInfo returnLevelContents:(i)] != -1)
        {
            // Pick the right file name for the image
            NSString *iconName = [NSString stringWithFormat:@"gicon%d", [TowerInfo returnLevelContents:(i)] ];
            switch(i)
            {
                // Add the image, add it to the view.
                case 1:
                {
                    _icon1v = [[UIImageView alloc] initWithFrame:CGRectMake(200,380 - (i*55),50,50)];
                    _icon1v.image = [UIImage imageNamed:iconName];
                    [self.view addSubview:_icon1v];
                }
                break;
                    
                case 2:
                {
                    _icon2v = [[UIImageView alloc] initWithFrame:CGRectMake(200,380 - (i*55),50,50)];
                    _icon2v.image = [UIImage imageNamed:iconName];
                    [self.view addSubview:_icon2v];
                }
                    break;
                    
                case 3:
                {
                    _icon3v = [[UIImageView alloc] initWithFrame:CGRectMake(200,380 - (i*55),50,50)];
                    _icon3v.image = [UIImage imageNamed:iconName];
                    [self.view addSubview:_icon3v];
                    
                }
                    break;
                    
                case 4:
                {
                    _icon4v = [[UIImageView alloc] initWithFrame:CGRectMake(200,380 - (i*55),50,50)];
                    _icon4v.image = [UIImage imageNamed:iconName];
                    [self.view addSubview:_icon4v];
                    
                }
                    break;
                    
            }
    
        }
    }
    
    
}

-(void)animateSloth:(NSObject*)theSloth
{
    // Animate the sloth.
    
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

 

// Destroys the top ojbect
-(void)destroyTowerObject:(AOfSlothTower*)towerID
{
    // Pick tower size
    switch(TheTower.size)
    {
        case 1: {
            // make sure top level doesnt remain as an item
            TheTower.level1 = -1;
            
            // Make it fly away
            CGRect newFrame = _icon1v.frame;
            newFrame.origin.x += 500;    // shift right by 500pts
            
            [UIView animateWithDuration:1.0
                             animations:^{
                                 _icon1v.frame = newFrame;
                             } ];
            // Make it fade away
            [UIView animateWithDuration:0.3 animations:^{
                
                [_icon1v setAlpha:0.0f]; } ];
        
        } break;
        case 2: {
            TheTower.level2 = -1;
            CGRect newFrame = _icon2v.frame;
            newFrame.origin.x += 500;    // shift right by 500pts
            
            [UIView animateWithDuration:1.0
                             animations:^{
                                 _icon2v.frame = newFrame;
                             } ];
            [UIView animateWithDuration:0.3 animations:^{
                
                [_icon2v setAlpha:0.0f]; } ];
        
        } break;
        case 3: {
            TheTower.level3 = -1;
            CGRect newFrame = _icon3v.frame;
            newFrame.origin.x += 500;    // shift right by 500pts
            
            [UIView animateWithDuration:1.0
                             animations:^{
                                 _icon3v.frame = newFrame;
                             } ];
            [UIView animateWithDuration:0.3 animations:^{
                
                [_icon3v setAlpha:0.0f]; } ];
        
        } break;
        case 4: {
            TheTower.level4 = -1;
            CGRect newFrame = _icon4v.frame;
            newFrame.origin.x += 500;    // shift right by 500pts
            
            [UIView animateWithDuration:1.0
                             animations:^{
                                 _icon4v.frame = newFrame;
                             } ];
            [UIView animateWithDuration:0.3 animations:^{
                
                [_icon4v setAlpha:0.0f]; } ];
        } break;
    }
    TheTower.size--;
    
}

// Destroys the tower..then makes it again.
-(void)destroyTower:(AOfSlothTower*)towerID
{
    towerID = nil;
    [self createTower:(TheTower)];
    
}

// 0 = fail, 1 = success, 2 = success and destroyed
-(int)attemptTower:(AOfSlothTower*)towerID with:(int)bID
{
    if([self returnLevelContents:(TheTower.size)] == bID)
    {
        if(TheTower.size == 1) // if it's the last item, destroy  whole tower
        {
            [self destroyTowerObject:(towerID)];
            [self destroyTower:(towerID)];
            return 2;
        }
        else // Destroy just top object
        {
            [self destroyTowerObject:(towerID)];
            
            
            return 1;
        }
        // Add to streak
        game.streak++;
        
        // Add streak to score
        game.multiplier++;
        
    }
    else
    {
        // Reset streak if input didn't match top symbol
        game.streak = 1;
        game.multiplier = 1;
        return 0;
    }
    
    
    return -1;
}


// Converts 1,2,3,4 inputs into the integer value for each level
-(int)returnLevelContents:(int)forLevel
{
    if(forLevel == 1) { return TheTower.level1; }
    else if(forLevel == 2) { return TheTower.level2; }
    else if(forLevel == 3) { return TheTower.level3; }
    else if(forLevel == 4) { return TheTower.level4; }
    
    return -1;
}
    





// Updates score label
-(void)updateScore
{
    // Magic _ making a reappearance
    _scoreLabel.text = [NSString stringWithFormat:@"%d",[game scores]];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
