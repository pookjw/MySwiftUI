#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UISheetPresentationController (Private)
@property (nonatomic, readonly, getter=_isGeneratingAnimations) BOOL _generatingAnimations;
// API_UNAVAILABLE(visionos) 제거용
@property (nonatomic, copy, nullable, getter=selectedDetentIdentifier, setter=setSelectedDetentIdentifier:) NSString *mrui_selectedDetentIdentifier;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
