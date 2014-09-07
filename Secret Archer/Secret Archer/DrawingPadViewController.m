//
//  DrawingPadViewController.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "DrawingPadViewController.h"

@interface DrawingPadViewController ()
- (IBAction)save:(id)sender;

- (IBAction)cancel:(id)sender;

@end

@implementation DrawingPadViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    
    
}

- (IBAction)cancel:(id)sender
{
    
    [[self presentingViewController] dismissViewControllerAnimated:YES
                                                        completion:NULL];

}

- (IBAction)save:(id)sender
{

    [[self presentingViewController] dismissViewControllerAnimated:YES
                                                        completion:NULL];
    
}
@end
