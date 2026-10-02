#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSInteger, _UIListCellStyle) {
    _UIListCellStyleUnknown0 = 0
};

typedef NS_ENUM(NSInteger, _UIListCellProminence) {
    _UIListCellProminenceUnknown0 = 0
};

@protocol _UIContentViewContainerBackgroundViewProviding <NSObject>
@optional
@property (readonly, nonatomic, nullable) UIView *_containerBackgroundView;
@property (copy, nonatomic, nullable, setter=_setContainerBackgroundViewDidChangeHandler:) void (^ _containerBackgroundViewDidChangeHandler)(void);
@end

@protocol _UIContentViewContainerDisplayTracking <NSObject>
@optional
- (void)_containerViewIsHiddenForReuse:(BOOL)hidden;
@end

@protocol _UIContentViewSwipeActionsConfigurationProviding <NSObject>
@optional
- (UISwipeActionsConfiguration * _Nullable)_leadingSwipeActionsConfiguration;
- (UISwipeActionsConfiguration * _Nullable)_trailingSwipeActionsConfiguration;
@end

@protocol _UIContentViewSeparatorInsetProviding <NSObject>
@optional
- (CGFloat)_preferredLeadingSeparatorInset;
- (CGFloat)_preferredTrailingSeparatorInset;
@property (copy, nonatomic, nullable, setter=_setPreferredSeparatorInsetsDidChangeHandler:) void (^_preferredSeparatorInsetsDidChangeHandler)(void);
@end

@protocol _UIContentViewPopupMenuButtonProviding <NSObject>
@optional
@property (readonly, nonatomic, nullable) UIButton *_popupMenuButton;
@property (copy, nonatomic, nullable, setter=_setPopupMenuButtonDidChangeHandler:) void (^_popupMenuButtonDidChangeHandler)(void);
@end

@protocol _UIContentViewDefaultStylingObtaining <NSObject>
@optional
- (void)_defaultListContentConfigurationMayHaveChanged;
@property (copy, nonatomic, nullable, setter=_setDefaultListContentConfigurationProvider:) UIListContentConfiguration * _Nullable (^_defaultListContentConfigurationProvider)(void);
@property (readonly, nonatomic) _UIListCellStyle _listCellStyle;
@property (readonly, nonatomic) _UIListCellProminence _listCellProminence;
@end

@protocol _UIContentViewHoverStyleProviding <NSObject>
@optional
 - (UIHoverStyle * _Nullable)_preferredContainerHoverStyle;
 @property (copy, nonatomic, nullable, setter=_setPreferredContainerHoverStyleDidChangeHandler:) void (^_preferredContainerHoverStyleDidChangeHandler)(void);
@end

NS_HEADER_AUDIT_END(nullability, sendability)
