#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr REInputTargetComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.inputTarget());
RE_EXTERN REInputTargetDirectTouchInput REInputTargetComponentGetAllowsDirectTouchInput(REComponentRef) NS_SWIFT_NAME(getter:Component.inputTarget_directTouchInput(self:));
RE_EXTERN void REInputTargetComponentSetAllowsDirectTouchInput(REComponentRef, REInputTargetDirectTouchInput) NS_SWIFT_NAME(setter:Component.inputTarget_directTouchInput(self:_:));

NS_ASSUME_NONNULL_END
