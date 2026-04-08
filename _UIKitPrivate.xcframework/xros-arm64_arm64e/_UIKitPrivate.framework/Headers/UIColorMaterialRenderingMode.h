#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, UIColorMaterialRenderingMode) {
    UIColorMaterialRenderingModeAutomatic = 0,
    UIColorMaterialRenderingModeAdaptiveSystemColors = 1,
    UIColorMaterialRenderingModeAdaptiveAllColors = 2
};

NS_HEADER_AUDIT_END(nullability, sendability)
