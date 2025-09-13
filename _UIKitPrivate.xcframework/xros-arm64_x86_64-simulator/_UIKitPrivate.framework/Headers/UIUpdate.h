#import <UIKit/UIKit.h>

NS_HEADER_AUDIT_BEGIN(nullability, sendability)

struct _UIUpdateTiming {
    unsigned long long a;
    unsigned long long b;
    unsigned long long c;
};
typedef struct _UIUpdateTiming _UIUpdateTiming;

struct _UIUpdateSequenceItemInternal {
};
typedef struct _UIUpdateSequenceItemInternal _UIUpdateSequenceItemInternal;

UIKIT_EXTERN BOOL _UIUpdateCycleEnabled(void);
UIKIT_EXTERN void * _UIUpdateSequenceInsertItem(_UIUpdateSequenceItemInternal *item, BOOL, const char *, BOOL, void (^)(_UIUpdateTiming));

NS_HEADER_AUDIT_END(nullability, sendability)
