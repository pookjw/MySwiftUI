#import <UIKit/UIKit.h>
#import <_UIKitPrivate/_UINavigationBarPalette.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UINavigationItem (Private)
@property (retain, nonatomic, nullable, setter=_setLargeTitleView:) UIView *_largeTitleView;
@property (retain, nonatomic, nullable, setter=_setLargeTitleAccessoryView:) UIView *_largeTitleAccessoryView;
@property (copy, nonatomic, nullable, setter=_setSubtitleView:) UIView* _subtitleView;
@property (copy, nonatomic, nullable, setter=_setLargeSubtitleView:) UIView* _largeSubtitleView;
@property (weak, nonatomic, nullable) id _objc_renameDelegate;
@property (retain, nonatomic, nullable, setter=_setBottomPalette:) _UINavigationBarPalette *_bottomPalette;
- (void)_resetBackgroundOpacity;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
