//
//  DrawPadView.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "DrawPadView.h"

@interface DrawPadView ()
@property (nonatomic, strong) UIBezierPath *path;
@property (nonatomic, strong) UIImage *cache;

// Helpers
- (CGPoint)locationOfTouch:(NSSet *)touches;
- (void)drawBitMap;
@end

@implementation DrawPadView

{
    
    CGPoint _pts[5];
    uint _pind;
    
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    
    self = [super initWithCoder:aDecoder];
    
    if ( nil != self ) {
        
        [self setMultipleTouchEnabled:NO];
        [self setBackgroundColor:[UIColor whiteColor]];
        _path = [UIBezierPath bezierPath];
        [_path setLineWidth:2.0f];
        
    }
    
    return self;
    
}

- (void)drawRect:(CGRect)rect
{
    
    [[self cache] drawInRect:rect];
    [[self path] stroke];
    
}

- (void)touchesBegan:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    
    CGPoint p = [self locationOfTouch:touches];
    
    self->_pind = 0;
    self->_pts[0] = p;
    
}

- (void)touchesCancelled:(NSSet *)touches
               withEvent:(UIEvent *)event
{
    
    [self touchesMoved:touches
             withEvent:event];
    
}

- (void)touchesEnded:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    
    [self drawBitMap];
    [self setNeedsDisplay];
    [[self path] removeAllPoints];
    self->_pind = 0;
    
}

- (void)touchesMoved:(NSSet *)touches
           withEvent:(UIEvent *)event
{
    
    CGPoint p = [self locationOfTouch:touches];

    self->_pind++;
    self->_pts[self->_pind]=p;
    if ( self->_pind == 4 ) {
        
        CGFloat x = (self->_pts[2].x+self->_pts[4].x) / 2.0f;
        CGFloat y = (self->_pts[2].y+self->_pts[4].y) / 2.0f;
        self->_pts[3] = CGPointMake(x, y);
        
        [[self path] moveToPoint:self->_pts[0]];
        [[self path] addCurveToPoint:self->_pts[3]
                       controlPoint1:self->_pts[1]
                       controlPoint2:self->_pts[2]];
        [self setNeedsDisplay];
        
        self->_pts[0] = self->_pts[3];
        self->_pts[1] = self->_pts[4];
        self->_pind = 1;
        
    }
    
}

#pragma mark - Helpers
- (CGPoint)locationOfTouch:(NSSet *)touches
{
    
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    return p;
    
}

- (void)drawBitMap
{
    
    UIGraphicsBeginImageContextWithOptions([self bounds].size, YES, [[[self window] screen] scale]);
    [[UIColor blackColor] setStroke];
    
    if ( nil == [self cache] ) {
        
        UIBezierPath *boundingPath = [UIBezierPath bezierPathWithRect:[self bounds]];
        [[UIColor whiteColor] setFill];
        [boundingPath fill];
        
    }
    
    [[self cache] drawAtPoint:CGPointZero];
    [[self path] stroke];
    [self setCache:UIGraphicsGetImageFromCurrentImageContext()];
    UIGraphicsEndImageContext();
    
}

@end
