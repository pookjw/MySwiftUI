// B86250B2E056EB47628ECF46032DFA4C

#warning("TODO")
private import _DarwinFoundation3._stdlib
private import CoreGraphics
internal import _MySwiftUIShims

@safe fileprivate nonisolated(unsafe) var printTree: Bool? = nil

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
             displayList = x23 + w21 + w26
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
            
            // x27
            let rootPlatform = rootPlatform
            // <+220>
            if lastTime == .zero {
                let viewLayer = rootPlatform.viewLayer(rootView)
                viewLayer.allowsGroupOpacity = false
                viewLayer.allowsGroupBlending = false
            }
            
            // <+304>
            if version.value != 0 {
                self.seed = DisplayList.Seed(version)
                self.asyncSeed = DisplayList.Seed(version)
            } else {
                self.seed = DisplayList.Seed()
                self.asyncSeed = DisplayList.Seed()
            }
            
            self.wasValid = self.isValid
            self.isValid = true
            self.lastList = displayList
            self.lastTime = time
            
            let _printTree: Bool
            if let printTree = printTree {
                _printTree = printTree
            } else {
                if let value = unsafe getenv("SWIFTUI_PRINT_TREE") {
                    _printTree = unsafe (atoi(value) != 0)
                } else {
                    _printTree = false
                }
                printTree = _printTree
            }
            
            if _printTree {
                print("View at \(time)\n:\(displayList)")
            }
            
            // <+836>
            // sp, #0x68
            _ = self.lastEnv
            /*
             self = sp + 0x50
             time = sp + 0x58
             maxVersion = sp + 0x60
             */
            
            _ = DisplayList.ViewUpdater.Model.State.Globals(
                updater: self,
                time: time,
                maxVersion: maxVersion,
                environment: environment
            )
            
            return unsafe withUnsafeTemporaryAllocation(of: DisplayList.ViewUpdater.Model.State.Globals.self, capacity: 1) { globals in
                unsafe globals.baseAddress.unsafelyUnwrapped.initialize(
                    to: DisplayList.ViewUpdater.Model.State.Globals(
                        updater: self,
                        time: time,
                        maxVersion: maxVersion,
                        environment: environment
                    )
                )
                
                var state = unsafe DisplayList.ViewUpdater.Model.State(globals: globals.baseAddress.unsafelyUnwrapped)
                
                self.viewCache.index = DisplayList.Index()
                self.viewCache.currentList = displayList
                // sp + 0x20 = viewCache.index의 주소
                
                self.viewCache.clearAsyncValues()
                
                let viewLayer = rootPlatform.viewLayer(rootView)
                // x26
                let oldNeedsDisplayOnBoundsChange = viewLayer.needsDisplayOnBoundsChange
                viewLayer.needsDisplayOnBoundsChange = false
                
                // sp + 0x28
                var container = DisplayList.ViewUpdater.Container(encoding: rootPlatform.encoding, rootView: rootView, unknown: 0)
                
                // <+1284>
                // sp, #0x40
                var result: Time = .infinity
                
                for item in displayList.items {
                    // w22, w26, d9
                    // inlined
                    var oldIndex: DisplayList.Index = self.viewCache.index.enter(identity: item.identity)
                    
                    var item = item
                    let time = unsafe viewCache.prepare(item: &item, platform: rootPlatform, parentState: &state)
                    result = min(time, result)
                    
                    unsafe self.updateInheritedView(container: &container, from: item, parentState: &state)
                    
                    // inlined
                    self.viewCache.index.leave(index: oldIndex)
                }
                
                // <+1828>
                container.removeRemaining(viewCache: &viewCache)
                // time = sp + 0x300
                viewCache.reclaim(time: time)
                
                // <+1992>
                viewCache.pendingAsyncUpdates = []
                viewCache.index = DisplayList.Index()
                viewCache.cacheSeed = 0
                
                // sp, #0x88
                let result2 = result
                
                if !isValid {
                    // <+2040>
                    result = time
                }
                
                if let host {
                    // <+2192>
                    if let observer = host.as(ViewGraphRenderObserver.self), result2 != .zero {
                        observer.didRender()
                    }
                }
                
                // <+2220>
                viewLayer.needsDisplayOnBoundsChange = oldNeedsDisplayOnBoundsChange
                
                self.nextUpdate = result
                return result
            }
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
        
        // $s7SwiftUI11DisplayListV11ViewUpdaterC015updateInheritedE033_B86250B2E056EB47628ECF46032DFA4CLL9container4from11parentStateyAE9ContainerAGLLVz_AC4ItemVSPyAE5ModelO0R0VGtF
        fileprivate func updateInheritedView(
            container: inout DisplayList.ViewUpdater.Container,
            from item: DisplayList.Item,
            parentState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            // x29 = sp + 0x7f0
            // x21 = sp + 0x580
            /*
             self = x19
             container = x22
             parentState = x23
             */
            // sp + 0x5d0
            var copy_1 = item
            // sp + 0x580
            var copy_2 = item
            // sp + 0x628
            var copy_3 = parentState.pointee
            // sp + 0x430
            var copy_4 = parentState.pointee
            
            // <+164>
            // self = sp
            // sp + 0x270
            let index = viewCache.index
            
            // <+208>
            fatalError("TODO")
        }
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
        let kind: PlatformViewDefinition.ViewKind
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

