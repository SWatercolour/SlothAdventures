//
//  AOfSlothTower.m
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 04/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import "AOfSlothTower.h"


@implementation AOfSlothTower


@synthesize size,level1,level2,level3,level4;


// returns level contents
-(int)returnLevelContents:(int)forLevel
{
    if(forLevel == 1) { return level1; }
    else if(forLevel == 2) { return level2; }
    else if(forLevel == 3) { return level3; }
    else if(forLevel == 4) { return level4; }
    
    return -1;
}

// For making a new tower, input all the data at once
-(void)addValueContents:(int)pSize l1:(int)pL1 l2:(int)pL2 l3:(int)pL3 l4:(int)pL4
{
    size = pSize;
    level1 = pL1; level2 = pL2; level3 = pL3; level4 = pL4;
    
}




@end

