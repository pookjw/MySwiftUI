#warning("TODO")
internal import CoreGraphics
private import _MySwiftUIShims
private import _QuartzCorePrivate

package struct DisplayList {
    package var items: [Item] = []
    package var features = DisplayList.Features(rawValue: 0)
    package var properties = DisplayList.Properties(rawValue: 0)
    
    package init() {
    }
}

extension DisplayList {
    package struct Item {
        var frame: CGRect
        var version: DisplayList.Version
        var value: Item.Value
        var identity: _DisplayList_Identity
    }
    
    struct Seed: Hashable {
        private(set) var value: UInt16
        
        init() {
            value = 0
        }
        
        init(decodedValue: UInt16) {
            value = decodedValue
        }
        
        init(_ version: DisplayList.Version) {
            var w9 = version.value
            if w9 == 0 {
                value = 0
            } else {
                var w10 = (w9 &>> 0x10)
                w10 = (w10 &+ (w10 &<< 5))
                w9 = (w10 ^ w9)
                w10 = 1
                w9 = (w10 | (w9 &<< 1))
                value = UInt16(w9)
            }
        }
        
        mutating func invalidate() {
            guard value != 0 else {
                return
            }
            value = (~value | 1)
        }
        
        static var undefined: DisplayList.Seed {
            return DisplayList.Seed(decodedValue: 2)
        }
    }
}

extension DisplayList.Item {
    package enum Value {
        
    }
}

extension DisplayList {
    package struct Features: OptionSet {
        package static var required: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 0) }
        package static var animations: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 2) }
        package static var dynamicContent: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 3) }
        package static var interpolatorLayers: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 4) }
        package static var interpolatorRoots: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 5) }
        package static var stateEffects: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 6) }
        package static var states: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 7) }
        package static var entities: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 8) }
        package static var flattened: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 9) }
        package static var platformViews: DisplayList.Features { return DisplayList.Features(rawValue: 1 << 10) }
        
        package let rawValue: UInt16
        
        package init(rawValue: UInt16) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList {
    package struct Properties: OptionSet {
        package static var foregroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 0) }
        package static var ignoresEvents: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 1) }
        package static var privacySensitive: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 2) }
        package static var archivesInteractiveControls: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 3) }
        package static var secondaryForegroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 4) }
        package static var tertiaryForegroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 5) }
        package static var quaternaryForegroundLayer: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 6) }
        package static var screencaptureProhibited: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 7) }
        package static var hiddenForReuse: DisplayList.Properties { return DisplayList.Properties(rawValue: 1 << 8) }
        
        
        package let rawValue: UInt32
        
        package init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
    }
}

extension DisplayList {
    package struct Version: Comparable, Hashable {
        private static nonisolated(unsafe) var lastValue: Int = 0
        
        package static func < (lhs: DisplayList.Version, rhs: DisplayList.Version) -> Bool {
            return lhs.value < rhs.value
        }
        
        package private(set) var value: Int
        
        package init() {
            self.value = 0
        }
        
        package init(decodedValue: Int) {
            unsafe DisplayList.Version.lastValue = max(unsafe DisplayList.Version.lastValue, decodedValue)
            self.value = decodedValue
        }
        
        package init(forUpdate: Void) {
            let value = unsafe DisplayList.Version.lastValue + 1
            unsafe DisplayList.Version.lastValue = value
            self.value = value
        }
        
        package mutating func combine(with other: DisplayList.Version) {
            self.value = max(other.value, self.value)
        }
    }
}

extension DisplayList {
    final class ViewUpdater: ViewRendererBase {
        let rootPlatform: DisplayList.ViewUpdater.Platform
        private weak var host: ViewRendererHost? = nil
        private var viewCache: DisplayList.ViewUpdater.ViewCache
        private var seed = DisplayList.Seed()
        private var asyncSeed = DisplayList.Seed()
        private var nextUpdate = Time()
        private var lastEnv = DisplayList.ViewRenderer.Environment.invalid
        private var lastList = DisplayList()
        private var lastTime = Time()
        private var isValid = true
        private var wasValid = true
        
