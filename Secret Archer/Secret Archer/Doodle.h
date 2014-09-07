//
//  Doodle.h
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Doodle : NSObject <NSSecureCoding>
@property (strong) UIImage *image;
@property (strong) NSString *title;

- (id)initWithTitle:(NSString *)title
              image:(UIImage *)image;
@end
