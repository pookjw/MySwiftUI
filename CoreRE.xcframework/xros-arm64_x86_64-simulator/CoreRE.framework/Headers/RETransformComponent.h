#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentClassPtr _Nullable RETransformComponentGetComponentType(void) NS_SWIFT_NAME(getter:Component.ClassPtr.transform());

RE_EXTERN RESRT RETransformComponentGetLocalSRT(REComponent) NS_SWIFT_NAME(getter:Component.transform_localSRT(self:));
RE_EXTERN void RETransformComponentSetLocalSRT(REComponent, RESRT) NS_SWIFT_NAME(setter:Component.transform_localSRT(self:_:));

NS_ASSUME_NONNULL_END