        init(rootPlatform: DisplayList.ViewUpdater.Platform, host: (any ViewRendererHost)?) {
            self.rootPlatform = rootPlatform
            self.host = host
            self.viewCache = DisplayList.ViewUpdater.ViewCache()
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time {
            /*
             self = x19
             rootView = x22
             return pointer = x25
             displayList = x23
             time = d8
             version = x24
             maxVersion = x28
             */
            if lastEnv != environment {
                lastEnv = environment
                isValid = false
                viewCache.invalidateAll()
                seed = DisplayList.Seed()
            }
            
            /*
             true = <+208>
             false = <+220>
             */
            let flag: Bool
            if isValid {
                let seed = seed
                if version.value != 0 {
                    // <+172>
                    if seed == DisplayList.Seed(version) {
                        // <+208>
                        flag = true
                    } else {
                        // <+220>
                        flag = false
                    }
                } else {
                    // <+204>
                    if seed.value == 0 {
                        // <+208>
                        flag = true
                    } else {
                        // <+220>
                        flag = false
                    }
                }
            } else {
                // <+220>
                flag = false
            }
            
            if flag {
                // <+208>
                if nextUpdate >= time {
                    return nextUpdate
                }
            }
            
            // <+220>
            fatalError("TODO")
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
    }
    
    fileprivate final class ViewRasterizer: ViewRendererBase {
        let rootPlatform: DisplayList.ViewUpdater.Platform // 0x10
        private weak var host: ViewRendererHost? // 0x18
        private var drawingView: AnyObject? // 0x20
        var options: _RendererConfiguration.RasterizationOptions // 0x30
        private let renderer: DisplayList.GraphicsRenderer // 0x48
        private var seed = DisplayList.Seed() // 0x50
        private var lastContentsScale: CGFloat = 0 // 0x58
        
        // 원래 없음
        @inlinable
        init(
            rootPlatform: DisplayList.ViewUpdater.Platform,
            host: ViewRendererHost?,
            drawingView: AnyObject?,
            rasterizationOptions: _RendererConfiguration.RasterizationOptions
        ) {
            self.rootPlatform = rootPlatform
            self.host = host
            self.drawingView = drawingView
            self.options = rasterizationOptions
            
            let platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode
            if rasterizationOptions.drawsPlatformViews {
                platformViewMode = .rendered(update: true)
            } else {
                platformViewMode = .unsupported
            }
            self.renderer = DisplayList.GraphicsRenderer(platformViewMode: platformViewMode)
        }
        
        // 원래 없음
        @inlinable
        func update(rasterizationOptions: _RendererConfiguration.RasterizationOptions, host: ViewRendererHost?) {
            self.options = rasterizationOptions
            
            let platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode
            if rasterizationOptions.drawsPlatformViews {
                platformViewMode = .rendered(update: true)
            } else {
                platformViewMode = .unsupported
            }
            self.renderer.platformViewMode = platformViewMode
            
            self.host = host
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time {
            fatalError("TODO")
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
    }
    
    final class GraphicsRenderer {
        private var oldCache: DisplayList.GraphicsRenderer.Cache
        private var newCache: DisplayList.GraphicsRenderer.Cache
        private var index: DisplayList.Index
        private var time: Time
        private var nextTime: Time
        private var stableIDs: _DisplayList_StableIdentityMap?
        private var inTransitionGroup: Bool
        private var stateHashes: [StrongHash]
        fileprivate var platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode
        
        init(platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode) {
            fatalError("TODO")
        }
    }
}

extension DisplayList.GraphicsRenderer {
    enum PlatformViewMode {
        case rendered(update: Bool)
        case ignored
        case unsupported
    }
    
    fileprivate struct Cache {
//        private var callbacks: [DisplayList.GraphicsRenderer.Cache.CallbackKey: Void /* TODO */]
        private var animators: [DisplayList.GraphicsRenderer.Cache.AnimatorKey: any _DisplayList_AnyEffectAnimator]
    }
}

extension DisplayList.GraphicsRenderer.Cache {
    fileprivate struct AnimatorKey: Hashable {
        private var index: DisplayList.Index.ID
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey, rhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey) -> Bool {
            fatalError("TODO")
        }
        
        func hash(into hasher: inout Hasher) {
            fatalError("TODO")
        }
    }
    
    fileprivate struct CallbackKey: Hashable {
        private var index: DisplayList.Index.ID
        private var seed: DisplayList.Seed
        private var scale: CGFloat
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.CallbackKey, rhs: DisplayList.GraphicsRenderer.Cache.CallbackKey) -> Bool {
            fatalError("TODO")
        }
        
        func hash(into hasher: inout Hasher) {
            fatalError("TODO")
        }
    }
}

extension DisplayList.ViewUpdater {
    struct ViewCache {
        private var map: [DisplayList.ViewUpdater.ViewCache.Key: DisplayList.ViewUpdater.ViewInfo] = [:]
        private var reverseMap: [OpaquePointer: DisplayList.ViewUpdater.ViewCache.Key /* DisplayCache.Key이라고 표기되어 있는데 이런건 없음 */] = [:]
        private var removed: Set<DisplayList.ViewUpdater.ViewCache.Key> = []
        private var animators: [DisplayList.ViewUpdater.ViewCache.Key: DisplayList.ViewUpdater.ViewCache.AnimatorInfo] = [:]
        private var asyncValues: [ObjectIdentifier: DisplayList.ViewUpdater.ViewCache.AsyncValues] = [:]
        private var pendingAsyncValues: [ObjectIdentifier: [DisplayList.ViewUpdater.ViewCache.PendingAsyncValue]] = [:]
        private var asyncModifierGroup: CAPresentationModifierGroup? = nil
        private var pendingAsyncUpdates: [() -> Void] = []
        private var index = DisplayList.Index()
        private var cacheSeed: UInt32 = 0
        private var currentList = DisplayList()
        
