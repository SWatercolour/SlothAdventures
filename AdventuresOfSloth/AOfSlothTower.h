//
//  AOfSlothTower.h
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 04/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AOfSlothTower : NSObject

@property int size, level3, level1, level2, level4;

-(int)returnLevelContents:(int)forLevel;
-(void)addValueContents:(int)pSize l1:(int)pL1 l2:(int)pL2 l3:(int)pL3 l4:(int)pL4;


@end



