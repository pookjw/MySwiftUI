#ifndef Path_h
#define Path_h
@import RenderBox;
#import <CoreGraphics/CoreGraphics.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

typedef union PathDataElement {
    CGPathRef cgPath;
    RBPath rbPath;
    const void * _Nullable buffer;
} PathDataElement;

typedef struct PathData {
    PathDataElement element;
    const void * _Nullable unknown0;
    const void * _Nullable unknown1;
    const void * _Nullable unknown2;
    const void * _Nullable unknown3;
    const void * _Nullable unknown4;
    const void * _Nullable unknown5;
    const void * _Nullable unknown6;
    const void * _Nullable unknown7;
    const void * _Nullable unknown8;
    const void * _Nullable unknown9;
} PathData;

NS_HEADER_AUDIT_END(nullability, sendability)

#endif
