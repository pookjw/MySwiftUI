//
//  tlv.h
//  MySwiftUI
//
//  Created by Jinwoo Kim on 9/19/25.
//

#include "Defines.h"
#include <stdbool.h>
#include <stdint.h>

MSUI_EXTERN void _setThreadTransactionData(void * _Nullable);
MSUI_EXTERN void * _Nullable _threadTransactionData(void);
MSUI_EXTERN uint32_t _threadTransactionID(bool increment_id);
MSUI_EXTERN void _setThreadLayoutData(void * _Nullable);
MSUI_EXTERN void * _Nullable _threadLayoutData(void);
MSUI_EXTERN void _setThreadLayoutDepthData(void * _Nullable);
MSUI_EXTERN void * _Nullable _threadLayoutDepthData(void);
