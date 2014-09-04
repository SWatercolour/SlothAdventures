//
//  AOfSlothViewController.h
//  AdventuresOfSloth
//
//  Created by Hector Janse van Rensburg on 03/09/2014.
//  Copyright (c) 2014 S. Watercolour. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheSloth.h"

@interface AOfSlothViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

-(void)animateSloth:(NSObject*)theSloth;

@end
