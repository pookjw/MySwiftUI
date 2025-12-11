// D49197C3D3C61F0DA0F0CF1D72D0077A
internal import AttributeGraph

struct ScrollTargetRole {
    private var role: ScrollTargetRole.Role
}

extension ScrollTargetRole {
    enum Role {
        case container
        case target
    }
    
    struct Key {
        // TODO
    }
    
    struct ContentKey: PreferenceKey {
        static var defaultValue: [ScrollTargetRole.Role : [any ScrollableCollection]] {
            return [:]
        }
        
        static func reduce(value: inout [ScrollTargetRole.Role : [any ScrollableCollection]], nextValue: () -> [ScrollTargetRole.Role : [any ScrollableCollection]]) {
            fatalError("TODO")
        }
    }
    
    struct SetLayout {
        // TODO
    }
}

extension _ViewInputs {
    var scrollTargetRole: OptionalAttribute<ScrollTargetRole.Role?> {
        get {
            return base.scrollTargetRole
        }
        set {
            base.scrollTargetRole = newValue
        }
        _modify {
            yield &base.scrollTargetRole
        }
    }
    
    var scrollTargetRemovePreference: Bool {
        get {
            return base.scrollTargetRemovePreference
        }
        set {
            base.scrollTargetRemovePreference = newValue
        }
        _modify {
            yield &base.scrollTargetRemovePreference
        }
    }
}

extension _GraphInputs {
    var scrollTargetRole: OptionalAttribute<ScrollTargetRole.Role?> {
        get {
            return self[_GraphInputs.ScrollTargetRoleKey.self]
        }
        set {
            self[_GraphInputs.ScrollTargetRoleKey.self] = newValue
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    var scrollTargetRemovePreference: Bool {
        get {
            return self[_GraphInputs.RemovePreferenceInput.self]
        }
        set {
            self[_GraphInputs.RemovePreferenceInput.self] = newValue
        }
        _modify {
            fatalError("TODO")
        }
    }
    
    fileprivate struct ScrollTargetRoleKey: GraphInput {
        static let defaultValue = OptionalAttribute<ScrollTargetRole.Role?>()
    }
    
    fileprivate struct RemovePreferenceInput: GraphInput {
        static var defaultValue: Bool {
            return false
        }
    }
}
