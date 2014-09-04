//
//  GameBrain.m
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 04/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import "GameBrain.h"

@implementation GameBrain

@synthesize multiplier,score, streak,lives,time,highscore;


// When making it, set safe initial values
- (void)initialize {
    if (self == [GameBrain self]) {
        
    // Set variables (score = 0, lives = 3, time = 0)
        score = 10;
        time = 0;
        lives = 3;
        streak = 1;
        multiplier = 1;
    }
}



// Add to the score.
-(void)addScore:(int)amt
{
    score = score + amt;
}

// Add 1 to the time.
-(void)incTime
{
    time = time +1;
}

// Remove a life and return YES if dead, otherwise NO
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
