// D7D98064D8079914AC08939D4AA110C8
internal import MySwiftUICore
private import AttributeGraph

struct EditModeScopeFeature: ViewGraphFeature {
    mutating func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
        /*
         inputs -> x19
         graph -> x20
         */
        // x21
        let signal = Attribute<Void>(value: ())
        // x23
        let weakSignal = WeakAttribute(signal)
        // x22
        let location = StoredLocation<EditMode>(initialValue: .inactive, host: graph, signal: weakSignal)
        let editModeEnvironment = EditModeEnvironment(signal: signal, environment: inputs.environment, location: location)
        inputs.environment = Attribute(editModeEnvironment)
    }
    
    func uninstantiate(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func isHiddenForReuseDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
        fatalError("TODO")
    }
    
    mutating func needsUpdate(graph: ViewGraph) -> Bool {
        fatalError("TODO")
    }
    
    mutating func update(graph: ViewGraph) {
        fatalError("TODO")
    }
    
    func outputsDidChange(graph: ViewGraph) {
        fatalError("TODO")
    }
}

fileprivate struct EditModeEnvironment: Rule {
    @Attribute private(set) var signal: Void
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var location: StoredLocation<EditMode>
    
    var value: EnvironmentValues {
        // w23
        let signal = $signal
        // w24
        let environmentAttribute = $environment
        // x25
        let location = location
        
        Graph.registerDependency(attribute: signal.identifier, flags: 0)
        
        // x22
        var environment = environmentAttribute.value
        // sp + 0x40 -> sp + 0x28
        let binding = location.binding
        environment.editMode = binding
        
        return environment
    }
}

fileprivate struct EditModeKey: EnvironmentKey {
    static var defaultValue: Binding<EditMode>? {
        return nil
    }
}

@available(iOS 13.0, tvOS 13.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
extension EnvironmentValues {
    @available(macOS, unavailable)
    @available(watchOS, unavailable)
    public var editMode: Binding<EditMode>? {
        get {
            return self[EditModeKey.self]
        }
        set {
            self[EditModeKey.self] = newValue
        }
    }
}

public enum EditMode: Sendable {
    case inactive
    case transient
    case active
    
    public var isEditing: Bool {
        switch self {
        case .inactive:
            return false
        case .transient:
            return true
        case .active:
            return true
        }
    }
}

extension EditMode: Hashable {}
