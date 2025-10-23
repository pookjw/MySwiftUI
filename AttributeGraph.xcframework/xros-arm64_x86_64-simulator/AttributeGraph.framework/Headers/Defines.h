#ifndef Defines_h
#define Defines_h

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef __cplusplus
#define AG_EXTERN       extern "C"
#else
#define AG_EXTERN           extern
#endif

typedef struct AGSwiftMetadata {} AGSwiftMetadata;
typedef const AGSwiftMetadata * AGTypeID __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(TypeID);

typedef struct AGTypeSignature {
    uint32_t words[5];
} AGTypeSignature NS_SWIFT_NAME(Signature);

typedef NS_OPTIONS(uint32_t, AGAttributeTypeFlags) {
    AGAttributeTypeFlagsUnknown = 10
};

typedef NS_OPTIONS(uint32_t, AGValueOptions) {
    AGValueOptionsNone = 0
};

typedef NS_OPTIONS(uint32_t, AGChangedValueFlags) {
    AGChangedValueFlagsUnchanged = 0,
    AGChangedValueFlagsChanged = 1,
};

typedef NS_OPTIONS(uint32_t, AGGraphCounterOptions) {
    AGGraphCounterOptionsUnknown1 = 1 << 0,
    AGGraphCounterOptionsUnknown2 = 1 << 1,
    AGGraphCounterOptionsUnknown4 = 1 << 2,
    AGGraphCounterOptionsUnknown8 = 1 << 3,
};

typedef NS_ENUM(NSUInteger, AGComparisonMode) {
    AGComparisonModeUnknown103 = 103
};

typedef NS_OPTIONS(uint32_t, AGComparisonOptions) {
    AGComparisonOptionsUnknown1 = 1 << 0,
    AGComparisonOptionsUnknown2 = 1 << 1
};

typedef uint32_t AGAttribute __attribute__((swift_wrapper(struct))) NS_SWIFT_NAME(AnyAttribute);

typedef struct CF_BRIDGED_TYPE(id) AGGraphStorage * AGGraphRef NS_SWIFT_NAME(Graph);
struct AGGraph;

typedef struct CF_BRIDGED_TYPE(id) AGSubgraph * AGSubgraphRef NS_SWIFT_NAME(Subgraph);
struct AGSubgraph;

struct AGTraceType {
    // Offset 0x00
    void (* _Nullable unknown_block_1)(void) __attribute__((swiftcall));
    // Offset 0x08
    void (* _Nullable unknown_block_2)(void) __attribute__((swiftcall));
    // Offset 0x10
    void (* _Nullable unknown_block_3)(void) __attribute__((swiftcall));
    
    // Offset 0x18
    void (* _Nullable willUpdateSubGraph)(void *, AGSubgraphRef, uint32_t) __attribute__((swiftcall));
    
    // Offset 0x20
    void (* _Nullable unknown_block_5)(void) __attribute__((swiftcall));
    
    // Offset 0x28
    void (* _Nullable didUpdateSubGraph)(void *, AGAttribute) __attribute__((swiftcall));
    
    // Offset 0x30
    void (* _Nullable unknown_block_7)(void) __attribute__((swiftcall));
    
    // Offset 0x38
    void (* _Nullable didUpdateGraph)(void *, AGAttribute) __attribute__((swiftcall));
    
    // Offset 0x40
    void (* _Nullable unknown_block_9)(void) __attribute__((swiftcall));
    
    // Offset 0x48
    void (* _Nullable block_10)(void *, AGGraphRef) __attribute__((swiftcall));
    
    // Offset 0x50
    void (* _Nullable unknown_block_11)(void) __attribute__((swiftcall));
    
    // Offset 0x58
    void (* _Nullable block_12)(void *, AGGraphRef, AGAttribute) __attribute__((swiftcall));
    
    // Offset 0x60 - 0x80
    void (* _Nullable unknown_block_13)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_14)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_15)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_16)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_17)(void) __attribute__((swiftcall));

    // Offset 0x88
    void (* _Nullable didCreateGraph)(void *, AGGraphRef) __attribute__((swiftcall));
    
    // Offset 0x90
    void (* _Nullable block_19)(void *, AGGraphRef) __attribute__((swiftcall));

    // Offset 0x98
    void (* _Nullable block_20)(void *, AGGraphRef) __attribute__((swiftcall));

    // Offset 0xA0
    void (* _Nullable didCreateSubgraph)(void *, AGSubgraphRef) __attribute__((swiftcall));

    // Offset 0xA8
    void (* _Nullable block_22)(void *, AGSubgraphRef) __attribute__((swiftcall));

    // Offset 0xB0 - 0xB8
    void (* _Nullable unknown_block_23)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_24)(void) __attribute__((swiftcall));
    
    // Offset 0xC0
    void (* _Nullable didAddValue)(void *, AGAttribute) __attribute__((swiftcall));

    // Offset 0xC8 - 0xE8
    void (* _Nullable unknown_block_26)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_27)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_28)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_29)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_30)(void) __attribute__((swiftcall));

    // Offset 0xF0
    void (* _Nullable didSetValue)(void *, AGAttribute, const void *) __attribute__((swiftcall));

    // Offset 0xF8
    void (* _Nullable block_32)(void *, AGAttribute) __attribute__((swiftcall));

    // Offset 0x100
    void (* _Nullable didAddIndirect)(void *, AGAttribute) __attribute__((swiftcall));

    // Offset 0x108
    void (* _Nullable block_34)(void *, AGAttribute, AGAttribute) __attribute__((swiftcall));

    // Offset 0x110
    void (* _Nullable block_35)(void *, AGAttribute, AGAttribute) __attribute__((swiftcall));

    // Offset 0x118
    void (* _Nullable unknown_block_36)(void) __attribute__((swiftcall));
    
    // Offset 0x120
    void (* _Nullable block_37)(void *, AGGraphRef, const uint8_t * , const void * _Nullable, AGTypeID) __attribute__((swiftcall));
    
    // Offset 0x128 - 0x148
    void (* _Nullable unknown_block_38)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_39)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_40)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_41)(void) __attribute__((swiftcall));
    void (* _Nullable unknown_block_42)(void) __attribute__((swiftcall));
};
typedef struct AGTraceType AGTrace NS_SWIFT_NAME(Trace);

struct AGWeakAttribute {
    AGAttribute attribute;
    uint32_t id;
} NS_SWIFT_NAME(AnyWeakAttribute);
typedef struct AGWeakAttribute AGWeakAttribute;

typedef NS_OPTIONS(uint8_t, AGAttributeFlags) {
    AGAttributeFlagsNone = 0,
    AGAttributeFlagsUnknown1 = 1
} NS_SWIFT_NAME(AnyAttribute.Flags);

NS_ASSUME_NONNULL_END

#endif
