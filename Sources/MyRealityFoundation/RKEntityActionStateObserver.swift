@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __RKEntityActionStateObserver : AnyObject {
    func action(_ action: __RKEntityAction, didChangeStateFrom fromState: __RKEntityAction.State, to toState: __RKEntityAction.State)
}