extension DisplayList.ViewUpdater {
    struct ViewInfo {
        private(set) var platform: DisplayList.ViewUpdater.Platform
        private(set) var view: AnyObject
        private var layer: CALayer
        private(set) var container: AnyObject
        private(set) var state: DisplayList.ViewUpdater.Platform.State
        private var id: DisplayList.ViewUpdater.ViewInfo.ID
        private var parentID: DisplayList.ViewUpdater.ViewInfo.ID
        private var seeds: DisplayList.ViewUpdater.ViewInfo.Seeds
        private var cacheSeed: UInt32
        var isRemoved: Bool
        var isInvalid: Bool
        private var nextUpdate: Time
    }
    
    @safe struct PlatformViewInfo {
        private let view: AnyObject
        private let kind: PlatformViewDefinition.ViewKind
        private var state: UnsafeMutablePointer<DisplayList.ViewUpdater.Platform.State>
        private var seeds: UnsafeMutablePointer<DisplayList.ViewUpdater.PlatformViewInfo.Seeds>
    }
    
    fileprivate struct Container: ~Copyable {
        let encoding: DisplayList.ViewUpdater.Platform.Encoding
        let rootView: AnyObject
        let unknown: UInt
        
        func removeRemaining(viewCache: inout DisplayList.ViewUpdater.ViewCache) {
            // viewCache = x26
            // x22
            let system = encoding.system
            
            // x27
            let reverseMap = unsafe viewCache.reverseMap
            // x24 = sp, #0x1d0
            // x23
            for index in 0..<CoreViewSubviewsCount(system, rootView) {
                // sp, #0x68
                var outSystem = system
                let subview = unsafe unsafeBitCast(CoreViewSubviewAtIndex(system, rootView, Int(index), &outSystem), to: AnyObject.self)
                
                guard system == outSystem else {
                    continue
                }
                
                guard let key = unsafe reverseMap[OpaquePointer(Unmanaged.passUnretained(subview).toOpaque())] else {
                    continue
                }
                
                // x9
                var viewInfo = viewCache.map[key]!
                
                if !viewInfo.isRemoved {
                    viewInfo.isRemoved = true
                }
                
                viewCache.map[key] = viewInfo
                CoreViewRemoveFromSuperview(system, subview)
            }
        }
    }
}

