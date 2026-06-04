@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct CollisionComponent : Component, Equatable {
    public enum Mode {
        case `default`
        case trigger
        @available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, *)
        case colliding
        
        public static func == (a: CollisionComponent.Mode, b: CollisionComponent.Mode) -> Bool {
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
    
    public var shapes: [ShapeResource]
    
    public var mode: CollisionComponent.Mode
    
    public var filter: CollisionFilter
    
    public init(shapes: [ShapeResource], mode: CollisionComponent.Mode = .default, filter: CollisionFilter = .default) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> CollisionComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
    
    public static func == (a: CollisionComponent, b: CollisionComponent) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension CollisionComponent {
    public init(shapes: [ShapeResource], isStatic: Bool, filter: CollisionFilter = .default) {
        assertUnimplemented()
    }
    
    public var isStatic: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension CollisionComponent {
    public struct CollisionOptions : OptionSet {
        @safe public static nonisolated(unsafe) let none: CollisionComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let `static`: CollisionComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let fullContactInformation: CollisionComponent.CollisionOptions = {
            assertUnimplemented()
        }()
        
        public let rawValue: UInt
        
        public init(rawValue: UInt) {
            assertUnimplemented()
        }
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias ArrayLiteralElement = CollisionComponent.CollisionOptions
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = CollisionComponent.CollisionOptions
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias RawValue = UInt
    }
    
    public init(shapes: [ShapeResource], mode: CollisionComponent.Mode = .default, collisionOptions: CollisionComponent.CollisionOptions, filter: CollisionFilter = .default) {
        assertUnimplemented()
    }
    
    public var collisionOptions: CollisionComponent.CollisionOptions {
        get {
            assertUnimplemented()
        }
        set(newOptions) {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension CollisionComponent.Mode : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension CollisionComponent.Mode : Hashable {}
