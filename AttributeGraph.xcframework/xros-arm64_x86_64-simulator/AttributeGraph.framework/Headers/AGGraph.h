#ifndef AGGraph_h
#define AGGraph_h

#import <AttributeGraph/Defines.h>

NS_ASSUME_NONNULL_BEGIN

AG_EXTERN AGGraphRef AGGraphCreateShared(AGGraphRef) NS_RETURNS_RETAINED NS_SWIFT_NAME(AGGraphRef.init(shared:));
AG_EXTERN AGGraphRef AGGraphCreate(void) NS_RETURNS_RETAINED NS_SWIFT_NAME(AGGraphRef.init());
AG_EXTERN void AGGraphAddTraceEvent(AGGraphRef, int8_t *, void * /* ??? */, void * _Nullable);
AG_EXTERN NS_REFINED_FOR_SWIFT void AGGraphSetUpdateCallback(AGGraphRef, void (* _Nullable)(const void * _Nullable __attribute__((swift_context))) __attribute__((swiftcall)), const void * _Nullable);
AG_EXTERN unsigned long AGGraphGetCounter(AGGraphRef, AGGraphCounterOptions options) NS_SWIFT_NAME(AGGraphRef.counter(self:options:));
AG_EXTERN const void * _Nullable AGGraphClearUpdate(void) NS_SWIFT_NAME(AGGraphRef.clearUpdate());
AG_EXTERN void AGGraphSetUpdate(AGSubgraphRef) NS_SWIFT_NAME(AGGraphRef.setUpdate(_:));
AG_EXTERN const void * _Nullable AGGraphGetContext(AGGraphRef) NS_SWIFT_NAME(getter:AGGraphRef.context(self:));
AG_EXTERN void AGGraphSetContext(AGGraphRef, const void * _Nullable context) NS_SWIFT_NAME(setter:AGGraphRef.context(self:_:));
AG_EXTERN AGGraphRef AGGraphGetAttributeGraph(AGAttribute) NS_RETURNS_NOT_RETAINED NS_SWIFT_NAME(getter:AnyAttribute.graph(self:));
AG_EXTERN const void * _Nullable AGGraphGetOutputValue(AGTypeID);
AG_EXTERN void AGGraphSetOutputValue(const void * _Nullable, AGTypeID);
AG_EXTERN void AGGraphSetNeedsUpdate(AGGraphRef) NS_SWIFT_NAME(AGGraphRef.setNeedsUpdate(self:));
AG_EXTERN void AGGraphInvalidate(AGGraphRef) NS_SWIFT_NAME(AGGraphRef.invalidate(self:));

NS_ASSUME_NONNULL_END

#endif
