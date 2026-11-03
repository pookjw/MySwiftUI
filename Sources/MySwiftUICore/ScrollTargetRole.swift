// D49197C3D3C61F0DA0F0CF1D72D0077A
internal import AttributeGraph

struct ScrollTargetRole {
    private var role: ScrollTargetRole.Role
}

extension ScrollTargetRole {
    enum Role : Hashable {
        case container
        case target
    }
    
    struct Key : PreferenceKey {
        static var defaultValue: [ScrollTargetRole.Role : [any ScrollableCollection]] {
            assertUnimplemented()
        }

        static func reduce(value: inout [ScrollTargetRole.Role : [any ScrollableCollection]], nextValue: () -> [ScrollTargetRole.Role : [any ScrollableCollection]]) {
            assertUnimplemented()
        }
    }
    
    struct ContentKey : PreferenceKey {
        static var defaultValue: [ScrollTargetRole.Role : [any ScrollableCollection]] {
            return [:]
        }
        
        static func reduce(value: inout [ScrollTargetRole.Role : [any ScrollableCollection]], nextValue: () -> [ScrollTargetRole.Role : [any ScrollableCollection]]) {
            assertUnimplemented()
        }
    }
    
    struct SetLayout : Rule {
        @Attribute private var role: ScrollTargetRole.Role?
        @Attribute private var collection: any ScrollableCollection
        
        init(role: Attribute<ScrollTargetRole.Role?>, collection: Attribute<any ScrollableCollection>) {
            self._role = role
            self._collection = collection
        }
        
        var value: (inout [ScrollTargetRole.Role : [any ScrollableCollection]]) -> Void {
            assertUnimplemented()
        }
    }
}

extension _ViewInputs {
    var scrollTargetRole: OptionalAttribute<ScrollTargetRole.Role?> {
        return base.scrollTargetRole
    }
    
    var scrollTargetRemovePreference: Bool {
        return base.scrollTargetRemovePreference
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
            yield &self[_GraphInputs.ScrollTargetRoleKey.self]
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
            yield &self[_GraphInputs.RemovePreferenceInput.self]
        }
    }
    
    fileprivate struct ScrollTargetRoleKey : GraphInput {
        static let defaultValue = OptionalAttribute<ScrollTargetRole.Role?>()
    }
    
    fileprivate struct RemovePreferenceInput : GraphInput {
        static var defaultValue: Bool {
            return false
        }
    }
}
