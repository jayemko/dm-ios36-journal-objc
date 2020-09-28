//
//  JKEntry.m
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import "JKEntry.h"

@implementation JKEntry

- (instancetype)initWithTitle:(NSString *)title
                     bodyText:(NSString *)bodyText
{
    self = [super init];
    if (self) {
        _entryTitle = title;
        _entryBody = bodyText;
        _timestamp = [NSDate new];
    }
    return self;
}

@end
