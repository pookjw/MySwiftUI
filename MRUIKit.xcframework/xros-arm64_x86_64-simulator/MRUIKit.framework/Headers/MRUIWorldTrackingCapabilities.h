#import <Foundation/Foundation.h>
#import <MRUIKit/Defines.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_OPTIONS(NSUInteger, MRUIWorldTrackingCapabilities) {
    MRUIWorldTrackingCapabilitiesNone = 0,
    MRUIWorldTrackingCapabilitiesTranslation = 1 << 0,
    MRUIWorldTrackingCapabilitiesOrientation = 1 << 1,
};

MRUI_EXTERN NSString * _NSStringFromMRUIWorldTrackingCapabilities(MRUIWorldTrackingCapabilities);

NS_ASSUME_NONNULL_END
