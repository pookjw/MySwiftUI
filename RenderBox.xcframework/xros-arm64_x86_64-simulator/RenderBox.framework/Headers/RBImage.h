#import <Foundation/Foundation.h>
#import <RenderBox/Defines.h>
#import <CoreGraphics/CoreGraphics.h>

NS_ASSUME_NONNULL_BEGIN

RB_EXTERN RBImage RBImageMakeCGImage(CGImageRef cgImage) NS_SWIFT_NAME(RBImage.init(cgImage:));
RB_EXTERN RBImage RBImageMakeIOSurface(IOSurfaceRef ioSurface) NS_SWIFT_NAME(RBImage.init(ioSurface:));

NS_ASSUME_NONNULL_END
