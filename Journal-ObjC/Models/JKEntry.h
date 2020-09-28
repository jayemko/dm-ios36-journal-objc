//
//  JKEntry.h
//  Journal-ObjC
//
//  Created by Jason Koceja on 9/28/20.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface JKEntry : NSObject

@property (nonatomic, copy) NSString *entryTitle;
@property (nonatomic, copy) NSString *entryBody;
@property (nonatomic, copy) NSDate *timestamp;

- (instancetype)initWithTitle:(NSString *)title bodyText:(NSString *)bodyText;


@end

NS_ASSUME_NONNULL_END
