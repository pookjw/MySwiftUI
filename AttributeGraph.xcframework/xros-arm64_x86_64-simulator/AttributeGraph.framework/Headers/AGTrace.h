#ifndef AGTrace_h
#define AGTrace_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/AGSubgraph.h>
#import <AttributeGraph/AGAttribute.h>
#import <AttributeGraph/AGGraph.h>
#import <AttributeGraph/AGType.h>

NS_ASSUME_NONNULL_BEGIN

struct AGTraceType {
    // Offset 0x00
    __unsafe_unretained void (^ _Nullable unknown_block_1)(void);
    // Offset 0x08
    __unsafe_unretained void (^ _Nullable unknown_block_2)(void);
    // Offset 0x10
    __unsafe_unretained void (^ _Nullable unknown_block_3)(void);
    
    // Offset 0x18
    __unsafe_unretained void (^ _Nullable block_4)(void *, AGSubgraphRef, uint32_t);
    
    // Offset 0x20
    __unsafe_unretained void (^ _Nullable unknown_block_5)(void);
    
    // Offset 0x28
    __unsafe_unretained void (^ _Nullable block_6)(void *, AGAttribute);
    
    // Offset 0x30
    __unsafe_unretained void (^ _Nullable unknown_block_7)(void);
    
    // Offset 0x38
    __unsafe_unretained void (^ _Nullable block_8)(void *, AGAttribute);
    
    // Offset 0x40
    __unsafe_unretained void (^ _Nullable unknown_block_9)(void);
    
    // Offset 0x48
    __unsafe_unretained void (^ _Nullable block_10)(void *, AGGraphRef);
    
    // Offset 0x50
    __unsafe_unretained void (^ _Nullable unknown_block_11)(void);
    
    // Offset 0x58
    __unsafe_unretained void (^ _Nullable block_12)(void *, AGGraphRef, AGAttribute);
    
    // Offset 0x60 - 0x80
    __unsafe_unretained void (^ _Nullable unknown_block_13)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_14)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_15)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_16)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_17)(void);

    // Offset 0x88
    __unsafe_unretained void (^ _Nullable block_18)(void *, AGGraphRef);
    
    // Offset 0x90
    __unsafe_unretained void (^ _Nullable block_19)(void *, AGGraphRef);

    // Offset 0x98
    __unsafe_unretained void (^ _Nullable block_20)(void *, AGGraphRef);

    // Offset 0xA0
    __unsafe_unretained void (^ _Nullable block_21)(void *, AGSubgraphRef);

    // Offset 0xA8
    __unsafe_unretained void (^ _Nullable block_22)(void *, AGSubgraphRef);

    // Offset 0xB0 - 0xB8
    __unsafe_unretained void (^ _Nullable unknown_block_23)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_24)(void);
    
    // Offset 0xC0
    __unsafe_unretained void (^ _Nullable block_25)(void *, AGAttribute);

    // Offset 0xC8 - 0xE8
    __unsafe_unretained void (^ _Nullable unknown_block_26)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_27)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_28)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_29)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_30)(void);

    // Offset 0xF0
    __unsafe_unretained void (^ _Nullable block_31)(void *, AGAttribute, const void *);

    // Offset 0xF8
    __unsafe_unretained void (^ _Nullable block_32)(void *, AGAttribute);

    // Offset 0x100
    __unsafe_unretained void (^ _Nullable block_33)(void *, AGAttribute);

    // Offset 0x108
    __unsafe_unretained void (^ _Nullable block_34)(void *, AGAttribute, AGAttribute);

    // Offset 0x110
    __unsafe_unretained void (^ _Nullable block_35)(void *, AGAttribute, AGAttribute);

    // Offset 0x118
    __unsafe_unretained void (^ _Nullable unknown_block_36)(void);
    
    // Offset 0x120
    __unsafe_unretained void (^ _Nullable block_37)(void *, AGGraphRef, const uint8_t * , const void * _Nullable, AGTypeID);
    
    // Offset 0x128 - 0x148
    __unsafe_unretained void (^ _Nullable unknown_block_38)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_39)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_40)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_41)(void);
    __unsafe_unretained void (^ _Nullable unknown_block_42)(void);
};
typedef struct AGTraceType AGTrace;

AG_EXTERN void AGGraphSetTrace(AGGraphRef graph, const AGTrace * _Nullable, const AGTrace * _Nullable) NS_SWIFT_NAME(Graph.setTrace(self:_:_:));

NS_ASSUME_NONNULL_END

#endif
