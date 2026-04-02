//
//  XCSelect.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 4/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface XCSelect : NSObject
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;

@property (class, nonatomic, readonly, direct) NSURL *developerDirectoryURL;
@end

NS_ASSUME_NONNULL_END
