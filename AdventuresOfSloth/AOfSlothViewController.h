//
//  AOfSlothViewController.h
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 03/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameBrain.h"
#import "AOfSlothProtocols.h"
#import "AOfSlothTower.h"
#import <AudioToolbox/AudioToolbox.h>
#include <stdlib.h>


@interface AOfSlothViewController : UIViewController
{
    NSTimer * TowerMovement;
    
}

@property (weak, nonatomic) IBOutlet UIImageView *ScrollBG1;

@property (weak, nonatomic) IBOutlet UIImageView *ScrollBG2;

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (strong, nonatomic) IBOutlet UILabel *scoreLabel;
@property GameBrain* game;
@property AOfSlothTower* TheTower;
@property (strong, nonatomic) IBOutlet UIImageView *icon1v, *icon2v, *icon3v, *icon4v;



-(void)animateSloth:(NSObject*)theSloth; // sloth anims
-(void)createTower:(AOfSlothTower*)TowerInfo; // make a tower
-(void)destroyTower:(AOfSlothTower*)towerID; // destroy whole tower
-(void)destroyTowerObject:(AOfSlothTower*)towerID; // destroy top item of tower
-(void)TowerMoving; // move the tower

-(int)attemptTower:(AOfSlothTower*)towerID with:(int)bID; // input guess, output result


-(void)updateScore; // update text label with score


@end
