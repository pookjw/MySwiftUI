#ifndef AGTrace_h
#define AGTrace_h

#import <AttributeGraph/AGSubgraph.h>
#import <AttributeGraph/AGAttribute.h>
#import <AttributeGraph/AGGraph.h>
#import <AttributeGraph/AGType.h>

NS_ASSUME_NONNULL_BEGIN

CF_IMPLICIT_BRIDGING_ENABLED

AG_EXTERN void AGGraphSetTrace(AGGraphRef graph, const AGTrace *) NS_SWIFT_NAME(Graph.setTrace(self:_:));

CF_IMPLICIT_BRIDGING_DISABLED

NS_ASSUME_NONNULL_END

#endif
