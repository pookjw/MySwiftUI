// 56D4CED87D5B226E2B40FB60C47D6F49
package import AttributeGraph

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

protocol InstrumentsDescriptiveDynamicProperty: DynamicProperty {
    var _instrumentsLinkValue: Any { get }
}

extension InstrumentsDescriptiveDynamicProperty {
    fileprivate var instrumentsLinkValueDescription: String {
        let value = _instrumentsLinkValue
        
        if let value = value as? InstrumentsDescriptiveDynamicProperty {
            return value.instrumentsLinkValueDescription
        } else {
            return String(describing: value)
        }
    }
}

extension State: InstrumentsDescriptiveDynamicProperty {
    var _instrumentsLinkValue: Any {
        fatalError("TODO")
    }
}

extension Environment: InstrumentsDescriptiveDynamicProperty {
    var _instrumentsLinkValue: Any {
        fatalError("TODO")
    }
}

extension Binding: InstrumentsDescriptiveDynamicProperty {
    var _instrumentsLinkValue: Any {
        fatalError("TODO")
    }
}

extension DynamicProperty {
    package static func addTreeValue<T, U>(_ attribute: Attribute<T>, as firstType: U.Type, at fieldOffset: Int, in secondType: any Any.Type, flags: TreeValueFlags) {
        guard Subgraph.shouldRecordTree else {
            return
        }
        
        addTreeValueSlow(attribute.identifier, as: firstType, in: self, fieldOffset: fieldOffset, flags: flags)
    }
    
    static func addTreeValue<T>(_: Attribute<T>, at: Int, in: any Any.Type, flags: TreeValueFlags) {
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