extension DisplayList.ViewUpdater {
    @safe struct AsyncLayer {
        private var layer: CALayer
        private let cache: UnsafeMutablePointer<DisplayList.ViewUpdater.ViewCache>
        private let kind: PlatformViewDefinition.ViewKind
        private let flags: DisplayList.ViewUpdater.Platform.ViewFlags
        private var nextUpdate: Time
        private var isInvalid: Bool
    }
    
    struct Platform: Equatable, CustomStringConvertible {
        fileprivate private(set) var encoding: DisplayList.ViewUpdater.Platform.Encoding
        
        init(definition: PlatformViewDefinition.Type) {
            self.encoding = DisplayList.ViewUpdater.Platform.Encoding(definition: definition)
        }
        
        // 원래 없음
        @inlinable
        func addDrawingView(rootView: AnyObject, options: PlatformDrawableOptions) {
            let drawingView = encoding.definition.makeDrawingView(options: options)
            let system = encoding.system
            CoreViewAddSubview(system, rootView, system, drawingView, 0)
        }
        
        @inlinable
        func viewLayer(_ view: AnyObject) -> CALayer {
            return CoreViewLayer(encoding.system, view)
        }
        
        func setFilters(_ filters: [GraphicsFilter], of view: AnyObject) {
            CoreViewSetFilters(encoding.system, view, filters.caFilters)
        }
        
        @inlinable
        func setShadow(_ style: ResolvedShadowStyle?, layer: CALayer) {
            let system = encoding.system
            
            let view = unsafe withUnsafeTemporaryAllocation(of: MySwiftUIViewSystem.self, capacity: 1) { pointer in
                return unsafe CoreViewLayerView(system, layer, pointer.baseAddress.unsafelyUnwrapped)
            }
            
            if let style {
                CoreViewSetShadow(system, view, style.color.cgColor, style.radius, style.offset)
            } else {
                CoreViewSetShadow(system, view, nil, 0, .zero)
            }
        }
        
        func updateAffineTransform3DAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            oldTransform: AffineTransform3D,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newTransform: AffineTransform3D,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Bool {
            fatalError("TODO")
        }
        
        func updatePlatformState(
            _: inout DisplayList.ViewUpdater.PlatformViewInfo,
            item: DisplayList.Item,
            size: CGSize,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.PlatformState>
        ) {
            fatalError("TODO")
        }
        
        func updateDrawingView(
            _: inout AnyObject,
            options: RasterizationOptions,
            contentsScale: CGFloat
        ) -> PlatformDrawable {
            fatalError("TODO")
        }
        
        fileprivate func updateState(
            _ viewInfo: DisplayList.ViewUpdater.ViewInfo,
            item: DisplayList.Item,
            size: CGSize,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            fatalError("TODO")
        }
        
        fileprivate func updateStateAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            oldItem: DisplayList.Item,
            oldSize: CGSize,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newItem: DisplayList.Item,
            newSize: CGSize,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Bool {
            fatalError("TODO")
        }
        
        fileprivate func _makeItemView(
            item: DisplayList.Item,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> DisplayList.ViewUpdater.ViewInfo {
            fatalError("TODO")
        }
        
        func updateItemView(
            _: inout DisplayList.ViewUpdater.ViewInfo,
            index: DisplayList.Index,
            item: DisplayList.Item,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            fatalError("TODO")
        }
        
        fileprivate func updateSDFShapeView(
            _: inout DisplayList.ViewUpdater.ViewInfo,
            state: inout DisplayList.ViewUpdater.Model.State,
            shape: SDFShape,
            contentsChanged: Bool
        ) {
            fatalError("TODO")
        }
        
        fileprivate func missingPlatformView() -> AnyObject {
            fatalError("TODO")
        }
        
        func updateItemViewAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            index: DisplayList.Index,
            oldItem: DisplayList.Item,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newItem: DisplayList.Item,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateShapeViewAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            oldState: inout DisplayList.ViewUpdater.Model.State,
            oldSize: inout CGSize,
            oldPath: Path,
            oldPaint: AnyResolvedPaint,
            oldStyle: FillStyle,
            newState: inout DisplayList.ViewUpdater.Model.State,
            newSize: inout CGSize,
            newPath: Path,
            newPaint: AnyResolvedPaint,
            newStyle: FillStyle,
            contentsChanged: Bool
        ) -> Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateSDFShapeViewAsync(
            _: inout DisplayList.ViewUpdater.AsyncLayer,
            oldState: inout DisplayList.ViewUpdater.Model.State,
            oldShape: SDFShape,
            newState: inout DisplayList.ViewUpdater.Model.State,
            newShape: SDFShape,
            contentsChanged: Bool
        ) {
            fatalError("TODO")
        }
        
