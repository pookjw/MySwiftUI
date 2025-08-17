//
//  MovableLock.m
//  MySwiftUI
//
//  Created by Jinwoo Kim on 8/18/25.
//

#import "include/MovableLock.h"
#include <malloc/_malloc.h>
#include <_abort.h>

extern pthread_t pthread_main_thread_np(void);

void msui_wait_for_lock(MovableLock lock, pthread_t thread);
void msui_run_moved_callback(MovableLock lock, pthread_t thread);

MovableLock _msui_MovableLockCreate(void) {
    MovableLock ptr = calloc(1, sizeof(MovableLock_t));
    if (ptr == NULL) {
        abort();
    }
    
    pthread_mutex_init(&ptr->mutex, NULL);
    pthread_cond_init(&ptr->cond, NULL);
    ptr->thread = pthread_main_thread_np();
    
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
    if (thread == lock->owner) {
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
        
        while (lock->owner != 0) {
            msui_wait_for_lock(lock, thread);
        }
        
        lock->owner = thread;
        lock->count = 1;
    }
}

void _msui_MovableLockUnlock(MovableLock lock) {
    if (lock->count-- == 1) {
        return;
    }
    
    if (lock->flag) {
        pthread_cond_broadcast(&lock->cond);
    }
    
    lock->count = 0;
    lock->flag = false;
    pthread_mutex_unlock(&lock->mutex);
}

void _msui_MovableLockSyncMain(MovableLock lock) {
    abort();
}

void _msui_MovableLockWait(MovableLock lock) {
    pthread_t thrad = pthread_self();
    uint32_t count = lock->count;
    bool flag = lock->flag;
    lock->count = 0;
    lock->owner = 0;
    
    if (flag) {
        pthread_cond_broadcast(&lock->cond);
    }
    
    do {
        msui_wait_for_lock(lock, thrad);
    } while (lock->owner != 0);
    
    lock->owner = thrad;
    lock->count = count;
}

void _msui_MovableLockBroadcast(MovableLock lock) {
    pthread_cond_broadcast(&lock->cond);
}

void msui_wait_for_lock(MovableLock lock, pthread_t thread) {
    abort();
}

void msui_run_moved_callback(MovableLock lock, pthread_t thread) {
    abort();
}
