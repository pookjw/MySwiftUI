#import <Foundation/Foundation.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@interface NSObject (UIAccessibility_Private)
- (BOOL)_accessibilityOverridesInvalidFrames;
- (BOOL)_accessibilityAutomationHitTestReverseOrder;
- (BOOL)_accessibilityIsSwiftUIHostingView;
- (BOOL)accessibilityShouldEnumerateContainerElementsArrayDirectly;
@property (nonatomic, readonly) NSArray<NSDictionary<NSString *, id> *> *_accessibilitySwiftUIDebugData; // impl이 존재하지 않기에 super 호출하면 안 됨
- (BOOL)_accessibilityIsSwiftUIHostingCellView; // impl이 존재하지 않기에 super 호출하면 안 됨. -swiftUI_accessibilityIsSwiftUIHostingCellView에서 호출될 것
@end

NS_HEADER_AUDIT_END(nullability, sendability)
