//
//  tlv.c
//  MySwiftUI
//
//  Created by Jinwoo Kim on 9/19/25.
//

#import "include/tlv.h"
#include <_abort.h>
#include <stdatomic.h>

static thread_local void *_perThreadTransactionData = NULL;
static thread_local uint32_t _perThreadTransactionID = NULL;
static thread_local void *_perThreadLayoutData = NULL;
static thread_local void *_perThreadLayoutDepthData = NULL;
static thread_local void *_perThreadGeometryProxyData = NULL;

void _setThreadTransactionData(void * _Nullable data) {
    _perThreadTransactionData = data;
}

void * _Nullable _threadTransactionData(void) {
    return _perThreadTransactionData;
}

uint32_t _threadTransactionID(bool increment_id) {
    if (!increment_id) {
        return _perThreadTransactionID;
    } else {
        static atomic_uint last_id = 0;
        uint32_t result = atomic_fetch_add_explicit(&last_id, 1, memory_order_relaxed);
        result += 1;
        _perThreadTransactionID = result;
        return result;
    }
}

void _setThreadLayoutData(void * _Nullable data) {
    _perThreadLayoutData = data;
}

void * _Nullable _threadLayoutData(void) {
    return _perThreadLayoutData;
}

void _setThreadLayoutDepthData(void * _Nullable data) {
    _perThreadLayoutDepthData = data;
}

void * _Nullable _threadLayoutDepthData(void) {
    return _perThreadLayoutDepthData;
}

void _setThreadGeometryProxyData(void * _Nullable data) {
    _perThreadGeometryProxyData = data;
}

void * _Nullable _threadGeometryProxyData(void) {
    return _perThreadGeometryProxyData;
}