        init() {}
        
        func invalidateAll() {
            // self = sp + 0x8
            
            fatalError("TODO")
        }
    }
    
    struct ViewInfo {
        private var platform: DisplayList.ViewUpdater.Platform
        private var view: AnyObject
        private var layer: CALayer
        private var container: AnyObject
        private var state: DisplayList.ViewUpdater.Platform.State
        private var id: DisplayList.ViewUpdater.ViewInfo.ID
        private var parentID: DisplayList.ViewUpdater.ViewInfo.ID
        private var seeds: DisplayList.ViewUpdater.ViewInfo.Seeds
        private var cacheSeed: UInt32
        private var isRemoved: Bool
        private var isInvalid: Bool
        private var nextUpdate: Time
    }
    
    struct PlatformViewInfo {
        private let view: AnyObject
        private let kind: PlatformViewDefinition.ViewKind
        private var state: UnsafeMutablePointer<DisplayList.ViewUpdater.Platform.State>
        private var seeds: UnsafeMutablePointer<DisplayList.ViewUpdater.PlatformViewInfo.Seeds>
    }
}

extension DisplayList.ViewUpdater.PlatformViewInfo {
    struct Seeds {
        private var zPosition: DisplayList.Seed
        private var separatedState: DisplayList.Seed
        private var separatedOptions: DisplayList.Seed
        private var remoteEffects: DisplayList.Seed
        private var renderingTechnique: DisplayList.Seed
        private var projectiveShadow: DisplayList.Seed
        private var hitTestsAsOpaque: DisplayList.Seed
        private var serverResponderID: DisplayList.Seed
    }
}

extension DisplayList.ViewUpdater.Platform {
    struct State {
        private var position: CGPoint
        private var size: CGSize
        private let kind: PlatformViewDefinition.ViewKind
        private var flags: DisplayList.ViewUpdater.Platform.ViewFlags
        private var platformState: DisplayList.ViewUpdater.Platform.PlatformState
    }
    
    struct ViewFlags {
        private let rawValue: UInt8
    }
    
    struct PlatformState {
        private var separatedOptionKeys: [(any AnySeparatedOptionKey).Type]
        private var remoteEffects: [RemoteEffectGroupInfo.ID: CARemoteEffectGroup]
    }
}

extension DisplayList.ViewUpdater.ViewInfo {
    struct ID {
        private var value: Int
    }
    
    struct Seeds {
        private var item: DisplayList.Seed
        private var content: DisplayList.Seed
        private var opacity: DisplayList.Seed
        private var blend: DisplayList.Seed
        private var transform: DisplayList.Seed
        private var clips: DisplayList.Seed
        private var filters: DisplayList.Seed
        private var shadow: DisplayList.Seed
        private var properties: DisplayList.Seed
        private var platformSeeds: DisplayList.ViewUpdater.PlatformViewInfo.Seeds
    }
}

extension DisplayList.ViewUpdater.ViewCache {
    struct Key: Hashable {
        private var id: DisplayList.Index.ID
        private var system: PlatformViewDefinition.System
        private var tag: DisplayList.ViewUpdater.ViewCache.Tag
        
        static func == (lhs: DisplayList.ViewUpdater.ViewCache.Key, rhs: DisplayList.ViewUpdater.ViewCache.Key) -> Bool {
            fatalError("TODO")
        }
        
