#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

struct UISize3D {
    CGFloat width;
    CGFloat height;
    CGFloat depth;
};
typedef struct UISize3D UISize3D;

UIKIT_EXTERN const UISize3D UISize3DZero NS_SWIFT_NAME(UISize3D.zero);

NS_HEADER_AUDIT_END(nullability, sendability)
