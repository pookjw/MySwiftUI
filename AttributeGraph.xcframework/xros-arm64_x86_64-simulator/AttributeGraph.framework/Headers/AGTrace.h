#ifndef AGTrace_h
#define AGTrace_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/AGSubgraph.h>
#import <AttributeGraph/AGAttribute.h>
#import <AttributeGraph/AGGraph.h>
#import <AttributeGraph/AGType.h>

NS_ASSUME_NONNULL_BEGIN

struct AGTraceType {
    __unsafe_unretained void (^ _Nullable block_1)(void *, AGSubgraphRef, uint32_t);
    __unsafe_unretained void (^ _Nullable block_2)(void *, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_3)(void *, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_4)(void *, AGGraphRef);
    __unsafe_unretained void (^ _Nullable block_5)(void *, AGGraphRef, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_6)(void *, AGGraphRef, const uint8_t * , const void * _Nullable, AGTypeID);
    __unsafe_unretained void (^ _Nullable block_7)(void *, AGGraphRef);
    __unsafe_unretained void (^ _Nullable block_8)(void *, AGGraphRef);
    __unsafe_unretained void (^ _Nullable block_9)(void *, AGGraphRef);
    __unsafe_unretained void (^ _Nullable block_10)(void *, AGSubgraphRef);
    __unsafe_unretained void (^ _Nullable block_11)(void *, AGSubgraphRef);
    __unsafe_unretained void (^ _Nullable block_12)(void *, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_13)(void *, AGAttribute, const void *);
    __unsafe_unretained void (^ _Nullable block_14)(void *, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_15)(void *, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_16)(void *, AGAttribute, AGAttribute);
    __unsafe_unretained void (^ _Nullable block_17)(void *, AGAttribute, AGAttribute);
};
typedef struct AGTraceType AGTraceType;

AG_EXTERN void AGGraphSetTrace(AGGraphRef graph, AGTraceType trace);

NS_ASSUME_NONNULL_END

#endif