        func hash(into hasher: inout Hasher) {
            fatalError("TODO")
        }
    }
    
    fileprivate struct AsyncValues {
        private var animations: Set<String>
        private var modifiers: [String: CAPresentationModifier]
    }
    
    fileprivate struct PendingAsyncValue {
        private var keyPath: String
        private var value: NSObject
        private var usesPresentationModifier: Bool
    }
}

extension DisplayList.ViewUpdater.ViewCache {
    fileprivate struct AnimatorInfo {
        private var state: DisplayList.ViewUpdater.ViewCache.AnimatorInfo.State
        private var deadline: Time
    }
    
    enum Tag {
        case item
        case inherited
    }
}

extension DisplayList {
    enum Effect {
//        case backdropGroup(DisplayList.BackdropGroup)
//        case archive(DisplayList.ArchiveIDs?)
//        case properties(DisplayList.Properties)
//        case platformGroup(PlatformGroupFactory)
//        case opacity(Float)
//        case blendMode(GraphicsBlendMode)
//        case clip(Path, FillStyle, GraphicsContext.ClipOptions)
//        case mask(DisplayList, GraphicsContext.ClipOptions)
//        case sdfShape(SDFShape)
//        case transform(DisplayList.Transform)
//        case filter(GraphicsFilter)
//        case animation(_DisplayList_AnyEffectAnimation)
//        case contentTransition(ContentTransition.State)
//        case view(_DisplayList_ViewFactory)
//        case accessibility([AccessibilityNodeAttachment])
//        case platform(DisplayList.PlatformEffect)
//        case state(StrongHash)
//        case interpolatorRoot(DisplayList.InterpolatorGroup, contentOrigin: CGPoint, SwiftOffset: CGSize)
//        case interpolatorLayer(DisplayList.InterpolatorGroup, serial: UInt32)
//        case interpolatorAnimation(DisplayList.InterpolatorAnimation)
//        case identity
//        case geometryGroup
//        case compositingGroup
    }
}

extension DisplayList.ViewUpdater.ViewCache.AnimatorInfo {
    fileprivate enum State {
        case active(any _DisplayList_AnyEffectAnimator)
        case finished(DisplayList.Effect, DisplayList.Version)
        case idle
    }
}

extension DisplayList.ViewUpdater {
    struct Platform {
        private var encoding: DisplayList.ViewUpdater.Platform.Encoding
        
        init(definition: PlatformViewDefinition.Type) {
            let system = definition.system
            self.encoding = Encoding(rawValue: UInt(bitPattern: ObjectIdentifier(definition)) | UInt(system.base.rawValue))
        }
        
        // 원래 없음
        @inlinable
        func addDrawingView(rootView: AnyObject, options: PlatformDrawableOptions) {
            let definition = unsafeBitCast(encoding.rawValue & 0xfffffffffffffff8, to: PlatformViewDefinition.Type.self)
            let drawingView = definition.makeDrawingView(options: options)
            let all = UInt(MySwiftUIViewSystem.caLayer.rawValue | MySwiftUIViewSystem.uiView.rawValue | MySwiftUIViewSystem.nsView.rawValue)
            let system = MySwiftUIViewSystem(rawValue: UInt8(encoding.rawValue & all))!
            CoreViewAddSubview(system, rootView, system, drawingView, 0)
        }
        
        // TODO
        // method 많음
    }
}

extension DisplayList.ViewUpdater.Platform {
    fileprivate struct Encoding: OptionSet {
        // TODO
        let rawValue: UInt
    }
}

extension DisplayList {
    struct Index {
        private var identity = _DisplayList_Identity(value: 0)
        private var serial: UInt32 = 0
        private var archiveIdentity = _DisplayList_Identity(value: 0)
        private var archiveSerial: UInt32 = 0
        private var restored = DisplayList.Index.RestoreOptions(rawValue: 0)
        
        init() {}
    }
}

extension DisplayList.Index {
    struct ID {
        private var identity: _DisplayList_Identity
        private var serial: UInt32
        private var archiveIdentity: _DisplayList_Identity
        private var archiveSerial: UInt32
    }
    
