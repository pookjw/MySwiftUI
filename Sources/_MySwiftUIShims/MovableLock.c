//
//  MovableLock.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 8/18/25.
//

#import "include/MovableLock.h"
#include <malloc/_malloc.h>
#include <_abort.h>
#include <dispatch/dispatch.h>

extern pthread_t pthread_main_thread_np(void);

void msui_wait_for_lock(MovableLock lock, pthread_t thread);
void msui_run_moved_callback(MovableLock lock);
void _msui_sync_main_callback(MovableLock lock);

MovableLock _msui_MovableLockCreate(void) {
    MovableLock ptr = calloc(1, sizeof(MovableLock_t));
    if (ptr == NULL) {
        abort();
    }
    
    pthread_mutex_init(&ptr->mutex, NULL);
    pthread_cond_init(&ptr->cond, NULL);
    ptr->main = pthread_main_thread_np();
    
    return ptr;
}

void _msui_MovableLockDestroy(MovableLock lock) {
    pthread_cond_destroy(&lock->cond);
    pthread_mutex_destroy(&lock->mutex);
    free(lock);
}

bool _msui_MovableLockIsOwner(MovableLock lock) {
    return pthread_self() == lock->owner;
}

bool _msui_MovableLockIsOutermostOwner(MovableLock lock) {
    pthread_t thread = pthread_self();
    if (thread != lock->owner) {
        return false;
    }
    return lock->count == 1;
}

void _msui_MovableLockLock(MovableLock lock) {
    pthread_t thread = pthread_self();
    if (thread == lock->owner) {
        lock->count++;
    } else {
        pthread_mutex_lock(&lock->mutex);
        
        while (lock->owner != NULL) {
            msui_wait_for_lock(lock, thread);
        }
        
        lock->owner = thread;
        lock->count = 1;
    }
}

void _msui_MovableLockUnlock(MovableLock lock) {
    if (lock->count-- != 1) {
        return;
    }
    
    if (lock->unknown1) {
        pthread_cond_broadcast(&lock->cond);
    }
    
    lock->owner = NULL;
    pthread_mutex_unlock(&lock->mutex);
}

void _msui_MovableLockSyncMain(MovableLock lock, void *context, void (*function)(void *)) {
    pthread_t thread = pthread_self();
    if (thread == lock->main) {
        function(context);
    } else {
        lock->function = function;
        lock->context = context;
        
        if (lock->unknown3) {
            pthread_cond_signal_thread_np(&lock->cond, lock->main);
        } else if (!lock->unknown2) {
            lock->unknown2 = true;
            dispatch_async_f(dispatch_get_main_queue(), lock, (void (*)(void *))_msui_sync_main_callback);
            
            if (lock->unknown3) {
                pthread_cond_signal_thread_np(&lock->cond, lock->main);
            }
        }
        
        while (lock->function != NULL) {
            pthread_cond_wait(&lock->cond, &lock->mutex);
        }
    }
}

void _msui_MovableLockWait(MovableLock lock) {
    pthread_t thread = pthread_self();
    uint32_t count = lock->count;
    uint32_t flag = lock->unknown1;
    lock->count = 0;
    lock->owner = NULL;
    
    if (flag != 0) {
        pthread_cond_broadcast(&lock->cond);
    }
    
    do {
        msui_wait_for_lock(lock, thread);
    } while (lock->owner != NULL);
    
    lock->owner = thread;
    lock->count = count;
}

void _msui_MovableLockBroadcast(MovableLock lock) {
    pthread_cond_broadcast(&lock->cond);
}

void msui_wait_for_lock(MovableLock lock, pthread_t thread) {
    lock->unknown1++;
    
    if (lock->main == thread) {
        lock->unknown3 = true;
        msui_run_moved_callback(lock);
    }
    
    pthread_cond_wait(&lock->cond, &lock->mutex);
    
    if (lock->main == thread) {
        msui_run_moved_callback(lock);
        lock->unknown3 = false;
    }
    
    lock->unknown1--;
}

void msui_run_moved_callback(MovableLock lock) {
    if (lock->function != NULL) {
        pthread_t owner = lock->owner;
        uint32_t count = lock->count++;
        lock->owner = lock->main;
        lock->function(lock->context);
        lock->count = count;
        lock->owner = owner;
        lock->function = NULL;
        lock->context = NULL;
        pthread_cond_broadcast(&lock->cond);
    }
}

void _msui_sync_main_callback(MovableLock lock) {
    _msui_MovableLockLock(lock);
    lock->unknown2 = false;
    _msui_MovableLockUnlock(lock);
}
