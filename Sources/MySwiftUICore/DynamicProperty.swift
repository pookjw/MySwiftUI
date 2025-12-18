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
}
