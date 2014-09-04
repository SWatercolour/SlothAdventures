//
//  AOfSlothViewController.h
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 03/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameBrain.h"

@interface AOfSlothViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property GameBrain *game;

-(void)animateSloth:(NSObject*)theSloth;
-(void)updateScore;


@end
