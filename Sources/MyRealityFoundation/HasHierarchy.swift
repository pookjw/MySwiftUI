@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @MainActor public protocol HasHierarchy : MyRealityFoundation::Entity {
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension HasHierarchy {
    @MainActor @preconcurrency public var parent: MyRealityFoundation::Entity? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func setParent(_ parent: MyRealityFoundation::Entity?, preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var children: MyRealityFoundation::Entity.ChildCollection {
        get {
            return MyRealityFoundation::Entity.ChildCollection(entity: self)
        }
        set {
            assertUnimplemented()
        }
        _modify {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func addChild(_ entity: MyRealityFoundation::Entity, preservingWorldTransform: Bool = false) {
        self.children.append(entity, preservingWorldTransform: preservingWorldTransform)
    }
    
    @MainActor @preconcurrency public func removeChild(_ entity: MyRealityFoundation::Entity, preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func removeFromParent(preservingWorldTransform: Bool = false) {
        assertUnimplemented()
    }
}
