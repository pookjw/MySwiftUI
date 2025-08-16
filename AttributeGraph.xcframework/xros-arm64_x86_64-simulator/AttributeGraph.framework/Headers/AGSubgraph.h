#import <Foundation/Foundation.h>
#import <AttributeGraph/Defines.h>

struct AGSubgraph {};
typedef struct AGSubgraph * AGSubgraphRef;

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGSubgraphRef _Nullable AGSubgraphGetCurrent(void);

NS_ASSUME_NONNULL_END
