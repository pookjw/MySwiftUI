#ifndef AGSubgraph_h
#define AGSubgraph_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/Defines.h>

struct AGSubgraph {};
typedef struct AGSubgraph * AGSubgraphRef;

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGSubgraphRef AGSubgraphCreate(void);
AG_EXTERN AGSubgraphRef _Nullable AGSubgraphGetCurrent(void);
AG_EXTERN void AGSubgraphSetCurrent(AGSubgraphRef _Nullable);

NS_ASSUME_NONNULL_END

#endif
