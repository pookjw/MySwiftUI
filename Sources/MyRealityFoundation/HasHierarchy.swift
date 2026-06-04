@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasHierarchy : Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasHierarchy {
    @MainActor @preconcurrency public var parent: Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func setParent(_ parent: Entity?, preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var children: Entity.ChildCollection {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func addChild(_ entity: Entity, preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func removeChild(_ entity: Entity, preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func removeFromParent(preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
}
