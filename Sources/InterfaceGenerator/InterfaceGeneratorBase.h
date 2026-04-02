//
//  InterfaceGeneratorBase.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 4/2/26.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface InterfaceGeneratorBase : NSObject
@property (class, nonatomic, readonly) NSString *frameworkName;
@property (class, nonatomic, readonly) NSString *originalFrameworkName;
@property (class, nonatomic, readonly) NSString *baseLibraryIdentifier;
@property (class, nonatomic, readonly) NSString *baseVariantIdentifier;
+ (BOOL)generateToURL:(NSURL *)url __attribute__((objc_direct));
+ (instancetype)new NS_UNAVAILABLE;
- (instancetype)init NS_UNAVAILABLE;
@end

NS_ASSUME_NONNULL_END
