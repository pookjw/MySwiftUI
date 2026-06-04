public import CoreGraphics
public import Foundation
public import Metal
public import UIKit
public import simd

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct PostProcessContext {
        public init(_ device: any MTLDevice, _ commandBuffer: any MTLCommandBuffer, _ sourceColorTexture: any MTLTexture, _ sourceDepthTexture: any MTLTexture, _ targetColorTexture: any MTLTexture, _ projection: float4x4, _ time: TimeInterval) {
            assertUnimplemented()
        }
        
        public var device: any MTLDevice
        
        public var commandBuffer: any MTLCommandBuffer
        
        public var sourceColorTexture: any MTLTexture
        
        public var sourceDepthTexture: any MTLTexture
        
        public var targetColorTexture: any MTLTexture
        
        public var projection: float4x4
        
        public var time: TimeInterval
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public struct RenderCallbacks {
        public var prepareWithDevice: ((any MTLDevice) -> Void)?
        
        public var postProcess: ((ARView.PostProcessContext) -> Void)?
        
        public init() {
            assertUnimplemented()
        }
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    @MainActor @preconcurrency public var renderCallbacks: ARView.RenderCallbacks {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(visionOS, unavailable)
extension ARView {
    @MainActor @preconcurrency @objc override dynamic open func didMoveToWindow() {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView {
    public struct Environment {
        public typealias Color = UIColor
        
        public struct Background {
            @available(macCatalyst 14.0, *)
            @available(macOS, unavailable)
            @available(tvOS, unavailable)
            public static func cameraFeed(exposureCompensation: Float = 0.0) -> ARView.Environment.Background {
                assertUnimplemented()
            }
            
            public static func skybox(_ resource: EnvironmentResource) -> ARView.Environment.Background {
                assertUnimplemented()
            }
            
            public static func color(_ color: ARView.Environment.Color) -> ARView.Environment.Background {
                assertUnimplemented()
            }
        }
        
        public struct ImageBasedLight {
            public var resource: EnvironmentResource?
            
            public var intensityExponent: Float
        }
        
        public enum Reverb {
            public enum Preset {
                case smallRoom
                case mediumRoom
                case largeRoom
                case mediumHall
                case largeHall
                case cathedral
                
                public static func == (a: ARView.Environment.Reverb.Preset, b: ARView.Environment.Reverb.Preset) -> Bool {
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
            case noReverb
            case preset(ARView.Environment.Reverb.Preset)
            
            public static var automatic: ARView.Environment.Reverb {
                get {
                    assertUnimplemented()
                }
            }
        }
        
        @available(iOS 13.4, macCatalyst 14.0, *)
        @available(macOS, unavailable)
        @available(tvOS, unavailable)
        public struct SceneUnderstanding {
            public struct Options : OptionSet {
                public let rawValue: UInt32
                
                @safe public static nonisolated(unsafe) let occlusion: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                @safe public static nonisolated(unsafe) let receivesLighting: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                @safe public static nonisolated(unsafe) let collision: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                @safe public static nonisolated(unsafe) let physics: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                @safe public static nonisolated(unsafe) let __disableFeathering: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                @safe public static nonisolated(unsafe) let __disableGuidedFilterOcclusions: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                @safe public static nonisolated(unsafe) let `default`: ARView.Environment.SceneUnderstanding.Options = {
                    assertUnimplemented()
                }()
                
                public init(rawValue: UInt32) {
                    assertUnimplemented()
                }
                
                @available(iOS 13.4, macCatalyst 14.0, *)
                @available(tvOS, unavailable, introduced: 26.0)
                @available(macOS, unavailable, introduced: 10.15)
                public typealias ArrayLiteralElement = ARView.Environment.SceneUnderstanding.Options
                
                @available(iOS 13.4, macCatalyst 14.0, *)
                @available(tvOS, unavailable, introduced: 26.0)
                @available(macOS, unavailable, introduced: 10.15)
                public typealias Element = ARView.Environment.SceneUnderstanding.Options
                
                @available(iOS 13.4, macCatalyst 14.0, *)
                @available(tvOS, unavailable, introduced: 26.0)
                @available(macOS, unavailable, introduced: 10.15)
                public typealias RawValue = UInt32
            }
            
            public struct __InternalSettings {
                public var guidedFilterOcclusionUseSingleMTLEvent: Bool
            }
            
            public var __internalSettings: ARView.Environment.SceneUnderstanding.__InternalSettings {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
            
            public var options: ARView.Environment.SceneUnderstanding.Options {
                get {
                    assertUnimplemented()
                }
                set {
                    assertUnimplemented()
                }
            }
        }
        
        @available(iOS 13.4, macCatalyst 14.0, *)
        public var sceneUnderstanding: ARView.Environment.SceneUnderstanding {
            mutating get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        
        public var background: ARView.Environment.Background
        
        public var lighting: ARView.Environment.ImageBasedLight
        
        public var reverb: ARView.Environment.Reverb
        
        public init(background: ARView.Environment.Background, lighting: ARView.Environment.ImageBasedLight, reverb: ARView.Environment.Reverb) {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView.Environment.Reverb : Equatable, Hashable {
    public static func == (a: ARView.Environment.Reverb, b: ARView.Environment.Reverb) -> Bool {
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

@available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView.Environment.Reverb.Preset : CaseIterable {
    @available(iOS 16.0, tvOS 26.0, macOS 13.0, macCatalyst 16.0, *)
    @available(visionOS, unavailable)
    public typealias AllCases = [ARView.Environment.Reverb.Preset]
    
    nonisolated public static var allCases: [ARView.Environment.Reverb.Preset] {
        get {
            assertUnimplemented()
        }
    }
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ARView {
    public struct RenderOptions : OptionSet {
        @safe public static nonisolated(unsafe) let disableCameraGrain: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @available(macOS, deprecated, introduced: 10.15, renamed: "disableAREnvironmentLighting")
        @available(iOS, deprecated, introduced: 13.0, renamed: "disableAREnvironmentLighting")
        @available(macCatalyst, deprecated, introduced: 14.0, renamed: "disableAREnvironmentLighting")
        @available(visionOS, unavailable)
        @available(tvOS, unavailable, renamed: "disableAREnvironmentLighting")
        @safe public static nonisolated(unsafe) let disableAutomaticLighting: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disableGroundingShadows: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disableMotionBlur: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disableDepthOfField: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disableHDR: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @available(macOS, deprecated, introduced: 10.15, renamed: "disableFaceMesh")
        @available(iOS, deprecated, introduced: 13.0, renamed: "disableFaceMesh")
        @available(macCatalyst, deprecated, introduced: 14.0, renamed: "disableFaceMesh")
        @available(visionOS, unavailable)
        @available(tvOS, unavailable, renamed: "disableFaceMesh")
        @safe public static nonisolated(unsafe) let disableFaceOcclusions: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disablePersonOcclusion: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disableAREnvironmentLighting: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let __disableLocalizedProbes: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let disableFaceMesh: ARView.RenderOptions = {
            assertUnimplemented()
        }()
        
        public let rawValue: UInt
        
        public init(rawValue: UInt) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, macCatalyst 14.0, *)
        @available(tvOS, unavailable, introduced: 26.0)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 10.15)
        public typealias ArrayLiteralElement = ARView.RenderOptions
        
        @available(iOS 13.0, macCatalyst 14.0, *)
        @available(tvOS, unavailable, introduced: 26.0)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 10.15)
        public typealias Element = ARView.RenderOptions
        
        @available(iOS 13.0, macCatalyst 14.0, *)
        @available(tvOS, unavailable, introduced: 26.0)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 10.15)
        public typealias RawValue = UInt
    }
    
    @MainActor @preconcurrency public var renderOptions: ARView.RenderOptions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(*, deprecated, message: "Use RenderOptions instead")
    public enum __RenderQuality {
        case tier1
        case tier2
        case tier3
        case tier4
        case fastest
        case standard
        case high
        case best
        
        public static func == (a: ARView.__RenderQuality, b: ARView.__RenderQuality) -> Bool {
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
    
    @MainActor @preconcurrency public var __renderQuality: ARView.__RenderQuality {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView {
    @MainActor @preconcurrency public func project(_ point: SIMD3<Float>) -> CGPoint? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func unproject(_ point: CGPoint, viewport: CGRect) -> SIMD3<Float>? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func unproject(_ point: CGPoint, ontoPlane planeTransform: float4x4) -> SIMD3<Float>? {
        assertUnimplemented()
    }
    
    @available(macOS 11.0, iOS 14.0, macCatalyst 14.0, tvOS 26.0, *)
    @MainActor @preconcurrency public func unproject(_ point: CGPoint, ontoPlane planeTransform: float4x4, relativeToCamera: Bool) -> SIMD3<Float>? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func ray(through screenPoint: CGPoint) -> (origin: SIMD3<Float>, direction: SIMD3<Float>)? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func hitTest(_ point: CGPoint, query: CollisionCastQueryType = .all, mask: CollisionGroup = .all) -> [CollisionCastHit] {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func entity(at point: CGPoint) -> Entity? {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func entities(at point: CGPoint) -> [Entity] {
        assertUnimplemented()
    }
}

@objc @_inheritsConvenienceInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
@MainActor @preconcurrency open class ARView : ARViewBase {
    @MainActor @preconcurrency public var __services: __ServiceLocator {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var scene: Scene {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency weak public var __delegatePrivate: (any __ARViewDelegatePrivate)?
    @MainActor @preconcurrency public var __automaticallyInvokesStartTrigger: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macCatalyst 14.0, *)
    @MainActor @preconcurrency public var debugOptions: ARView.DebugOptions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var environment: ARView.Environment {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var cameraTransform: Transform {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var audioListener: Entity? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __environmentEntity: Entity!
    @MainActor @preconcurrency public var __enableAutomaticFrameRate: Bool
    @MainActor @preconcurrency public var __preferredFrameRate: Float
    @MainActor @preconcurrency @objc required dynamic public init?(coder decoder: NSCoder) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc required override dynamic public init(frame frameRect: CGRect) {
        assertUnimplemented()
    }
    
    @available(macOS, unavailable)
    @available(iOS, deprecated, introduced: 13.0, renamed: "init(frame:cameraMode:automaticallyConfigureSession:)")
    @available(macCatalyst, deprecated, introduced: 14.0, renamed: "init(frame:cameraMode:automaticallyConfigureSession:)")
    @available(visionOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency convenience public init(frame frameRect: CGRect, cameraMode: ARView.CameraMode) {
        assertUnimplemented()
    }
    
    @available(macCatalyst 14.0, *)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @MainActor @preconcurrency public init(frame frameRect: CGRect, cameraMode: ARView.CameraMode, automaticallyConfigureSession: Bool) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __setWireframeMode(displayWireframe: Bool) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __forceLocalizedProbes: Bool
    @MainActor @preconcurrency public var __parallaxBackgroundProbe: Bool
    @MainActor @preconcurrency public var __targetIdentifier: UInt {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency open func __didInitializeEngine() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __interfaceOrientation: UIInterfaceOrientation {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public static func __queryModelIdentifier() -> String {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public static var __nonARKitModelIdentifiers: [String] {
        get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var __disableCounterRotation: Bool
    @MainActor @preconcurrency public var __disableComposition: Bool
    @available(*, deprecated, message: "Differential Rendering is no longer supported.")
    @MainActor @preconcurrency public var __differentialRendering: Bool
    @MainActor @preconcurrency public var __nonARKitDevices: Bool
    @MainActor @preconcurrency public func __handleTapAtPoint(point: CGPoint) {
        assertUnimplemented()
    }
    
    public struct DebugOptions : OptionSet {
        public let rawValue: Int = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let none: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let showPhysics: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let showStatistics: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let showWorldOrigin: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let showAnchorOrigins: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let showAnchorGeometry: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let showFeaturePoints: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        @available(iOS 13.4, macCatalyst 13.4, tvOS 26.0, *)
        @safe public static nonisolated(unsafe) let showSceneUnderstanding: ARView.DebugOptions = {
            assertUnimplemented()
        }()
        
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(visionOS, unavailable)
        public typealias ArrayLiteralElement = ARView.DebugOptions
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(visionOS, unavailable)
        public typealias Element = ARView.DebugOptions
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(visionOS, unavailable)
        public typealias RawValue = Int
    }
    
    @MainActor @preconcurrency public var __statisticsOptions: ARView.__StatisticsOptions {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func __frameProfilerAddCustomStatistic(_ statName: String, _ statValue: Float) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public var __disableStatisticsRendering: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func __getStatisticsStringForSingleOption(statisticOption: ARView.__StatisticsOptions) -> String {
        assertUnimplemented()
    }
    
    public struct __StatisticsOptions : OptionSet {
        public let rawValue: UInt32 = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let frameTimeStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let animationStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let assetPipelineStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let audioStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ecsStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let meshStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let networkStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let physicsStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let renderingStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let memoryStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let thermalStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let sceneUnderstandingStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let mtlCounterAPIStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let customStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let attributionStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let caStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let cgStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let vfxStatistics: ARView.__StatisticsOptions = {
            assertUnimplemented()
        }()
        
        public init(rawValue: UInt32) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(visionOS, unavailable)
        public typealias ArrayLiteralElement = ARView.__StatisticsOptions
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(visionOS, unavailable)
        public typealias Element = ARView.__StatisticsOptions
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        @available(visionOS, unavailable)
        public typealias RawValue = UInt32
    }
    
    @MainActor @preconcurrency public func __setProfilerUpdateInterval(newInterval: Float) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __frameTime() -> Float {
        assertUnimplemented()
    }
    
    public typealias Image = UIImage
    
    @MainActor @preconcurrency public func snapshot(saveToHDR: Bool, completion: @escaping (_ image: ARView.Image?) -> Void) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __startAudioEngine() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __stopAudioEngine() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __distanceInMetersFromEntity(_ entity: Entity) -> Float {
        assertUnimplemented()
    }
}

@available(iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable)
extension ARView {
    @MainActor @preconcurrency @objc override dynamic open class var layerClass: AnyClass {
        @objc get {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency @objc override dynamic open var contentScaleFactor: CGFloat {
        @objc get {
            assertUnimplemented()
        }
        @objc set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public func __enablePauseEngineOnLeaveForeground() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func __disablePauseEngineOnLeaveForeground() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func didMoveToSuperview() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func layoutSubviews() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc override dynamic open func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable, introduced: 1.0, message: "ARView is not available on visionOS, use RealityView.")
extension ARView {
    @MainActor @preconcurrency public var physicsOrigin: Entity? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ARView {
    public enum CameraMode {
        case ar
        case nonAR
        
        public static func == (a: ARView.CameraMode, b: ARView.CameraMode) -> Bool {
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
    
    @MainActor @preconcurrency public var cameraMode: ARView.CameraMode {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @MainActor @preconcurrency public var automaticallyConfigureSession: Bool {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
extension ARView : UIGestureRecognizerDelegate {
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable)
@available(tvOS, unavailable)
extension ARView {
    public struct EntityGestures : OptionSet {
        public let rawValue: Int
        
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        @safe public static nonisolated(unsafe) let translation: ARView.EntityGestures = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let rotation: ARView.EntityGestures = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let scale: ARView.EntityGestures = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let all: ARView.EntityGestures = {
            assertUnimplemented()
        }()
        
        @available(iOS 13.0, macCatalyst 14.0, *)
        @available(tvOS, unavailable, introduced: 26.0)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 10.15)
        public typealias ArrayLiteralElement = ARView.EntityGestures
        
        @available(iOS 13.0, macCatalyst 14.0, *)
        @available(tvOS, unavailable, introduced: 26.0)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 10.15)
        public typealias Element = ARView.EntityGestures
        
        @available(iOS 13.0, macCatalyst 14.0, *)
        @available(tvOS, unavailable, introduced: 26.0)
        @available(visionOS, unavailable)
        @available(macOS, unavailable, introduced: 10.15)
        public typealias RawValue = Int
    }
}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable)
extension ARView {
    @available(visionOS, deprecated)
    @discardableResult
    @MainActor @preconcurrency public func installGestures(_ gestures: ARView.EntityGestures = .all, for entity: any HasCollision) -> [any EntityGestureRecognizer] {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc dynamic public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency @objc dynamic public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView.Environment.Reverb.Preset : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension ARView.Environment.Reverb.Preset : Hashable {}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(*, deprecated, message: "Use RenderOptions instead")
extension ARView.__RenderQuality : Equatable {}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
@available(*, deprecated, message: "Use RenderOptions instead")
extension ARView.__RenderQuality : Hashable {}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ARView.CameraMode : Equatable {}

@available(iOS 13.0, macCatalyst 14.0, *)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(visionOS, unavailable)
extension ARView.CameraMode : Hashable {}