        fileprivate func updateDrawingViewAsync(
            _: inout DisplayList.ViewUpdater.AsyncLayer,
            oldOptions: RasterizationOptions,
            newOptions: RasterizationOptions,
            content: PlatformDrawableContent.Storage,
            sizeChanged: Bool,
            newSize: CGSize,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateClipShapes(
            _: inout DisplayList.ViewUpdater.ViewInfo,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            fatalError("TODO")
        }
        
        fileprivate func updateGeometry(
            _: inout DisplayList.ViewUpdater.ViewInfo,
            item: DisplayList.Item,
            size: CGSize,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            clipRectChanged: Bool
        ) -> Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateShadow(
            _: inout DisplayList.ViewUpdater.ViewInfo,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            item: DisplayList.Item
        ) {
            fatalError("TODO")
        }
        
        fileprivate func updateProperties(
            _: inout DisplayList.ViewUpdater.ViewInfo,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            fatalError("TODO")
        }
        
        fileprivate func updateClipShapesAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) -> Bool {
            fatalError("TODO")
        }
        
        fileprivate func updateShadowAsync(
            layer: inout DisplayList.ViewUpdater.AsyncLayer,
            oldState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            oldItem: DisplayList.Item,
            newState: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            newItem: DisplayList.Item,
            boundsChanged: Bool
        ) -> Bool {
            fatalError("TODO")
        }
        
        var description: String {
            fatalError("TODO")
        }
        
        func setAffineTransform3D(_: AffineTransform3D, of: AnyObject, identity: _DisplayList_Identity) {
            fatalError("TODO")
        }
        
        func setZPosition(_: CGFloat, of: AnyObject, identity: _DisplayList_Identity) {
            fatalError("TODO")
        }
        
        func updateSeparatedOptions(fromKeys: [AnySeparatedOptionKey.Type], to: SeparatedOptionValues, for: AnyObject) {
            fatalError("TODO")
        }
        
        func updateRemoteEffects(of: inout DisplayList.ViewUpdater.PlatformViewInfo, to: [RemoteEffectGroupInfo.ID : RemoteEffectGroupInfo]) {
            fatalError("TODO")
        }
        
        func maskContainerView(_: AnyObject, item: DisplayList.Item) -> AnyObject? {
            fatalError("TODO")
        }
        
        // 원래 없음
        @inlinable
        var definition: PlatformViewDefinition.Type {
            return encoding.definition
        }
        
        // 원래 없음
        @inlinable
        var system: MySwiftUIViewSystem {
            return encoding.system
        }
    }
}

extension DisplayList.ViewUpdater {
    enum Model {
        struct PlatformState {
            private var zPosition: CGFloat = 0
            private var renderingTechnique: RenderingTechnique = .texture
            private var separatedState: SeparatedState = .none
            private var separatedOptions = SeparatedOptionValues()
            private var remoteEffects = RemoteEffectsPlatformState()
            private var hitTestsAsOpaque: Bool = false
            private var serverResponderID: UInt32? = nil
            private var separatedModifiers: [any _DisplayList_SeparatedItemModifier] = []
            private var hierarchicalProjectiveShadow: ProjectiveShadow? = nil
            private var currentProjectiveShadow: ProjectiveShadow? = nil
            private var versions = DisplayList.ViewUpdater.Model.PlatformState.Versions()
            
