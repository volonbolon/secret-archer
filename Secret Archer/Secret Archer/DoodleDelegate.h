//
//  DoodleDelegate.h
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Doodle;

@protocol DoodleDelegate <NSObject>
@required
- (void)doodleCreated:(Doodle *)doodle;
@end
