@_spi(Internal) public protocol EventBindingSource: AnyObject {
    func attach(to: EventBindingBridge)
    
    func `as`<T>(_ type: T.Type) -> T?
    
    func didBind(to: EventBinding, id: EventID, in: EventBindingBridge)
    
    func didUpdate(phase: GesturePhase<Void>, in: EventBindingBridge)
    
    func didUpdate(gestureCategory: GestureCategory, in: EventBindingBridge)
}
