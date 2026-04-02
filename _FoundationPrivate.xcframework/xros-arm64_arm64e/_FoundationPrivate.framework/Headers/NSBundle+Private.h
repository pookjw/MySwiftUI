#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSBundle (Private)
- (NSString *)localizedStringForKey:(NSString *)key value:(nullable NSString *)value table:(nullable NSString *)tableName localization:(NSString *)localization NS_FORMAT_ARGUMENT(1);
- (NSAttributedString *)localizedAttributedStringForKey:(NSString *)key value:(nullable NSString *)value table:(nullable NSString *)tableName localization:(NSString *)localization NS_FORMAT_ARGUMENT(1);
@end

NS_ASSUME_NONNULL_END