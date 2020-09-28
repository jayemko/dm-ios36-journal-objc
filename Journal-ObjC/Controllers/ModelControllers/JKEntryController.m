//
//  JKEntryController.m
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import "JKEntryController.h"

@implementation JKEntryController

+ (JKEntryController *)sharedInstance {
    static JKEntryController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JKEntryController new];
    });
    return sharedInstance;
}

- (void)addEntryWithTitle:(NSString *)title
                  bodyText:(NSString *)bodyText
{
    if (!_entries) {
        _entries = [NSMutableArray new];
    }
    JKEntry *newEntry = [[JKEntry alloc] initWithTitle:title bodyText:bodyText];
    [_entries addObject:newEntry];
}

- (void)removeEntry:(JKEntry *)entry
{
    [_entries removeObject:entry];
}

- (void)updateEntry:(JKEntry *)entry
              title:(NSString *)title
           bodyText:(NSString *)bodyText
{
    entry.entryTitle = title;
    entry.entryBody = bodyText;
}


@end
