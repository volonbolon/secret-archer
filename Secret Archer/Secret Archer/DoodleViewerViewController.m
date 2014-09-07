//
//  DoodleViewerViewController.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "DoodleViewerViewController.h"
#import "Doodle.h"

@interface DoodleViewerViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DoodleViewerViewController

- (void)viewDidLoad
{
    
    [super viewDidLoad];

    [[self imageView] setImage:[[self doodle] image]];
    [self setTitle:[[self doodle] title]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
