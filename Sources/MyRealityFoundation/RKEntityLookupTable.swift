public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __RKEntityLookupTable {
    public init() {
        assertUnimplemented()
    }
    
    public func entity(for uuid: UUID) -> Entity? {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func uuid(for entity: Entity) -> UUID? {
        assertUnimplemented()
    }
    
    @discardableResult
    public func updateEntity(_ entity: Entity?, for uuid: UUID) -> Entity? {
        assertUnimplemented()
    }
    
    public func removeAllEntities() {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public func entity(name: String) -> Entity? {
        assertUnimplemented()
    }
    }
