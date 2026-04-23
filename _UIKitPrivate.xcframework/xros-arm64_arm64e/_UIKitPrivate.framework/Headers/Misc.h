#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN float UIAnimationDragCoefficient(void);

typedef struct NS_SWIFT_SENDABLE API_AVAILABLE(watchos(2.0)) _UIEdgeInsets3D {
    CGFloat top, left, bottom, right, front, back;
} _UIEdgeInsets3D;

UIKIT_EXTERN _UIEdgeInsets3D _UIEdgeInsets3DZero;

NS_HEADER_AUDIT_END(nullability, sendability)
