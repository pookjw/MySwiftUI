public import simd

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
@MainActor public struct EntityGeometricPins : @MainActor Sequence {
    @MainActor public subscript(name: String) -> GeometricPin? {
        get {
            assertUnimplemented()
        }
    }
    
    @discardableResult
    @MainActor public func set(named name: String, position: SIMD3<Float> = SIMD3<Float>(0, 0, 0), orientation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)) -> GeometricPin {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor public func set(named name: String, position: SIMD3<Float> = SIMD3<Float>(0, 0, 0), orientation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1), relativeTo referenceEntity: Entity?) -> GeometricPin {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor public func set(named name: String, skeletalJointName: String, position: SIMD3<Float> = SIMD3<Float>(0, 0, 0), orientation: simd_quatf = simd_quatf(ix: 0, iy: 0, iz: 0, r: 1)) -> GeometricPin {
        assertUnimplemented()
    }
    
    @MainActor public func remove(named name: String) {
        assertUnimplemented()
    }
    
    @MainActor public var count: Int {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor public var isEmpty: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public struct Iterator : IteratorProtocol {
        public typealias Element = GeometricPin
        
        public mutating func next() -> EntityGeometricPins.Iterator.Element? {
            assertUnimplemented()
        }
    }
    
    public typealias Element = GeometricPin
    
    @MainActor public func makeIterator() -> EntityGeometricPins.Iterator {
        assertUnimplemented()
    }
    
    @MainActor public let entity: Entity
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension EntityGeometricPins : Sendable {}
