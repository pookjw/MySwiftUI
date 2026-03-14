internal import MySwiftUICore

struct SheetPreference {
    
}

extension SheetPreference {
    struct Placement {
        
    }
    
    struct InspectorKey: HostPreferenceKey {
        @safe static nonisolated(unsafe) let defaultValue: SheetPreference.Value = {
            fatalError("TODO")
        }()
        
        static func reduce(value: inout SheetPreference.Value, nextValue: () -> SheetPreference.Value) {
            fatalError("TODO")
        }
    }
    
    enum Value {
        case notPresented(views: [Namespace.ID: Transaction])
        case sheet(SheetPreference)
        case unspecified
    }
    
    struct Key: HostPreferenceKey {
        static var defaultValue: SheetPreference.Value {
            return .unspecified
        }
        
        static func reduce(value: inout SheetPreference.Value, nextValue: () -> SheetPreference.Value) {
            fatalError("TODO")
        }
    }
}
