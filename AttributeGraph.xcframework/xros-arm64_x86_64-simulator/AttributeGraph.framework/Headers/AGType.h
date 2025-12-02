#ifndef AGType_h
#define AGType_h

#import <CoreFoundation/CoreFoundation.h>
#import <AttributeGraph/Defines.h>

AG_EXTERN CFStringRef AGTypeDescription(AGTypeID) CF_RETURNS_RETAINED;
AG_EXTERN AGTypeSignature AGTypeGetSignature(AGTypeID) NS_SWIFT_NAME(getter:TypeID.signature(self:));
AG_EXTERN AGMetadataKind AGTypeGetKind(AGTypeID) NS_SWIFT_NAME(MetadataKind.init(_:));
AG_EXTERN void AGTypeApplyFields(const AGSwiftMetadata *, const void *block, void * _Nullable) NS_REFINED_FOR_SWIFT;
AG_EXTERN void AGTypeApplyFields2(const AGSwiftMetadata *, AGTypeApplyOptions, const void *block, void * _Nullable) NS_REFINED_FOR_SWIFT;

#endif
