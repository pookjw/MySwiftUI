#import <CoreRE/Defines.h>

NS_ASSUME_NONNULL_BEGIN

RE_EXTERN REComponentTypeClass _Nullable REComponentClassFromType(REComponentType) NS_SWIFT_NAME(ComponentTypeClass.fromType(_:));
RE_EXTERN BOOL RENetworkMarkComponentDirty(REComponentRef) NS_SWIFT_NAME(Component.networkMarkComponentDirty(self:));
RE_EXTERN REEntityRef REComponentGetEntity(REComponentType) NS_SWIFT_NAME(getter:Component.entity(self:));

NS_ASSUME_NONNULL_END
