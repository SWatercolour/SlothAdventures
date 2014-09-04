//
//  GameBrain.m
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 04/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import "GameBrain.h"

@implementation GameBrain

@synthesize score,lives,time,highscore;


// Not sure if this is right. I want to set the properties (score,lives,time) to their start values when the object is created. It used to be a + (class method?) but only works with a -.
- (void)initialize {
    if (self == [GameBrain self]) {
        
    // Set variables (score = 0, lives = 3, time = 0)
        self.score = 0;
        self.time = 0;
        self.lives = 3;
    }
}


// Add to the score. Will be called every time step + when destroyed tower. (Advanced mode: also with combo of correct button presses)
-(void)addScore:(int)amt
{
    score = score + amt;
}

// Add 1 to the time. Make a timer increase this by 1 every fraction of a second. I suppose I will need another method in my View Controller to move the scenery and Objects along?
-(void)incTime
{
    time = time +1;
}

// Remove a life and return YES if dead. Better to do this as two methods?
-(bool)removeLife
{
    lives = lives -1;
    if (lives == 0)
    {
        return YES;
        
    }
    else
    {
        return NO;
    }
    
}

-(void)readHighScore
{
    
    // fancy code to read a file to get high score
    highscore = 0;
    
}

-(void)setHighScore
{
    // Fancy code to set high score file when app closes
    
    
}


@end
