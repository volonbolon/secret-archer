//
//  DoodlesTableViewController.m
//  Secret Archer
//
//  Created by Ariel Rodriguez on 9/7/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "DoodlesTableViewController.h"
#import "Doodle.h"
#import "DrawingPadViewController.h"
#import "DoodleDelegate.h"
#import "DoodleViewerViewController.h"
#import "Helpers.h"

NSString *const kDoodleCellIdentifier = @"DoodleCell";
NSString *const kDoodlePresentCreateDoodleViewControllerSegueIdentifier = @"presentCreateDoodleViewControllerSegue";
NSString *const kDoodlePresentDoodleViewControllerSegueIdentifier = @"presentDoodleViewControllerSegue";
NSString *const kDoodlesFileName = @"doodles";

@interface DoodlesTableViewController () <DoodleDelegate>
@property (nonatomic, strong) NSArray *doodles;

- (void)handleApplicationDidEnterBackgroundNotification:(NSNotification *)notification;
@end

@implementation DoodlesTableViewController

- (void)dealloc
{
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{

    self = [super initWithCoder:aDecoder];
    
    if ( nil != self) {
        
        _doodles = [NSArray new];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(handleApplicationDidEnterBackgroundNotification:)
                                                     name:UIApplicationDidEnterBackgroundNotification
                                                   object:nil];
        
    }
    
    return self;
    
}

- (void)viewDidLoad
{
    
    if ( fwk_fileWithFileNameExist(kDoodlesFileName) ) {
        
        NSArray *doodles = [NSKeyedUnarchiver unarchiveObjectWithFile:fwk_pathWithFilename(kDoodlesFileName)];
        [self setDoodles:doodles];
        
    }
    
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [[self doodles] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kDoodleCellIdentifier
                                                            forIndexPath:indexPath];
    
    Doodle *doodle = [[self doodles] objectAtIndex:[indexPath row]];
    
    [[cell textLabel] setText:[doodle title]];
    
    return cell;
    
}

#pragma mark - Navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{

    if ( [[segue identifier] isEqualToString:kDoodlePresentCreateDoodleViewControllerSegueIdentifier] ) {
        
        DrawingPadViewController *destinationViewController = [segue destinationViewController];
        [destinationViewController setDoodleDelegate:self];
        
    } else if ( [[segue identifier] isEqualToString:kDoodlePresentDoodleViewControllerSegueIdentifier] ) {
        
        NSIndexPath *indexPathForSelectedRow = [[self tableView] indexPathForSelectedRow];
        Doodle *doodle = [[self doodles] objectAtIndex:[indexPathForSelectedRow row]];
        
        DoodleViewerViewController *destinationViewController = [segue destinationViewController];
        [destinationViewController setDoodle:doodle];
        
    }
    
}

#pragma mark - DoodleDelegate 
- (void)doodleCreated:(Doodle *)doodle
{
    
    NSArray *doodles = [self doodles];
    if ( nil == doodles ) {
        
        doodles = [NSArray new];
        
    }
    
    NSMutableArray *mutableDoodles = [doodles mutableCopy];
    [mutableDoodles addObject:doodle];
    [self setDoodles:[mutableDoodles copy]];
    
    [[self tableView] reloadData];
    
}

- (void)handleApplicationDidEnterBackgroundNotification:(NSNotification *)notification
{
    
    [NSKeyedArchiver archiveRootObject:[self doodles]
                                toFile:fwk_pathWithFilename(kDoodlesFileName)];
    
}

@end
