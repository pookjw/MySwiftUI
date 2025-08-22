#ifndef AGSubgraph_h
#define AGSubgraph_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/AGGraph.h>
#import <AttributeGraph/Defines.h>

struct AGSubgraph {};
typedef struct AGSubgraph * AGSubgraphRef;

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGSubgraphRef AGSubgraphCreate(AGGraphRef);
AG_EXTERN AGSubgraphRef _Nullable AGSubgraphGetCurrent(void);
AG_EXTERN void AGSubgraphSetCurrent(AGSubgraphRef _Nullable);
AG_EXTERN void AGSubgraphAddChild(AGSubgraphRef, AGSubgraphRef);

NS_ASSUME_NONNULL_END

#endif
