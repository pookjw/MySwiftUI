#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef struct _UICornerInsets {
    CGSize topLeft, topRight, bottomLeft, bottomRight;
} _UICornerInsets;

UIKIT_EXTERN NSString * _NSStringFromUICornerInsets(_UICornerInsets);

NS_HEADER_AUDIT_END(nullability, sendability)
