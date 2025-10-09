//
//  MovableLock.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 8/18/25.
//

#include <pthread.h>
#include <stdbool.h>
#include <stdint.h>
#include "Defines.h"

typedef struct MovableLock_s {
    pthread_mutex_t mutex; // 0x0
    pthread_cond_t cond; // 0x40
    pthread_t _Nullable main; // 0x70
    pthread_t _Nullable owner; // 0x78
    uint32_t count; // 0x80
    uint32_t unknown1; // 0x84
    void (* _Nullable function)(void * _Nullable); // 0x88
    void * _Nullable context; // 0x90
    bool unknown2; // 0x98
    bool unknown3; // 0x99
} MovableLock_t;

typedef MovableLock_t * MovableLock __attribute((swift_newtype(struct)));

_Pragma("clang assume_nonnull begin")

MSUI_EXTERN MovableLock _MovableLockCreate(void) __attribute__((swift_name("MovableLock.create()")));
MSUI_EXTERN void _MovableLockDestroy(MovableLock lock) __attribute__((swift_name("MovableLock.destroy(self:)")));
MSUI_EXTERN bool _MovableLockIsOwner(MovableLock lock) __attribute__((swift_name("MovableLock.isOwner(self:)")));
MSUI_EXTERN bool _MovableLockIsOutermostOwner(MovableLock lock) __attribute__((swift_name("MovableLock.isOutermostOwner(self:)")));
MSUI_EXTERN void _MovableLockLock(MovableLock lock) __attribute__((swift_name("MovableLock.lock(self:)")));
MSUI_EXTERN void _MovableLockUnlock(MovableLock lock) __attribute__((swift_name("MovableLock.unlock(self:)")));
MSUI_EXTERN void _MovableLockSyncMain(MovableLock lock, void * _Nullable context, void (* _Nullable function)(void *)) __attribute__((swift_name("MovableLock.syncMain(self:context:function:)")));
MSUI_EXTERN void _MovableLockWait(MovableLock lock) __attribute__((swift_name("MovableLock.lockWait(self:)")));
MSUI_EXTERN void _MovableLockBroadcast(MovableLock lock) __attribute__((swift_name("MovableLock.broadcast(self:)")));

_Pragma("clang assume_nonnull end")
