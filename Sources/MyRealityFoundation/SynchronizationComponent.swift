@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct SynchronizationComponent : Component, Equatable {
    public enum OwnershipTransferMode {
        case autoAccept
        case manual
        
        public static func == (a: SynchronizationComponent.OwnershipTransferMode, b: SynchronizationComponent.OwnershipTransferMode) -> Bool {
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
    
    public enum OwnershipTransferCompletionResult {
        case granted
        case timedOut
        
        public static func == (a: SynchronizationComponent.OwnershipTransferCompletionResult, b: SynchronizationComponent.OwnershipTransferCompletionResult) -> Bool {
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
    
    public var identifier: UInt64 {
        get {
            assertUnimplemented()
        }
    }
    
    public var isOwner: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    public var ownershipTransferMode: SynchronizationComponent.OwnershipTransferMode
    
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> SynchronizationComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static func == (lhs: SynchronizationComponent, rhs: SynchronizationComponent) -> Bool {
        assertUnimplemented()
    }

    @_spi(Internal) public static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation.Component {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferMode : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferMode : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferCompletionResult : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SynchronizationComponent.OwnershipTransferCompletionResult : Hashable {}

extension SynchronizationComponent : DefaultInitializable {
}
