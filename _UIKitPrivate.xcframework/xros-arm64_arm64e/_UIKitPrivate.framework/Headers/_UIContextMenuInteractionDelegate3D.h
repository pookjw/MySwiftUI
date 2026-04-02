#import <UIKit/UIKit.h>
#import <_QuartzCorePrivate/CAPoint3D.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

@protocol _UIContextMenuInteractionDelegate3D <UIContextMenuInteractionDelegate>
- (UIContextMenuConfiguration * _Nullable)_contextMenuInteraction:(UIContextMenuInteraction *)interaction configurationForMenuAtLocation3D:(CAPoint3D)location3D;
@end

NS_HEADER_AUDIT_END(nullability, sendability)
