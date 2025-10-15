#warning("TODO")
internal import MySwiftUICore

struct SheetPreference {
    
}

extension SheetPreference {
    struct Placement {
        
    }
    
    struct InspectorKey {
        
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
