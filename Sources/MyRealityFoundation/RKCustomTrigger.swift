public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKCustomTrigger : __RKEntityTrigger {
    public init(identifier: String, customArguments: [String : String]? = [:]) {
        assertUnimplemented()
    }
    
    override public func matches(with trigger: __RKEntityTrigger) -> Bool {
        assertUnimplemented()
    }
    
    @objc override dynamic public func copy(with zone: NSZone? = nil) -> Any {
        assertUnimplemented()
    }
    }
