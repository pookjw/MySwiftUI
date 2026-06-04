@_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@MainActor @preconcurrency public class __RCEntity : Entity, HasAnchoring {
    @MainActor @preconcurrency public func invokeCustomTrigger(named name: String, overrides: [String : Entity]? = nil) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func registerCustomAction(named name: String, action: @escaping (Entity?) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
    
    @usableFromInline
    @MainActor @preconcurrency override internal init(_coreEntity: __EntityRef) {
        assertUnimplemented()
    }
    }
