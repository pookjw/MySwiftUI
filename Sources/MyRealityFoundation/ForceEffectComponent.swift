// F9575A69BF4711160DDF1906A8008A07
private import CoreRE

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct ForceEffectComponent : Component {
    fileprivate static let _registeredForceEffectsCodable = MyRealityFoundation::Atomic<[ObjectIdentifier : any (ForceEffectProtocol & Codable).Type]>(wrappedValue: [:])
    
    public var effects: [any ForceEffectBase]
    
    public init(effects: [any ForceEffectBase], simulationState: ForceEffectComponent.SimulationState = .start) {
        assertUnimplemented()
    }
    
    public init(effect: any ForceEffectBase) {
        assertUnimplemented()
    }
    
    public enum SimulationState {
        case start
        case pause
        case resume
        
        public static func == (a: ForceEffectComponent.SimulationState, b: ForceEffectComponent.SimulationState) -> Bool {
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
    
    public var simulationState: ForceEffectComponent.SimulationState?
    
    @MainActor @preconcurrency public static func __fromCore(_ coreComponent: __ComponentRef) -> ForceEffectComponent {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __toCore(_ coreComponent: __ComponentRef) {
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

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    @_spi(Internal) public static var coreComponentType: CoreComponentType {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectComponent.SimulationState : Equatable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectComponent.SimulationState : Hashable {}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public protocol ForceEffectProtocol {
    var parameterTypes: PhysicsBodyParameterTypes { get }
    var forceMode: ForceMode { get }
    func update(parameters: inout ForceEffectParameters)
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectProtocol {
    public var parameterTypes: PhysicsBodyParameterTypes {
        get {
            assertUnimplemented()
        }
    }
    
    public func update(parameters: inout ForceEffectParameters) {
        assertUnimplemented()
    }
    
    @preconcurrency @MainActor public static func register(_ updateHandler: (@MainActor (inout ForceEffectEvent<Self>) -> Void)? = nil) {
        assertUnimplemented()
    }
    
    static func __register(engine: __Engine?, _: ((inout ForceEffectEvent<Self>) -> Void)?) {
        assertUnimplemented()
    }
    
    static func create(_: Int, _: OpaquePointer) throws -> any ForceEffectBase {
        assertUnimplemented()
    }
    
    static func createFromCoreAndUserForceEffect<T : ForceEffectProtocol>(_: Int, _: OpaquePointer, _: T) -> any ForceEffectBase {
        assertUnimplemented()
    }
    
    static func eventBus(_ engine: __Engine?) -> OpaquePointer {
        if let engine {
            let coreEngine = unsafe unsafeBitCast(engine.coreEngine, to: CoreRE::Engine.self)
            let eventBus = coreEngine.eventBus
            return unsafe unsafeBitCast(eventBus, to: OpaquePointer.self)
        } else {
            let coreServiceLocator = unsafe unsafeBitCast(
                __ServiceLocator.shared.coreServiceLocator,
                to: CoreRE::ServiceLocator.self
            )
            let eventBus = coreServiceLocator.eventBus!
            return unsafe unsafeBitCast(eventBus, to: OpaquePointer.self)
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension ForceEffectProtocol where Self : Decodable, Self : Encodable {
    @preconcurrency @MainActor public static func register(_ updateHandler: (@MainActor (inout ForceEffectEvent<Self>) -> Void)? = nil) {
        assertUnimplemented()
    }
    
    static func __register(
        engine: __Engine?,
        _ block: ((inout ForceEffectEvent<Self>) -> Void)?
    ) {
        var map = ForceEffectComponent._registeredForceEffectsCodable.wrappedValue
        map[ObjectIdentifier(self)] = self
        ForceEffectComponent._registeredForceEffectsCodable.wrappedValue = map
        
        // <+244>
        guard let block else {
            return
        }
        
        let eventBus = unsafe self.eventBus(engine)
        let eventID = getEventID(REEntityForceEffectComputeForcesEvent.self)
        
        unsafe unsafeBitCast(eventBus, to: CoreRE::EventBus.self)
            .subscribeWithMatch(
                eventID,
                nil,
                { _, core in
                    // $s17RealityFoundation19ForceEffectProtocolPAASeRzSERzrlE10__register6engine_y0A3Kit8__EngineCSg_yAA0cD5EventVyxGzcSgtFZ08dispatchJ0L_12sourceObject10payloadRefSo20REEventHandlerResultVSvSg_SVtAaBRzSeRzSERzlFTA
                    // x19 + 0x208
                    let parameters = unsafe ForceEffectParameters.__fromCore(core)
                    
                    let casted = unsafe core
                        .assumingMemoryBound(to: CoreRE::ForceEffectParameters.self)
                        .pointee
                    
                    let effectData = unsafe Data(
                        bytes: casted.effectData,
                        count: casted.effectDataCount
                    )
                    
                    if var event = try? unsafe ForceEffectEvent<Self>(
                        effectData: effectData,
                        parameters: parameters
                    ) {
                        block(&event)
                    }
                    
                    return .unknown0
                },
                UnsafeRawPointer(
                    bitPattern: UInt(
                        bitPattern: ObjectIdentifier(self)
                    )
                ).unsafelyUnwrapped
            )
    }
    
    static func create(_: Int, _: OpaquePointer) throws -> any ForceEffectBase {
        assertUnimplemented()
    }
}
