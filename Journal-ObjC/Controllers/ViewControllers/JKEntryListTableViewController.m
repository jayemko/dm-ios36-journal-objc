//
//  JKEntryListTableViewController.m
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import "JKEntryListTableViewController.h"
#import "JKEntryDetailViewController.h"
#import "JKEntryController.h"
#import "JKEntry.h"

@interface JKEntryListTableViewController ()

@end

@implementation JKEntryListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    NSLog(@"entries count:%lu", JKEntryController.sharedInstance.entries.count);
    [self.tableView reloadData];
}

- (NSString *)stringForDate:(NSDate *)date
{
    NSDateFormatter *dateFormat = [NSDateFormatter new];
    dateFormat.dateFormat = @"MM-dd-yyyy";
    return [dateFormat stringFromDate:date];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return JKEntryController.sharedInstance.entries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"entryCell" forIndexPath:indexPath];
    
    JKEntry *entry = JKEntryController.sharedInstance.entries[indexPath.row];
    cell.textLabel.text = entry.entryTitle;
    cell.detailTextLabel.text = [self stringForDate:entry.timestamp];
    
    return cell;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        JKEntry *entry = JKEntryController.sharedInstance.entries[indexPath.row];
        [JKEntryController.sharedInstance removeEntry:entry];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showEntrySegue"]) {
        JKEntryDetailViewController *dvc = (segue.destinationViewController);
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        JKEntry *entry = JKEntryController.sharedInstance.entries[indexPath.row];
        dvc.entry = entry;
    }
}

@end
