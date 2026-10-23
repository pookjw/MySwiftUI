#ifndef RB_Defines_h
#define RB_Defines_h

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>


#ifdef __cplusplus
#define RB_EXTERN       extern "C"
#else
#define RB_EXTERN           extern
#endif

NS_ASSUME_NONNULL_BEGIN

typedef const void * RBDisplayListContents;

typedef NS_ENUM(uint32_t, RBPathElement) {
    RBPathElementUnknown5 = 5,
    RBPathElementUnknown7 = 7,
    RBPathElementUnknown8 = 8,
    RBPathElementUnknown9 = 9,
    RBPathElementUnknown16 = 16,
    RBPathElementUnknown19 = 19
};

typedef struct RBPathCallbacks {;
    const void * _Nullable unknown0;
    const void * _Nonnull (* _Nullable unknown1)(const void *);
    void (* _Nullable unknown2)(const void *);
    bool (* _Nullable unknown3)(const void *, void *, bool (*)(void *, RBPathElement, const CGFloat *, const void * _Nullable));
    bool (* _Nullable unknown4)(const void *, const void *);
    bool (* _Nullable unknown5)(const void *);
    bool (* _Nullable unknown6)(const void *);
    NSInteger (* _Nullable unknown7)(const void *);
    CGRect (* _Nullable unknown8)(const void *);
    const void * _Nullable unknown9;
    const void * _Nullable unknown10;
} RBPathCallbacks;

typedef struct RBPath {
    const void * _Nullable unknown0;
    const RBPathCallbacks * _Nullable callbacks;
} RBPath;

typedef struct RBPathStrokeStyle {
    const CGFloat lineWidth;
    const CGFloat miterLimit;
    const CGFloat dashPhase;
} RBPathStrokeStyle;

typedef struct RBPathStrokeDashes {
    const CGLineCap lineCap;
    const CGLineJoin lineJoin;
    const size_t count;
    const CGFloat *values;
} RBPathStrokeDashes;

typedef struct RBPathRoundedRect {
    const CGRect rect;
    const CGSize cornerSize;
} RBPathRoundedRect;

NS_ASSUME_NONNULL_END

#endif