            init() {}
        }
        
        struct Clip {
            private var path: Path
            private var transform: CGAffineTransform?
            private var style: FillStyle
        }
        
        @unsafe struct State {
            private var globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            private var opacity: Float = 1
            private var blend: GraphicsBlendMode = unsafe .normal
            private var transform = CGAffineTransform(a: 1, b: 0, c: 0, d: 1, tx: 0, ty: 0)
            private var clips: [DisplayList.ViewUpdater.Model.Clip] = []
            private var filters: [GraphicsFilter] = []
            private var shadow: Indirect<ResolvedShadowStyle>? = nil
            private var properties: DisplayList.Properties = []
            private var rewriteVibrantColorMatrix: Bool = false
            private var backdropAwareColorMatrices: Bool = false
            private var compositingGroup: Bool = false
            private var backdropGroupID: BackdropGroupID? = nil
            private var stateHashes: [StrongHash] = []
            private var platformState = DisplayList.ViewUpdater.Model.PlatformState()
            private var versions = DisplayList.ViewUpdater.Model.State.Versions()
            
            init(
                globals: UnsafePointer<DisplayList.ViewUpdater.Model.State.Globals>
            ) {
                unsafe self.globals = unsafe globals
            }
        }
    }
}

extension DisplayList.ViewUpdater.Model.State {
    struct Globals {
        private var updater: DisplayList.ViewUpdater
        private var time: Time
        private var maxVersion: DisplayList.Version
        private var environment: DisplayList.ViewRenderer.Environment
        
        init(updater: DisplayList.ViewUpdater, time: Time, maxVersion: DisplayList.Version, environment: DisplayList.ViewRenderer.Environment) {
            self.updater = updater
            self.time = time
            self.maxVersion = maxVersion
            self.environment = environment
        }
    }
    
    struct Versions {
        private var opacity = DisplayList.Version()
        private var blend = DisplayList.Version()
        private var transform = DisplayList.Version()
        private var clips = DisplayList.Version()
        private var filters = DisplayList.Version()
        private var shadow = DisplayList.Version()
        private var properties = DisplayList.Version()
        
        init() {}
    }
}

extension DisplayList.ViewUpdater.Model.PlatformState {
    struct Versions {
        private var zPosition = DisplayList.Version()
        private var separatedState = DisplayList.Version()
        private var separatedOptions = DisplayList.Version()
        private var remoteEffects = DisplayList.Version()
        private var hitTestsAsOpaque = DisplayList.Version()
        private var serverResponderID = DisplayList.Version()
        private var renderingTechnique = DisplayList.Version()
        private var hierarchicalProjectiveShadow = DisplayList.Version()
        private var currentProjectiveShadow = DisplayList.Version()
        
        init() {}
    }
}

extension DisplayList.ViewUpdater.Platform {
    fileprivate struct Encoding: OptionSet {
        let rawValue: UInt
        
        init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        // 원래 없음
        @inlinable
        init(definition: PlatformViewDefinition.Type) {
            let system = definition.system
            self.rawValue = UInt(bitPattern: ObjectIdentifier(definition)) | UInt(system.base.rawValue)
        }
        
        // 원래 없음
        @inlinable
        var definition: PlatformViewDefinition.Type {
            return unsafe unsafeBitCast(self.rawValue & 0xfffffffffffffff8, to: PlatformViewDefinition.Type.self)
        }
        
        // 원래 없음
        @inlinable
        var system: MySwiftUIViewSystem {
            let all = UInt(MySwiftUIViewSystem.caLayer.rawValue | MySwiftUIViewSystem.uiView.rawValue | MySwiftUIViewSystem.nsView.rawValue)
            let system = MySwiftUIViewSystem(rawValue: UInt8(self.rawValue & all))!
            return system
        }
    }
}
