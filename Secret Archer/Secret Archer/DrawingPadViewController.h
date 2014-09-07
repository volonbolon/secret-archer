//
//  DrawingPadViewController.h
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DoodleDelegate;

@interface DrawingPadViewController : UIViewController
@property (weak) NSObject <DoodleDelegate> *doodleDelegate;
@end
