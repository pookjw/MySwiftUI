#ifndef AGGraph_h
#define AGGraph_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGGraphRef AGGraphCreateShared(AGGraphRef) NS_SWIFT_NAME(AGGraphRef.init(shared:));
AG_EXTERN AGGraphRef AGGraphCreate(void) NS_SWIFT_NAME(AGGraphRef.init());
AG_EXTERN void AGGraphAddTraceEvent(AGGraphRef, int8_t *, void * /* ??? */, void * _Nullable);
AG_EXTERN NS_REFINED_FOR_SWIFT void AGGraphSetUpdateCallback(AGGraphRef, void (* _Nullable)(const void * _Nullable __attribute__((swift_context))) __attribute__((swiftcall)), const void * _Nullable);
AG_EXTERN void AGGraphSetContext(AGGraphRef, const void * _Nullable context);
AG_EXTERN const void * _Nullable AGGraphGetContext(AGGraphRef);
AG_EXTERN unsigned long AGGraphGetCounter(AGGraphRef, AGGraphCounterOptions options) NS_SWIFT_NAME(AGGraphRef.counter(self:options:));
AG_EXTERN const void * _Nullable AGGraphClearUpdate(void) NS_SWIFT_NAME(AGGraphRef.clearUpdate());
AG_EXTERN void AGGraphSetUpdate(const void * _Nullable) NS_SWIFT_NAME(AGGraphRef.setUpdate(_:));

NS_ASSUME_NONNULL_END

#endif
