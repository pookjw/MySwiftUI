#ifndef AGSubgraph_h
#define AGSubgraph_h

#import <AttributeGraph/AGGraph.h>
#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGSubgraphRef AGSubgraphCreate(AGGraphRef) NS_SWIFT_NAME(Subgraph.init(graph:));
AG_EXTERN AGSubgraphRef _Nullable AGSubgraphGetCurrent(void) NS_SWIFT_NAME(getter:Subgraph.current());
AG_EXTERN void AGSubgraphSetCurrent(AGSubgraphRef _Nullable) NS_SWIFT_NAME(setter:Subgraph.current(_:));
AG_EXTERN void AGSubgraphAddChild(AGSubgraphRef, AGSubgraphRef) NS_SWIFT_NAME(Subgraph.addChild(self:_:));
AG_EXTERN void AGSubgraphRemoveChild(AGSubgraphRef parent, AGSubgraphRef child) NS_SWIFT_NAME(Subgraph.removeChild(self:_:));
AG_EXTERN BOOL AGSubgraphIsDirty(AGSubgraphRef) NS_SWIFT_NAME(getter:Subgraph.isDirty(self:));
AG_EXTERN void AGSubgraphUpdate(AGSubgraphRef, unsigned int) NS_SWIFT_NAME(Subgraph.update(self:_:));
AG_EXTERN void AGSubgraphSetShouldRecordTree(void) NS_SWIFT_NAME(Subgraph.setShouldRecordTree());
AG_EXTERN BOOL AGSubgraphShouldRecordTree(void) NS_SWIFT_NAME(getter:Subgraph.shouldRecordTree());
AG_EXTERN AGGraphRef AGSubgraphGetGraph(AGSubgraphRef) NS_SWIFT_NAME(getter:Subgraph.graph(self:));

NS_ASSUME_NONNULL_END

#endif
