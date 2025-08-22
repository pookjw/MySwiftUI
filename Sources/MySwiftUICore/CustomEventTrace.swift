#warning("TODO")
internal import AttributeGraph

package struct CustomEventTrace {
    static nonisolated(unsafe) var recorder: Recorder? = nil
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

extension CustomEventTrace {
    class Recorder {
        private(set) var graph: AGGraphRef
        private(set) var cefOp: UnsafeMutablePointer<Int8>
        
        init(graph: AGGraphRef) {
            // inlined
            fatalError("TODO")
        }
    }
}
