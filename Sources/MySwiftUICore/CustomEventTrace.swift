#warning("TODO")

package struct CustomEventTrace {
    
}

extension CustomEventTrace {
    package enum ActionEventType {
        case enqueue
        case start
        case finish
        case gestureMetadata
    }
}

extension CustomEventTrace.ActionEventType {
    package enum Reason {
        case onAppear
        case onChange
        case onDisappear
        case gesture
        case didReleaseButton
        case animationLogicallyCompleted
        case animationRemoved
        case hoverChanged
        case scrollChanged
        case scrollPrefetch
        case signalPrefetch
        case navSelectionUpdate
        case splitSidebarVisibilityChanged
        case preferenceChange
        case onFocusChanged
        case navStackPush
        case navStackPop
    }
}
