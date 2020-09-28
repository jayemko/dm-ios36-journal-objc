//
//  JKEntryDetailViewController.m
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import "JKEntryDetailViewController.h"
#import "JKEntryController.h"

@interface JKEntryDetailViewController ()

@end

@implementation JKEntryDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)updateViews
{
    if (_entry) {
        _entryTitleTextField.text = _entry.entryTitle;
        _entryBodyTextView.text = _entry.entryBody;
    }
}

- (IBAction)saveButtonTapped:(id)sender {
    NSString *title = _entryTitleTextField.text;
    NSString *bodyText = _entryBodyTextView.text;
    NSLog(@"%lu length", title.length);
    if (title.length) {
        if (_entry) {
            [JKEntryController.sharedInstance updateEntry:_entry title:title bodyText:bodyText];
        } else {
            [JKEntryController.sharedInstance addEntryWithTitle:title bodyText:bodyText];
        }
    }
    [self.navigationController popViewControllerAnimated:TRUE];
}

- (IBAction)clearButtonTapped:(id)sender {
    _entryTitleTextField.text = @"";
    _entryBodyTextView.text = @"";
}



@end
