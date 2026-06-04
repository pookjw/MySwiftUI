@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct ModelSortGroup : Equatable, Sendable {
    public init(depthPass: ModelSortGroup.DepthPass? = nil) {
        assertUnimplemented()
    }
    
    public static func == (lhs: ModelSortGroup, rhs: ModelSortGroup) -> Bool {
        assertUnimplemented()
    }
    
    public static func != (lhs: ModelSortGroup, rhs: ModelSortGroup) -> Bool {
        assertUnimplemented()
    }
    
    public var depthPass: ModelSortGroup.DepthPass? {
        get {
            assertUnimplemented()
        }
    }
    
    public enum DepthPass : Sendable {
        case prePass
        case postPass
        
        public static func == (a: ModelSortGroup.DepthPass, b: ModelSortGroup.DepthPass) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public var planarUIPlacement: ModelSortGroup.PlanarUIPlacement? {
        get {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
    public enum PlanarUIPlacement : Sendable {
        case inlineUI
        case alwaysInFront
        case alwaysBehind
        
        public static func == (a: ModelSortGroup.PlanarUIPlacement, b: ModelSortGroup.PlanarUIPlacement) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ModelSortGroup {
    @safe public static nonisolated(unsafe) let planarUIInline: ModelSortGroup = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let planarUIAlwaysInFront: ModelSortGroup = {
        assertUnimplemented()
    }()
    
    @safe public static nonisolated(unsafe) let planarUIAlwaysBehind: ModelSortGroup = {
        assertUnimplemented()
    }()
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ModelSortGroup.DepthPass : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension ModelSortGroup.DepthPass : Hashable {}

@available(tvOS 26.0, visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
extension ModelSortGroup.PlanarUIPlacement : Equatable {}

@available(tvOS 26.0, visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, *)
extension ModelSortGroup.PlanarUIPlacement : Hashable {}
