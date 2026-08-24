// F4E16A453D8AE199771F0745BF89049E
public import Foundation
public import simd
public import CoreMedia
public import Spatial
private import CoreRE

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var bindableValues: BindableValuesReference {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Entity {
    public struct ParameterSet {
        @preconcurrency @MainActor public subscript<T>(name: String, type: T.Type = T.self) -> BindableValue<T>? where T : BindableData {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
    }
    
    @MainActor @preconcurrency public var parameters: Entity.ParameterSet {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public subscript(entityPath: BindTarget.EntityPath) -> Entity? {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var __anchoringType: __REAnchoringType? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var __tags: [String] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity : @MainActor RealityCoordinateSpace {
    @MainActor @preconcurrency public func _resolve(in context: __RealityCoordinateSpaceContext) -> __ResolvedRealityCoordinateSpace {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func __remapUUIDs(entityIdentifierMapping: @escaping (UUID) -> UUID, interactionIdentifierMapping: @escaping (UUID) -> UUID) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity : @MainActor CustomDebugStringConvertible {
    @MainActor @preconcurrency public var debugDescription: String {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var __interactionIdentifier: UUID? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var availableAnimations: [AnimationResource] {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var spatialAudio: SpatialAudioComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func __setLoadContext(_ loadContext: __SceneResourceLoadResultLoadContext?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __fetchLoadContext() -> __SceneResourceLoadResultLoadContext? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __setSceneResourceCacheEntry(_ sceneResourceCache: __SceneResourceCache.Entry?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __fetchSceneResourceCacheEntry() -> __SceneResourceCache.Entry? {
        assertUnimplemented()
    }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func playAudio(configuration: AudioGeneratorConfiguration = .init(), _ generatorRenderHandler: @escaping Audio.GeneratorRenderHandler) throws -> AudioGeneratorController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func prepareAudio(configuration: AudioGeneratorConfiguration = .init(), _ generatorRenderHandler: @escaping Audio.GeneratorRenderHandler) throws -> AudioGeneratorController {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @discardableResult
    @MainActor @preconcurrency public func playAudio(_ resource: AudioResource) -> AudioPlaybackController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func prepareAudio(_ resource: AudioResource) -> AudioPlaybackController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func stopAllAudio() {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func generateCollisionShapes(recursive: Bool) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func generateCollisionShapes(recursive: Bool, static isStatic: Bool) {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, tvOS 26.0, macCatalyst 26.0, visionOS 26.0, *)
extension Entity.Observable.Components {
    public subscript<T>(componentType: T.Type) -> T? where T : _ImplicitlyAnimatableBuiltinComponent {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Entity {
    @discardableResult
    @MainActor @preconcurrency public func moveCharacter(by moveDelta: SIMD3<Float>, deltaTime: Float, relativeTo referenceEntity: Entity?, collisionHandler: ((CharacterControllerComponent.Collision) -> Void)? = nil) -> CharacterControllerComponent.CollisionFlags {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func teleportCharacter(to position: SIMD3<Float>, relativeTo referenceEntity: Entity?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var characterController: CharacterControllerComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var characterControllerState: CharacterControllerStateComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(iOS 26.0, macCatalyst 26.0, macOS 26.0, visionOS 26.0, tvOS 26.0, *)
extension Entity {
    @MainActor public func attach(_ source: GeometricPin? = nil, to target: GeometricPin) {
        assertUnimplemented()
    }
}

extension Entity {
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    public enum CoordinateSpaceReference {
        case scene
        case immersiveSpace
        
        public static func == (a: Entity.CoordinateSpaceReference, b: Entity.CoordinateSpaceReference) -> Bool {
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
    
    @available(visionOS 2.0, *)
    @available(macOS, unavailable)
    @available(iOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, unavailable)
    @MainActor @preconcurrency public func transformMatrix(relativeTo referenceSpace: Entity.CoordinateSpaceReference) -> float4x4? {
        assertUnimplemented()
    }
}

extension Entity {
    @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, macOS 26.0, *)
    @MainActor public var observable: Entity.Observable {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, macOS 26.0, *)
    @frozen public struct Observable {
        private let entity: Entity
        
        public var name: String {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var isEnabled: Bool {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var children: Entity.ChildCollection {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var transform: Transform {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var position: SIMD3<Float> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var scale: SIMD3<Float> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var orientation: simd_quatf {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var components: Entity.Observable.Components {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        @available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, macOS 26.0, *)
        public struct Components {
            public subscript<T>(type: T.Type) -> T? where T : Component {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
        }
    }
}

@available(*, unavailable)
extension Entity.Observable : Sendable {
}

@available(*, unavailable)
extension Entity.Observable.Components : Sendable {
}

@available(visionOS 26.0, iOS 26.0, macCatalyst 26.0, tvOS 26.0, macOS 26.0, *)
extension Entity : Observable {
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension Entity {
    public struct ConfigurationCatalog {
        public struct Configuration : Identifiable, Sendable {
            public var id: String {
                get {
                    assertUnimplemented()
                }
            }
            
            public init(id: String) {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias ID = String
        }
        
        public struct ConfigurationSet : Identifiable, Sendable {
            public var id: String {
                get {
                    assertUnimplemented()
                }
            }
            
            public var configurations: [String : Entity.ConfigurationCatalog.Configuration] {
                get {
                    assertUnimplemented()
                }
            }
            
            public var defaultConfiguration: Entity.ConfigurationCatalog.Configuration {
                get {
                    assertUnimplemented()
                }
            }
            
            public init(id: String, configurations: [String : Entity.ConfigurationCatalog.Configuration], defaultConfigurationId: String? = nil) throws {
                assertUnimplemented()
            }
            
            public init(id: String, configurations: [Entity.ConfigurationCatalog.Configuration], defaultConfigurationId: String? = nil) throws {
                assertUnimplemented()
            }
            
            @available(iOS 18.0, tvOS 26.0, visionOS 2.0, macOS 15.0, macCatalyst 18.0, *)
            public typealias ID = String
        }
        
        public struct ConfigurationCombination {
            public init(entity: Entity, configurationSpecifications: [String : String]) {
                assertUnimplemented()
            }
            
            public let entity: Entity
            
            public let configurationSpecifications: [String : String]
        }
        
        public init(configurationSets: [String : Entity.ConfigurationCatalog.ConfigurationSet], combinations: [Entity.ConfigurationCatalog.ConfigurationCombination]) throws {
            assertUnimplemented()
        }
        
        public init(configurationSets: [Entity.ConfigurationCatalog.ConfigurationSet], combinations: [Entity.ConfigurationCatalog.ConfigurationCombination]) throws {
            assertUnimplemented()
        }
        
        @MainActor public func write(to url: URL) async throws {
            assertUnimplemented()
        }
        
        public var configurationSets: [String : Entity.ConfigurationCatalog.ConfigurationSet] {
            get {
                assertUnimplemented()
            }
        }
    }
    
    @MainActor @preconcurrency convenience public init(from catalog: Entity.ConfigurationCatalog, configurations: [String : String]? = nil) async throws {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, macCatalyst 26.0, visionOS 26.0, tvOS 26.0, *)
extension Entity.ConfigurationCatalog : Equatable {
    public static func == (lhs: Entity.ConfigurationCatalog, rhs: Entity.ConfigurationCatalog) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 26.0, iOS 26.0, macCatalyst 26.0, visionOS 26.0, tvOS 26.0, *)
extension Entity.ConfigurationCatalog.ConfigurationSet : Equatable {
    public static func == (lhs: Entity.ConfigurationCatalog.ConfigurationSet, rhs: Entity.ConfigurationCatalog.ConfigurationSet) -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var channelAudio: ChannelAudioComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var anchor: (any HasAnchoring)? {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@safe @preconcurrency @MainActor open class Entity : HasHierarchy, HasSynchronization, HasTransform, Sendable {
    @MainActor @preconcurrency public var __coreEntity: __EntityRef {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var components: Entity.ComponentSet {
        get {
            return Entity.ComponentSet(entity: self)
        }
        set {
            unsafe self.coreEntity = newValue.entity.coreEntity
        }
    }
    
    @MainActor @preconcurrency public var scene: Scene? {
        guard let reScene = unsafe unsafeBitCast(self.coreEntity, to: CoreRE::Entity.self).scene else {
            return nil
        }
        
        let scene: MyRealityFoundation::Scene
#if RealityKitCompatibility
        if let bridgedScene = reScene.myRealityKitRef {
            scene = bridgedScene
        } else {
            scene = unsafe MyRealityFoundation::Scene(coreScene: unsafeBitCast(reScene, to: OpaquePointer.self))
        }
#else
        if let swiftObject = unsafe reScene.swiftObject {
            scene = unsafe unsafeBitCast(swiftObject, to: AnyObject.self) as! MyRealityFoundation::Scene
        } else {
            scene = unsafe MyRealityFoundation::Scene(coreScene: unsafeBitCast(reScene, to: OpaquePointer.self))
        }
#endif
        
        return scene
    }
    
    @MainActor @preconcurrency public var name: String {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __boundingBox: __AABBRef {
        get {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func __findAssetDependencies(_ closure: (__AssetRef) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var isActive: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isAnchored: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isEnabled: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var isEnabledInHierarchy: Bool {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static var __disableUpdateInteractionEntities: [Entity]?
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency open var __accessibilityElements: [Any]? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency required public init() {
        let entity = CoreRE.Entity()
        unsafe self.coreEntity = unsafeBitCast(entity, to: OpaquePointer.self)
        
#if RealityKitCompatibility
        entity.myRealityKitRef = self
#else
        unsafe entity.swiftObject = Unmanaged.passUnretained(self).toOpaque()
#endif
        
        unsafe __RERelease(self.coreEntity)
        
        // <+44>
        for setup in baseTraitSetups {
            setup(self)
        }
        
        // <+140>
        unsafe unsafeBitCast(self.coreEntity, to: CoreRE.Entity.self)
            .getOrAddComponent(ofType: CoreRE::ComponentType.network)
        
        self.components.set(__EntityInfoComponent(entity: self))
    }
    
    @usableFromInline
    @MainActor @preconcurrency internal init(_coreEntity: __EntityRef) {
        unsafe self.coreEntity = _coreEntity.core
        
#if RealityKitCompatibility
        unsafe unsafeBitCast(_coreEntity.core, to: CoreRE.Entity.self)
            .myRealityKitRef = self
#else
        unsafe unsafeBitCast(_coreEntity.core, to: CoreRE.Entity.self)
            .swiftObject = Unmanaged.passUnretained(self).toOpaque()
#endif
    }
    
    deinit {
#if RealityKitCompatibility
        unsafe unsafeBitCast(self.coreEntity, to: CoreRE.Entity.self)
            .myRealityKitRef = nil
#else
        unsafe unsafeBitCast(self.coreEntity, to: CoreRE.Entity.self)
            .swiftObject = nil
#endif
    }
    
    @MainActor @preconcurrency public static func __testInit() -> Entity {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency open func didClone(from source: Entity) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func findEntity(named name: String) -> Entity? {
        assertUnimplemented()
    }
    
    package internal(set) nonisolated(unsafe) var coreEntity: OpaquePointer
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity : Hashable {
    nonisolated public func hash(into hasher: inout Hasher) {
        unsafe hasher.combine(self.coreEntity)
    }
    
    nonisolated public static func == (lhs: Entity, rhs: Entity) -> Bool {
        return unsafe lhs.coreEntity == rhs.coreEntity
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity : Identifiable {
    nonisolated public var id: UInt64 {
        get {
            assertUnimplemented()
        }
    }
    
    @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
    public typealias ID = UInt64
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public func clone(recursive: Bool) -> Self {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __clone(recursive: Bool, remapInteractionIdentifiers: Bool) -> Self {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity : EventSource {
}

extension Entity {
    @available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
    public enum ForwardDirection {
        case negativeZ
        case positiveZ
        
        public static func == (a: Entity.ForwardDirection, b: Entity.ForwardDirection) -> Bool {
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

@available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var isAccessibilityElement: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, deprecated: 1.0, renamed: "accessibilityLabelKey")
    @available(macOS, deprecated: 14.0, renamed: "accessibilityLabelKey")
    @available(macCatalyst, deprecated: 17.0, renamed: "accessibilityLabelKey")
    @available(iOS, deprecated: 17.0, renamed: "accessibilityLabelKey")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var accessibilityLabel: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(visionOS, deprecated: 1.0, renamed: "accessibilityCustomContent")
    @available(macOS, deprecated: 14.0, renamed: "accessibilityCustomContent")
    @available(macCatalyst, deprecated: 17.0, renamed: "accessibilityCustomContent")
    @available(iOS, deprecated: 17.0, renamed: "accessibilityCustomContent")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public var accessibilityDescription: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15.4, iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var __isAccessibilityRoot: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __isAccessibilityEnabled: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var __accessibilityIdentifier: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __accessibilityLabel: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __accessibilityDescription: String? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var __accessibilityCustomContent: [(String, String, UInt)] {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(named name: String, in bundle: Bundle? = nil) throws -> Entity {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "init(named:in:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "init(named:in:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "init(named:in:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(named:in:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<Entity> {
        assertUnimplemented()
    }
    
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func load(contentsOf url: URL, withName resourceName: String? = nil) throws -> Entity {
        assertUnimplemented()
    }
    
    public struct __LoadOptions {
        public var downsamplingStrategy: (any __DownsamplingStrategy)?
        
        public var realityPerformanceReport: __REArchivalStats?
        
        public var generateDecimatedMesh: Bool
        
        public var enforceMemoryConstraints: Bool
        
        public var memoryLimit: Int?
        
        public struct LoadableFeatures : OptionSet, Sendable {
            public let rawValue: UInt32
            
            public static let none: Entity.__LoadOptions.LoadableFeatures = {
                assertUnimplemented()
            }()
            
            public static let audio: Entity.__LoadOptions.LoadableFeatures = {
                assertUnimplemented()
            }()
            
            public init(rawValue: UInt32) {
                assertUnimplemented()
            }
            
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
            public typealias ArrayLiteralElement = Entity.__LoadOptions.LoadableFeatures
            
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
            public typealias Element = Entity.__LoadOptions.LoadableFeatures
            
            @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
            public typealias RawValue = UInt32
        }
        
        public var featuresToSkip: Entity.__LoadOptions.LoadableFeatures
        
        public init(downsamplingStrategy: (any __DownsamplingStrategy)? = nil, realityPerformanceReport: __REArchivalStats? = nil) {
            assertUnimplemented()
        }
    }
    
    public struct __AsyncLoadOptions {
        @available(*, deprecated, renamed: "resourceSharingScheduling", message: "Use enum-based API instead")
        public var loadOnResourceSharingClients: Bool {
            get {
                assertUnimplemented()
            }
            set(value) {
                assertUnimplemented()
            }
        }
        
        @available(*, deprecated, renamed: "resourceSharingScheduling", message: "Use enum-based API instead")
        public var waitForResourceSharingClients: Bool {
            get {
                assertUnimplemented()
            }
            set(value) {
                assertUnimplemented()
            }
        }
        
        public var resourceSharingScheduling: __AssetLoadRequest.ResourceSharingSchedulingRequirement
        
        public init(loadOnResourceSharingClients: Bool = false, waitForResourceSharingClients: Bool = false) throws {
            assertUnimplemented()
        }
        
        @available(*, deprecated, renamed: "init(resourceSharingScheduling:)", message: "Use enum-based API instead")
        public init(preloadAndWaitForResourceSharingClients: Bool) {
            assertUnimplemented()
        }
        
        public init(resourceSharingScheduling: __AssetLoadRequest.ResourceSharingSchedulingRequirement) {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func __load(contentsOf url: URL, withName resourceName: String?, loadOptions: Entity.__LoadOptions) throws -> Entity {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "init(contentsOf:withName:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "init(contentsOf:withName:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "init(contentsOf:withName:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "init(contentsOf:withName:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAsync(contentsOf url: URL, withName resourceName: String? = nil) -> LoadRequest<Entity> {
        assertUnimplemented()
    }
    
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func loadAnchor(named name: String, in bundle: Bundle? = nil) throws -> AnchorEntity {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "AnchorEntity.init(named:in:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "AnchorEntity.init(named:in:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "AnchorEntity.init(named:in:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "AnchorEntity.init(named:in:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAnchorAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<AnchorEntity> {
        assertUnimplemented()
    }
    
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func loadAnchor(contentsOf url: URL, withName resourceName: String? = nil) throws -> AnchorEntity {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __loadAnchor(contentsOf url: URL, withName resourceName: String? = nil, downsamplingStrategy: (any __DownsamplingStrategy)?) throws -> AnchorEntity {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "AnchorEntity.init(contentsOf:withName:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "AnchorEntity.init(contentsOf:withName:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "AnchorEntity.init(contentsOf:withName:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "AnchorEntity.init(contentsOf:withName:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadAnchorAsync(contentsOf url: URL, withName resourceName: String? = nil) -> LoadRequest<AnchorEntity> {
        assertUnimplemented()
    }
}

@available(iOS 13.0, macCatalyst 13.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable, introduced: 26.0)
extension Entity {
    @available(macOS, unavailable, introduced: 26.0)
    @available(visionOS, unavailable, introduced: 1.0)
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func loadBodyTracked(named name: String, in bundle: Bundle? = nil) throws -> BodyTrackedEntity {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable, introduced: 26.0)
    @available(visionOS, unavailable, introduced: 1.0)
    @available(tvOS, unavailable)
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "BodyTrackedEntity.init(named:in:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "BodyTrackedEntity.init(named:in:)")
    @MainActor @preconcurrency public static func loadBodyTrackedAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<BodyTrackedEntity> {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable, introduced: 26.0)
    @available(visionOS, unavailable, introduced: 1.0)
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func loadBodyTracked(contentsOf url: URL, withName resourceName: String? = nil) throws -> BodyTrackedEntity {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable, introduced: 26.0)
    @available(visionOS, unavailable, introduced: 1.0)
    @available(tvOS, unavailable)
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "BodyTrackedEntity.init(contentsOf:withName:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "BodyTrackedEntity.init(contentsOf:withName:)")
    @MainActor @preconcurrency public static func loadBodyTrackedAsync(contentsOf url: URL, withName resourceName: String? = nil) -> LoadRequest<BodyTrackedEntity> {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, visionOS 1.0, tvOS 26.0, *)
extension Entity {
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func loadModel(named name: String, in bundle: Bundle? = nil) throws -> ModelEntity {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "ModelEntity.init(named:in:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "ModelEntity.init(named:in:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "ModelEntity.init(named:in:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "ModelEntity.init(named:in:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadModelAsync(named name: String, in bundle: Bundle? = nil) -> LoadRequest<ModelEntity> {
        assertUnimplemented()
    }
    
    @available(*, noasync, message: "Synchronous Entity loading APIs block the main actor and should not be used in async contexts.  Use init(...) async instead")
    @MainActor @preconcurrency public static func loadModel(contentsOf url: URL, withName resourceName: String? = nil) throws -> ModelEntity {
        assertUnimplemented()
    }
    
    @available(macOS, introduced: 10.15, deprecated: 15.0, renamed: "ModelEntity.init(contentsOf:withName:)")
    @available(iOS, introduced: 13.0, deprecated: 18.0, renamed: "ModelEntity.init(contentsOf:withName:)")
    @available(macCatalyst, introduced: 13.0, deprecated: 18.0, renamed: "ModelEntity.init(contentsOf:withName:)")
    @available(visionOS, introduced: 1.0, deprecated: 1.0, renamed: "ModelEntity.init(contentsOf:withName:)")
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public static func loadModelAsync(contentsOf url: URL, withName resourceName: String? = nil) -> LoadRequest<ModelEntity> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static func __remapIdentifiersAndInteractions(root: Entity) {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency convenience public init(named name: String, in bundle: Bundle? = nil) async throws {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency convenience public init(contentsOf url: URL, withName resourceName: String? = nil) async throws {
        assertUnimplemented()
    }
}

@available(macCatalyst 26.0, visionOS 26.0, iOS 26.0, macOS 26.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency convenience public init(from data: Data, named name: String? = nil) async throws {
        assertUnimplemented()
    }
}

extension Entity {
    @available(macOS 15.0, macCatalyst 18.0, iOS 18.0, visionOS 2.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func applyTapForBehaviors() -> Bool {
        assertUnimplemented()
    }
}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var ambientAudio: AmbientAudioComponent? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 10.15, iOS 13.0, macCatalyst 13.0, *)
extension Entity {
    @_alwaysEmitIntoClient @inline(__always) @MainActor @preconcurrency convenience public init<each T>(components: repeat each T) where repeat each T : Component {
                self.init()
                repeat self.components.set(each components)
        }
    
    @_alwaysEmitIntoClient @inline(__always) @MainActor @preconcurrency convenience public init(components: [any Component]) {
                self.init()
                self.components.set(components)
        }
}

@available(visionOS 2.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity {
    @MainActor public func write(to url: URL) async throws {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity {
    @available(macOS, deprecated, introduced: 10.15, message: "Use playAnimation functions that take an AnimationResource instead of a name.")
    @available(iOS, deprecated, introduced: 13.0, message: "Use playAnimation functions that take an AnimationResource instead of a name.")
    @available(macCatalyst, deprecated, introduced: 13.0, message: "Use playAnimation functions that take an AnimationResource instead of a name.")
    @available(visionOS, deprecated, introduced: 1.0, message: "Use playAnimation functions that take an AnimationResource instead of a name.")
    @available(tvOS, unavailable, introduced: 26.0)
    @discardableResult
    @MainActor @preconcurrency public func playAnimation(named animationName: String, transitionDuration: TimeInterval = 0, startsPaused: Bool = false, recursive: Bool = true) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @discardableResult
    @MainActor @preconcurrency public func playAnimation(_ animation: AnimationResource, transitionDuration: TimeInterval, startsPaused: Bool) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func stopAllAnimations(recursive: Bool = true) {
        assertUnimplemented()
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension Entity {
    @discardableResult
    @MainActor @preconcurrency public func playAnimation(_ animation: AnimationResource, transitionDuration: TimeInterval = 0, blendLayerOffset: Int = 0, separateAnimatedValue: Bool = false, startsPaused: Bool = false, clock: CMClockOrTimebase? = nil) -> AnimationPlaybackController {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var defaultAnimationClock: CMClockOrTimebase {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS 1.0, macOS 15.0, macCatalyst 18.0, iOS 18.0, tvOS 26.0, *)
extension Entity {
    @discardableResult
    @MainActor @preconcurrency public func playAnimation(_ animation: AnimationResource, transitionDuration: TimeInterval = 0, blendLayerOffset: Int = 0, separateAnimatedValue: Bool = false, startsPaused: Bool = false, clock: CMClockOrTimebase? = nil, handoffType: AnimationHandoffType = .default) -> AnimationPlaybackController {
        assertUnimplemented()
    }
}

@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
extension Entity {
    @MainActor @preconcurrency public var pins: EntityGeometricPins {
        get {
            assertUnimplemented()
        }
    }
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable, introduced: 26.0)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension Entity : @MainActor CoordinateSpace3DFloat {
    public typealias AncestorCoordinateSpace = Scene
    
    @available(macOS, unavailable, introduced: 26.0)
    @MainActor @preconcurrency public func ancestorFromSpaceTransformFloat() throws -> ProjectiveTransform3DFloat {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var ancestorSpace: Entity.AncestorCoordinateSpace? {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func transform(from targetCoordinateSpace: Entity) throws -> ProjectiveTransform3D {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension Entity.ChildCollection : Sendable {}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Entity.CoordinateSpaceReference : Equatable {}

@available(visionOS 2.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Entity.CoordinateSpaceReference : Hashable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity.ForwardDirection : Equatable {}

@available(visionOS 1.0, macOS 15.0, iOS 18.0, macCatalyst 18.0, tvOS 26.0, *)
extension Entity.ForwardDirection : Hashable {}

fileprivate struct SetupPair<T, U : DefaultInitializable> {
    init(_: T.Type, _: U.Type) {
    }
    
    @_transparent // 원래 없음
    @MainActor func setup(entity: MyRealityFoundation::Entity) {
        guard entity is T else {
            return
        }
        
        entity.components.set(U())
    }
}

fileprivate let baseTraitSetups: [@MainActor (MyRealityFoundation::Entity) -> Void] = [
    { entity in
        SetupPair(HasAnchoring.self, AnchoringComponent.self)
            .setup(entity: entity)
    },
    
    { entity in
        SetupPair(HasTransform.self, Transform.self)
            .setup(entity: entity)
    },
    
    { entity in
        SetupPair(HasSynchronization.self, SynchronizationComponent.self)
            .setup(entity: entity)
    },
    
    { entity in
        SetupPair(HasPerspectiveCamera.self, PerspectiveCameraComponent.self)
            .setup(entity: entity)
    },
    
    { entity in
        SetupPair(HasSpotLight.self, SpotLightComponent.self)
            .setup(entity: entity)
    },
    
    { entity in
        SetupPair(HasDirectionalLight.self, DirectionalLightComponent.self)
            .setup(entity: entity)
    },
    
    { entity in
        SetupPair(HasPointLight.self, PointLightComponent.self)
            .setup(entity: entity)
    },
]

extension Entity {
    func updateSceneGravityIfNeeded() {
        assertUnimplemented()
    }
}
