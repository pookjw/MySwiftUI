internal import MySwiftUICore
internal import CoreGraphics

struct InspectorStorage {
    // TODO
}

extension InspectorStorage {
    struct PreferenceKey: HostPreferenceKey {
        static let defaultValue: [ViewIdentity: InspectorStorage] = [:]
        
        static func reduce(value: inout [ViewIdentity: InspectorStorage], nextValue: () -> [ViewIdentity: InspectorStorage]) {
            assertUnimplemented()
        }
        
        static var _isReadableByHost: Bool {
            assertUnimplemented()
        }
        
        static var _includesRemovedValues: Bool {
            assertUnimplemented()
        }
    }
}

struct InspectorAnchorPreferenceKey: HostPreferenceKey {
    @safe static nonisolated(unsafe) let defaultValue: [AnyHashable: Anchor<CGRect?>] = [:]
    
    static func reduce(value: inout [AnyHashable: Anchor<CGRect?>], nextValue: () -> [AnyHashable: Anchor<CGRect?>]) {
        assertUnimplemented()
    }
    
    static var _isReadableByHost: Bool {
        assertUnimplemented()
    }
    
    static var _includesRemovedValues: Bool {
        assertUnimplemented()
    }
}
