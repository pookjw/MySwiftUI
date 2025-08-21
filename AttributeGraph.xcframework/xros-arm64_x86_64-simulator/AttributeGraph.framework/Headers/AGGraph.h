#ifndef AGGraph_h
#define AGGraph_h

#import <Foundation/Foundation.h>
#import <AttributeGraph/Defines.h>

struct AGGraph {};
typedef struct AGGraph * AGGraphRef;

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGGraphRef AGGraphCreateShared(void);
AG_EXTERN AGGraphRef AGGraphCreate(void);

NS_ASSUME_NONNULL_END

#endif
