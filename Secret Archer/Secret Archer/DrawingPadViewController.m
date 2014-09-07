//
//  DrawingPadViewController.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "DrawingPadViewController.h"
#import "Doodle.h"

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

- (IBAction)cancel:(id)sender
{
    
    [[self presentingViewController] dismissViewControllerAnimated:YES
                                                        completion:NULL];

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
