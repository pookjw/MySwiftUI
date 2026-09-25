#import <UIKit/UIKit.h>
#import <_UIKitPrivate/UISize3D.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

UIKIT_EXTERN CGSize _UISheetPageSize(UIView *);

@interface UISheetPresentationController (Private)
@property (nonatomic, readonly, getter=_isGeneratingAnimations) BOOL _generatingAnimations;
@property (nonatomic, setter=_setSourceEntityId:) unsigned long long _sourceEntityId;
@property (nonatomic, setter=_setSourceEntitySize:) UISize3D _sourceEntitySize;
// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, copy, nullable, getter=selectedDetentIdentifier, setter=setSelectedDetentIdentifier:) NSString *mrui_selectedDetentIdentifier;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
