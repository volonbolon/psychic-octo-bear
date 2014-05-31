//
//  VBTableViewController.m
//  psychic-octo-bear
//
//  Created by Ariel Rodriguez on 5/31/14.
//  Copyright (c) 2014 Ariel Rodriguez. All rights reserved.
//

#import "VBTableViewController.h"
#import "VBTableViewCell.h"

NSString *const kVBTableViewCellIdentifier = @"VBTableViewCell";

@interface VBTableViewController ()
@property (strong) NSArray *lines;
@property (strong) NSMutableDictionary *cache;
@end

@implementation VBTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    
    if ( nil != self ) {

        _cache = [NSMutableDictionary dictionary];
        
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"sisters"
                                             withExtension:@"plist"];
        NSArray *lines = [[NSArray alloc] initWithContentsOfURL:url];
        _lines = lines;
    
    }
    
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [[self tableView] registerClass:[VBTableViewCell class]
             forCellReuseIdentifier:kVBTableViewCellIdentifier];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static VBTableViewCell *cell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        cell = [tableView dequeueReusableCellWithIdentifier:kVBTableViewCellIdentifier];
    });
    
    CGFloat height = CGFLOAT_MAX;
    NSNumber *cachedHeight = [[self cache] objectForKey:indexPath];
    
    if ( nil == cachedHeight ) {
        
        NSString *line = [[self lines] objectAtIndex:[indexPath row]];
        
        [[cell label] setText:line];
        
        [cell layoutIfNeeded];
        
        CGSize size = [[cell contentView] systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
        
        height = size.height;
        
        [[self cache] setObject:[NSNumber numberWithFloat:height]
                         forKey:indexPath];
        
    } else {
        
        height = [cachedHeight floatValue];
        
    }
    
    
    return height + 1.0f;
    
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return UITableViewAutomaticDimension;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [[self lines] count];

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kVBTableViewCellIdentifier
                                                            forIndexPath:indexPath];
    
    NSString *line = [[self lines] objectAtIndex:[indexPath row]];
    
    [[(VBTableViewCell *)cell label] setText:line];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

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
