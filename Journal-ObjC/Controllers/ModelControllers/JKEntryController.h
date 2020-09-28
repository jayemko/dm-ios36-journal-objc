//
//  JKEntryController.h
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import <Foundation/Foundation.h>
#import "JKEntry.h"

NS_ASSUME_NONNULL_BEGIN

@interface JKEntryController : NSObject

@property (nonatomic, strong) NSMutableArray *entries;

+ (JKEntryController *)sharedInstance;
- (void)addEntryWithTitle:(NSString *)title bodyText:(NSString *)bodyText;
- (void)removeEntry:(JKEntry *)entry;
- (void)updateEntry:(JKEntry *)entry title:(NSString *)title bodyText:(NSString *)bodyText;

@end

NS_ASSUME_NONNULL_END
