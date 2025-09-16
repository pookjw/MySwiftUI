#warning("TODO")
private import MySwiftUICore

final class HostingViewRegistry {
    static nonisolated(unsafe) let shared = HostingViewRegistry()
    private var elements: [ObjectIdentifier : WeakBox<AnyObject>] = [:]
    
    func add<T: HostingViewProtocol>(_ view: T) {
        elements[ObjectIdentifier(view)] = WeakBox(view)
    }
    
    func remove<T: HostingViewProtocol>(_ view: T) {
        elements.removeValue(forKey: ObjectIdentifier(view))
    }
    
    func forEach(_ body: (_: any HostingViewProtocol) -> Void) {
        for value in elements.values {
            if let base = value.base as? HostingViewProtocol {
                body(base)
            }
        }
    }
}

protocol HostingViewProtocol: AnyObject {
    func preferenceValue<T: HostPreferenceKey>(_ type: T.Type) -> T.Value
    func convertAnchor<T>(_ anchor: Anchor<T>) -> T
}
