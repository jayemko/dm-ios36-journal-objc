//
//  JKEntryDetailViewController.h
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import <UIKit/UIKit.h>
#import "JKEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface JKEntryDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *entryTitleTextField;
@property (weak, nonatomic) IBOutlet UITextView *entryBodyTextView;

@property (nonatomic, strong) JKEntry *entry;

- (IBAction)saveButtonTapped:(id)sender;
- (IBAction)clearButtonTapped:(id)sender;

//- (void)updateWithEntry:(JKEntry *)entry;

@end

NS_ASSUME_NONNULL_END
