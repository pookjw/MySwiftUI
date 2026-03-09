internal import MySwiftUICore
internal import CoreGraphics

struct InspectorStorage {
    // TODO
}

extension InspectorStorage {
    struct PreferenceKey: HostPreferenceKey {
        static let defaultValue: [ViewIdentity: InspectorStorage] = [:]
        
        static func reduce(value: inout [ViewIdentity: InspectorStorage], nextValue: () -> [ViewIdentity: InspectorStorage]) {
            fatalError("TODO")
        }
        
        static var _isReadableByHost: Bool {
            fatalError("TODO")
        }
        
        static var _includesRemovedValues: Bool {
            fatalError("TODO")
        }
    }
}

struct InspectorAnchorPreferenceKey: HostPreferenceKey {
    @safe static nonisolated(unsafe) let defaultValue: [AnyHashable: Anchor<CGRect?>] = [:]
    
    static func reduce(value: inout [AnyHashable: Anchor<CGRect?>], nextValue: () -> [AnyHashable: Anchor<CGRect?>]) {
        fatalError("TODO")
    }
    
    static var _isReadableByHost: Bool {
        fatalError("TODO")
    }
    
    static var _includesRemovedValues: Bool {
        fatalError("TODO")
    }
}
