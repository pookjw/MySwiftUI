@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
public struct InputTargetComponent : Component, Equatable {
    public var isEnabled: Bool
    
    public var allowedInputTypes: InputTargetComponent.InputType
    
    public struct InputType : OptionSet {
        @safe public static nonisolated(unsafe) let direct: InputTargetComponent.InputType = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let indirect: InputTargetComponent.InputType = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let all: InputTargetComponent.InputType = {
            assertUnimplemented()
        }()
        
        public init(rawValue: UInt32) {
            assertUnimplemented()
        }
        
        public let rawValue: UInt32
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias ArrayLiteralElement = InputTargetComponent.InputType
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias Element = InputTargetComponent.InputType
        
        @available(iOS 18.0, tvOS 26.0, visionOS 1.0, macOS 15.0, macCatalyst 18.0, *)
        public typealias RawValue = UInt32
    }
    
    public init(allowedInputTypes: InputTargetComponent.InputType = .all) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> InputTargetComponent {
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
    
    public static func == (a: InputTargetComponent, b: InputTargetComponent) -> Bool {
        assertUnimplemented()
    }
}