    fileprivate struct RestoreOptions: OptionSet {
        let rawValue: UInt8
    }
}

protocol AnySeparatedOptionKey {
    // TODO
}

protocol _DisplayList_AnyEffectAnimator {
    // TODO
}

struct _DisplayList_StableIdentity {
    var hash: StrongHash
    var serial: UInt32
}

struct _DisplayList_StableIdentityMap {
    private var map: [_DisplayList_Identity: _DisplayList_StableIdentity]
}

extension DisplayList {
    package final class ViewRenderer: ViewRendererBase {
        private let platform: DisplayList.ViewUpdater.Platform
        private(set) var configuration = _RendererConfiguration(renderer: .default)
        package weak var host: ViewRendererHost? = nil
        private var state: DisplayList.ViewRenderer.State = .none
        private(set) var renderer: ViewRendererBase? = nil
        private(set) var configChanged: Bool = true
        
        init(platform: DisplayList.ViewUpdater.Platform) {
            self.platform = platform
        }
        
        init(definition: PlatformViewDefinition.Type) {
            self.platform = DisplayList.ViewUpdater.Platform(definition: definition)
        }
        
        var definition: PlatformViewDefinition.Type {
            fatalError("TODO")
        }
        
        var rootPlatform: DisplayList.ViewUpdater.Platform {
            fatalError("TODO")
        }
        
        var exportedObject: AnyObject? {
            fatalError("TODO")
        }
        
        func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: Environment) -> Time {
            let renderer = updateRenderer(rootView: rootView)
            return renderer.render(rootView: rootView, from: displayList, time: time, version: version, maxVersion: maxVersion, environment: environment)
        }
        
        func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time? {
            fatalError("TODO")
        }
        
        func destroy(rootView: AnyObject) {
            fatalError("TODO")
        }
        
        var viewCacheIsEmpty: Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateRenderer(rootView: AnyObject) -> ViewRendererBase {
            guard configChanged else {
                return renderer!
            }
            
            configChanged = false
            
            let state = state
            let newState: DisplayList.ViewRenderer.State
            switch configuration.renderer {
            case .default:
                newState = .updating
            case .rasterized:
                newState = .rasterizing
            }
            
            if newState == state {
                // <+200>
            } else {
                if let renderer {
                    // <+112>
                    renderer.destroy(rootView: rootView)
                } else {
                    // <+184>
                }
                // <+188>
                self.renderer = nil
                self.state = .none
            }
            
            // <+200>
            if let renderer {
                switch configuration.renderer {
                case .default:
                    // <+896>
                    return self.renderer!
                case .rasterized(let options):
                    // <+216>
                    let viewRasterizer = renderer as! DisplayList.ViewRasterizer
                    // <+260>
                    viewRasterizer.update(rasterizationOptions: options, host: host)
                    return self.renderer!
                }
            } else {
                // <+416>
                switch configuration.renderer {
                case .default:
                    // <+940>
                    self.renderer = DisplayList.ViewUpdater(rootPlatform: platform, host: host)
                    return self.renderer!
                case .rasterized(let options):
                    // <+420>
                    // x23
                    let renderer = DisplayList.ViewRasterizer(rootPlatform: platform, host: host, drawingView: rootView, rasterizationOptions: options)
                    
                    // <+668>
                    let rasterizationOptions = RasterizationOptions(options)
                    platform.addDrawingView(rootView: rootView, options: PlatformDrawableOptions(base: rasterizationOptions))
                    
                    // <+860>
                    self.renderer = renderer
                    self.state = .rasterizing
                    return self.renderer!
                }
            }
        }
    }
}

protocol ViewRendererBase: AnyObject {
    var rootPlatform: DisplayList.ViewUpdater.Platform {
        get
    }
    
    var exportedObject: AnyObject? {
        get
    }
    
    func render(rootView: AnyObject, from displayList: DisplayList, time: Time, version: DisplayList.Version, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) -> Time
    
    func renderAsync(to displayList: DisplayList, time: Time, targetTimestamp: Time?, version: DisplayList.Version, maxVersion: DisplayList.Version) -> Time?
    
    func destroy(rootView: AnyObject)
    
    var viewCacheIsEmpty: Bool {
        get
    }
}

extension DisplayList.ViewRenderer {
    struct Environment: Equatable {
        static var invalid: DisplayList.ViewRenderer.Environment {
            return DisplayList.ViewRenderer.Environment(contentsScale: 0)
        }
        
        var contentsScale: CGFloat
        
        init(contentsScale: CGFloat) {
            self.contentsScale = contentsScale
        }
    }
    
    fileprivate enum State {
        case none
        case updating
        case rasterizing
    }
}

package struct _DisplayList_Identity: Hashable {
    var value: UInt32
}
