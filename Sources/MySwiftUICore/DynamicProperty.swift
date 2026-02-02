// 56D4CED87D5B226E2B40FB60C47D6F49
internal import AttributeGraph

public protocol DynamicProperty {
    static func _makeProperty<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int, inputs: inout _GraphInputs)
    static var _propertyBehaviors: UInt32 { get }
    func update()
}

extension DynamicProperty {
    public static func _makeProperty<T>(in buffer: inout _DynamicPropertyBuffer, container: _GraphValue<T>, fieldOffset: Int, inputs: inout _GraphInputs) {
        fatalError("TODO")
    }
    
    public static var _propertyBehaviors: UInt32 {
        return 0
    }
    
    public func update() {
        fatalError("TODO")
    }
    
    fileprivate var instrumentsLinkValueDescription: String {
        fatalError("TODO")
    }
    
    static func addTreeValueSlow<T>(_ attribute: AnyAttribute, as firstType: T.Type, in secondType: Any.Type, fieldOffset: Int = 0, flags: TreeValueFlags) {
        let fields = DynamicPropertyCache.fields(of: secondType)
        
        // inlined
        if let name = fields._name(at: fieldOffset) {
            Subgraph.addTreeValue(
                Attribute<T>(identifier: attribute),
                forKey: name,
                flags: flags.rawValue
            )
        } else {
            Subgraph.addTreeValue(
                Attribute<T>(identifier: attribute),
                forKey: "<unknown>",
                flags: flags.rawValue
            )
        }
    }
}

struct TreeValueFlags: OptionSet {
    let rawValue: UInt32
    
    init(rawValue: UInt32) {
        self.rawValue = rawValue
    }
    
    static var stateSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 0)
    }
    
    static var environmentObjectSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 1)
    }
    
    static var observedObjectSignal: TreeValueFlags {
        return [.stateSignal, .environmentObjectSignal]
    }
    
    static var appStorageSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 2)
    }
    
    static var sceneStorageSignal: TreeValueFlags {
        return [.stateSignal, .appStorageSignal]
    }
    
    static var stateObjectSignal: TreeValueFlags {
        return [.environmentObjectSignal, .appStorageSignal]
    }
    
    static var focusedObjectSignal: TreeValueFlags {
        return [.stateSignal, .environmentObjectSignal, .appStorageSignal]
    }
    
    static var lazyStateSignal: TreeValueFlags {
        return TreeValueFlags(rawValue: 1 << 3)
    }
}

//@_transparent
func traceDynamicPropertyEvent(
    property: any DynamicProperty,
    elt: UnsafeRawPointer
) {
    Signpost.linkUpdate.traceEvent(
        type: .event,
        object: nil,
        "Updated: %{public}@ [ %p ] - %@",
        args: [
            String(describing: type(of: property)),
            property.instrumentsLinkValueDescription,
            UInt(bitPattern: elt)
        ]
    )
}
