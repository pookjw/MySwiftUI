#import <Foundation/Foundation.h>
#import <MRUIKit/Defines.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef NS_ENUM(NSUInteger, MRUIFeedbackType) {
    MRUIFeedbackTypeUnspecified = 0,
    MRUIFeedbackTypeButtonNavigationBarTouchDown = 2,
    MRUIFeedbackTypeButtonStepperMinusTouchDown = 8,
    MRUIFeedbackTypeButtonStepperPlusTouchDown = 11,
    MRUIFeedbackTypeGridItemLargeTouchDown = 16,
    MRUIFeedbackTypeGridItemMediumTouchDown = 19,
    MRUIFeedbackTypeGridItemSmallTouchDown = 22,
    MRUIFeedbackTypeListItemLargeTouchDown = 25,
    MRUIFeedbackTypeListItemMediumTouchDown = 28,
    MRUIFeedbackTypeListItemSmallTouchDown = 31,
    MRUIFeedbackTypePickerScroll = 33,
    MRUIFeedbackTypeScrollViewGrabberTouchDown = 38,
    MRUIFeedbackTypeScrollViewGrabberTouchUp = 39,
    MRUIFeedbackTypeSegmentedControlItemTouchDown = 43,
    MRUIFeedbackTypeSegmentedControlItemTouchUp = 44,
    MRUIFeedbackTypeSliderTouchDown = 46,
    MRUIFeedbackTypeSliderTouchUp = 47,
    MRUIFeedbackTypeSliderSlidToMaximumValue = 48,
    MRUIFeedbackTypeSliderSlidToMinimumValue = 49,
    MRUIFeedbackTypeTabViewItemTouchDown = 51,
    MRUIFeedbackTypeTextFieldTouchDown = 56,
    MRUIFeedbackTypeToggleTouchDown = 59,
    MRUIFeedbackTypeToggleSetToOn = 60,
    MRUIFeedbackTypeToggleSetToOff = 61,
    MRUIFeedbackTypeCircularButtonTouchDown = 62,
    MRUIFeedbackTypeButtonWithBackgroundTouchDown = 64,
    MRUIFeedbackTypeButtonToggleOn = 66,
    MRUIFeedbackTypeButtonToggleOff = 67,
    MRUIFeedbackTypeButtonWithoutBackgroundTouchDown = 68,
    MRUIFeedbackTypeContextMenuOpen = 450,
    MRUIFeedbackTypeContextMenuDismiss = 451,
    MRUIFeedbackTypeDragStart = 500,
    MRUIFeedbackTypeDragCancel = 501,
    MRUIFeedbackTypeDropInApp = 502,
    MRUIFeedbackTypeDropInVoid = 503,
    MRUIFeedbackTypeHandReveal = 550,
    MRUIFeedbackTypeHandFlipPalmUp = 552,
    MRUIFeedbackTypeHandFlipPalmDown = 553,
    MRUIFeedbackTypeObjectTransformInteractionPickup = 600,
    MRUIFeedbackTypeObjectTransformInteractionRelease = 601,
    MRUIFeedbackTypeObjectTransformInteractionHandover = 602,
    MRUIFeedbackTypeObjectTransformInteractionSnap = 603,
    MRUIFeedbackTypeObjectTransformInteractionUnsnap = 604,
};

MRUI_EXTERN NSString * _Nullable _MRUICadenzaNameForFeedback(MRUIFeedbackType feedback);

NS_HEADER_AUDIT_END(nullability, sendability)
