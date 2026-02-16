#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface UINavigationItem (Private)
@property (retain, nonatomic, nullable, setter=_setLargeTitleView:) UIView *_largeTitleView;
@property (retain, nonatomic, nullable, setter=_setLargeTitleAccessoryView:) UIView *_largeTitleAccessoryView;
@property (copy, nonatomic, nullable, setter=_setSubtitleView:) UIView* _subtitleView;
@property (copy, nonatomic, nullable, setter=_setLargeSubtitleView:) UIView* _largeSubtitleView;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
