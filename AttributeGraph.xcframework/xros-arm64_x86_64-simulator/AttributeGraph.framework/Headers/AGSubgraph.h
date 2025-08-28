#ifndef AGSubgraph_h
#define AGSubgraph_h

#import <AttributeGraph/AGGraph.h>
#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGSubgraphRef AGSubgraphCreate(AGGraphRef) NS_SWIFT_NAME(Subgraph.init(graph:));
AG_EXTERN AGSubgraphRef _Nullable AGSubgraphGetCurrent(void) NS_SWIFT_NAME(getter:AGSubgraphRef.current());
AG_EXTERN void AGSubgraphSetCurrent(AGSubgraphRef _Nullable) NS_SWIFT_NAME(setter:AGSubgraphRef.current(_:));
AG_EXTERN void AGSubgraphAddChild(AGSubgraphRef, AGSubgraphRef) NS_SWIFT_NAME(Subgraph.addChild(self:_:));

NS_ASSUME_NONNULL_END

#endif
