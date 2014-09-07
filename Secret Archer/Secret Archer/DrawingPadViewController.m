//
//  DrawingPadViewController.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "DrawingPadViewController.h"
#import "Doodle.h"
#import "DoodleDelegate.h"

@interface DrawingPadViewController () <UIAlertViewDelegate>
- (IBAction)save:(id)sender;
- (void)saveViewWithTitle:(NSString *)title;

@end

@implementation DrawingPadViewController

- (IBAction)save:(id)sender
{

    UIAlertView *saveAlertView = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"Save", nil)
                                                            message:nil
                                                           delegate:self
                                                  cancelButtonTitle:NSLocalizedString(@"Cancel", nil)
                                                  otherButtonTitles:NSLocalizedString(@"OK", nil), nil];
    [saveAlertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
    [[saveAlertView textFieldAtIndex:0] setPlaceholder:NSLocalizedString(@"Title", nil)];
    [saveAlertView show];
    
    
}

- (void)saveViewWithTitle:(NSString *)title;
{
    
    CGRect rect = [[self view] bounds];
    UIGraphicsBeginImageContextWithOptions(rect.size,YES,0.0f);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[[self view] layer] renderInContext:context];
    UIImage *capturedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    Doodle *doodle = [[Doodle alloc] initWithTitle:title
                                             image:capturedImage];
    
    NSObject <DoodleDelegate> *dd = [self doodleDelegate];
    
    if ( nil != dd ) {
        
        [dd doodleCreated:doodle];
        
    }
    
    [[self navigationController] popViewControllerAnimated:YES];
    
}

#pragma mark - UIAlerViewDelegate
- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    
    if ( [alertView cancelButtonIndex] != buttonIndex ) {
        
        NSString *title = [[alertView textFieldAtIndex:0] text];
        
        [self saveViewWithTitle:title];
        
    }
    
}

@end
