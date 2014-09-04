//
//  GameBrain.h
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 04/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameBrain : NSObject

@property int score,lives,time,highscore,streak,multiplier;

-(void)addScore:(int)amt;
-(void)readHighScore;
-(void)setHighScore;
-(bool)removeLife;
-(void)incTime;
-(int)scores;







@end
