//
//  Doodle.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "Doodle.h"

NSString *const kDoodleImageKey = @"image";
NSString *const kDoodleTitleKey = @"title";

@implementation Doodle
- (id)initWithTitle:(NSString *)title
              image:(UIImage *)image
{
    
    self = [super init];
    
    if ( nil != self ) {
        
        _image = image;
        _title = title;
        
    }
    
    return self;
    
}

#pragma mark - NSSecureCoding
- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super init];
    
    if ( nil != self ) {
        
        _image = [aDecoder decodeObjectOfClass:[UIImage class]
                                        forKey:kDoodleImageKey];
        _title = [aDecoder decodeObjectOfClass:[NSString class]
                                        forKey:kDoodleTitleKey];
        
    }
    
    return self;
    
}

#pragma mark - NSCoding
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    
    [aCoder encodeObject:[self image]
                  forKey:kDoodleImageKey];
    [aCoder encodeObject:[self title]
                  forKey:kDoodleTitleKey];
    
}
@end
