// 8BBC66CBE42B8A65F8A2F3799C81A349

#warning("TODO")
private import CoreGraphics
internal import _MySwiftUIShims

extension DisplayList.ViewUpdater {
    package struct Platform: Equatable, CustomStringConvertible {
        fileprivate private(set) var encoding: DisplayList.ViewUpdater.Platform.Encoding
        
        init(definition: PlatformViewDefinition.Type) {
            self.encoding = DisplayList.ViewUpdater.Platform.Encoding(definition: definition)
        }
        
        // 원래 없음
        @inline(__always)
        func addDrawingView(rootView: AnyObject, options: PlatformDrawableOptions) {
            let drawingView = encoding.definition.makeDrawingView(options: options)
            let system = encoding.viewSystem
            CoreViewAddSubview(system, rootView, system, drawingView, 0)
        }
        
        @inline(__always)
        func viewLayer(_ view: AnyObject) -> CALayer {
            return CoreViewLayer(encoding.viewSystem, view)
        }
        
        func setFilters(_ filters: [GraphicsFilter], of view: AnyObject) {
            CoreViewSetFilters(encoding.viewSystem, view, filters.caFilters)
        }
        
        @inline(__always)
        func setShadow(_ style: ResolvedShadowStyle?, layer: CALayer) {
            let system = encoding.viewSystem
            
            let view = unsafe withUnsafeTemporaryAllocation(of: ViewSystem.self, capacity: 1) { pointer in
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
            // x29 = sp + 0x460
            // sp + 0x380
            let copy_1 = item
            // x27
            var encoding = encoding
            
            switch item.value {
            case .content(let content):
                // <+100>
                switch content.value {
                case .color(let colorView):
                    // <+2740>
                    if encoding.mixedViewHierarchy && !state.pointee.properties.contains(.secondaryForegroundLayer) {
                        encoding = DisplayList.ViewUpdater.Platform.Encoding(definition: CALayerPlatformViewDefinition.self)
                    }
                    
                    // x20
                    // <+3476>
                    let definition = encoding.definition
                    let view = definition.makeView(kind: .color)
                    // sp + 0xa0
                    let viewInfo = DisplayList.ViewUpdater.ViewInfo(platform: self, view: view, kind: .color)
                    // <+3532>
                    let parameters = CoreGlue2.SetupPlatformPropertiesParameters(view: view, kind: .color, platform: self)
                    CoreGlue2.shared.setupPlatformProperties(parameters)
                    
                    return viewInfo
                default:
                    fatalError("TODO")
                }
            case .effect(_, _):
                // <+208>
                fatalError("TODO")
            default:
                fatalError()
            }
        }
        
        func updateItemView(
            _ viewInfo: inout DisplayList.ViewUpdater.ViewInfo,
            index: DisplayList.Index,
            item: DisplayList.Item,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            // x29 = sp + 0x840
            // x19 = sp + 0x30
            /*
             viewInfo = x27
             item = x22
             state = sp + 0x70
             */
            // <+236>
            // sp + 0x740
            let item_1 = item
            // x11
            let encoding = encoding
            // sp + 0x78
            let value = item_1.value
            
            switch item_1.value {
            case .content(let content):
                // <+284>
                if viewInfo.seeds.content == content.seed {
                    // <+296>
                    fatalError("TODO")
                } else {
                    // <+656>
                    // sp + 0x60
                    let encoding_1 = encoding
                    // sp + 0x480
                    let state_1 = state.pointee
                    // sp + 0x330
                    let state_2 = state.pointee
                    
                    // <+700>
                    viewInfo.isInvalid = false
                    // viewInfo = sp + 0x58
                    viewInfo.state.flags.remove(.unknown5)
                    
                    // <+732>
                    switch content.value {
                    case .color(let colorView):
                        // <+4860>
                        // sp + 0xd0
                        let color = colorView.color
                        // w25
                        let isAntialiased = colorView.isAntialiased
                        // w26
                        let allowedDynamicRange = colorView.allowedDynamicRange
                        // <+4888>
                        // viewInfo = x21
                        fatalError("TODO")
                    default:
                        fatalError("TODO")
                    }
                }
            case .effect(let effect, let displayList):
                // <+572>
                fatalError("TODO")
            default:
                fatalError()
            }
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
        
        package var description: String {
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
        @inline(__always)
        var system: ViewSystem {
            return encoding.viewSystem
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
        
        // 원래 없음
        @inline(__always)
        init(zPosition: DisplayList.Seed, separatedState: DisplayList.Seed, separatedOptions: DisplayList.Seed, remoteEffects: DisplayList.Seed, renderingTechnique: DisplayList.Seed, projectiveShadow: DisplayList.Seed, hitTestsAsOpaque: DisplayList.Seed, serverResponderID: DisplayList.Seed) {
            self.zPosition = zPosition
            self.separatedState = separatedState
            self.separatedOptions = separatedOptions
            self.remoteEffects = remoteEffects
            self.renderingTechnique = renderingTechnique
            self.projectiveShadow = projectiveShadow
            self.hitTestsAsOpaque = hitTestsAsOpaque
            self.serverResponderID = serverResponderID
        }
    }
}

extension DisplayList.ViewUpdater.Platform {
    struct State {
        private var position: CGPoint
        private var size: CGSize
        let kind: PlatformViewDefinition.ViewKind
        var flags: DisplayList.ViewUpdater.Platform.ViewFlags
        private var platformState: DisplayList.ViewUpdater.Platform.PlatformState
        
        // 원래 없음
        @inline(__always)
        init(
            position: CGPoint,
            size: CGSize,
            kind: PlatformViewDefinition.ViewKind,
            flags: DisplayList.ViewUpdater.Platform.ViewFlags,
            platformState: DisplayList.ViewUpdater.Platform.PlatformState
        ) {
            self.position = position
            self.size = size
            self.kind = kind
            self.flags = flags
            self.platformState = platformState
        }
    }
    
    struct ViewFlags: OptionSet {
        static let unknown5 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 5)
        let rawValue: UInt8
        
        init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
    
    struct PlatformState {
        private var separatedOptionKeys: [(any AnySeparatedOptionKey).Type] = []
        private var remoteEffects: [RemoteEffectGroupInfo.ID: CARemoteEffectGroup] = [:]
    }
}

extension DisplayList.ViewUpdater.Platform {
    fileprivate struct Encoding: OptionSet {
        let rawValue: UInt
        
        init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        // 원래 없음
        @inline(__always)
        init(definition: PlatformViewDefinition.Type) {
            let system = definition.system
            self.rawValue = UInt(bitPattern: ObjectIdentifier(definition)) | UInt(system.base.rawValue)
        }
        
        // 원래 없음
        @inline(__always)
        var definition: PlatformViewDefinition.Type {
            return unsafe unsafeBitCast(self.rawValue & ~0x7, to: PlatformViewDefinition.Type.self)
        }
        
        // 원래 없음
        @inline(__always)
        var viewSystem: ViewSystem {
            let all = UInt(ViewSystem.caLayer.rawValue | ViewSystem.uiView.rawValue | ViewSystem.nsView.rawValue)
            let system = ViewSystem(rawValue: UInt8(self.rawValue & all))!
            return system
        }
        
        // 원래 없음
        @inline(__always)
        var mixedViewHierarchy: Bool {
            return (rawValue & 0x4) != 0
        }
        
#if !os(visionOS)
        // 원래 없음
        @inline(__always)
        func asMixedViewHierarchy() -> DisplayList.ViewUpdater.Platform.Encoding {
            return DisplayList.ViewUpdater.Platform.Encoding(rawValue: rawValue | 0x4)
        }
#endif
    }
}

extension DisplayList.ViewUpdater.ViewCache {
    func update(
        item: DisplayList.Item,
        platform: DisplayList.ViewUpdater.Platform,
        state: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
        tag: DisplayList.ViewUpdater.ViewCache.Tag,
        in id: DisplayList.ViewUpdater.ViewInfo.ID
    ) -> DisplayList.ViewUpdater.ViewCache.Result {
        /*
         x26 = sp + 0x420
         */
        /*
         item = x24
         tag = x28
         state = sp + 0xa8
         id = sp + 0xc8
         */
        // sp + 0xb0
        let copy_1 = platform
        // w23
        let system = platform.system
        // sp + 0x68
        let identity_1 = item.identity
        // self = sp + 0x80
        // sp + 0x48
        let indexID = index.id
        
        let key = DisplayList.ViewUpdater.ViewCache.Key(id: indexID, system: PlatformViewDefinition.System(base: system), tag: tag)
        if let viewInfo = map[key] {
            // <+212>
            fatalError("TODO")
        }
        
        // <+436>
        let disableActions = CATransaction.disableActions()
        CATransaction.setDisableActions(true)
        
        // tag -> sp + 0xa0
        // disableActions -> sp + 0x88
        
        switch tag {
        case .item:
            // <+752>
            /*
             x27 = sp + 0x100
             platform = sp + 0x380
             state = x28
             */
            // sp + 0x4c0
            let copy_2 = item
            /*
             index.identity/serial/archiveIdentity/archiveSerial = sp + 0x90
             index.restored = w25
             */
            let index_1 = index
            // w21/sp + 0x508
            let identity_2 = identity_1
            // sp + 0x420
            var viewInfo = platform._makeItemView(item: copy_2, state: state)
            /*
             platform = sp + 0x2e0
             x22 = sp + 0x4c0
             */
            // sp + 0x380
            let index_2 = index_1
            /*
             x25 = sp + 0x100
             */
            // sp + 0x4c0
            let copy_3 = item
            // <+904>
            platform.updateItemView(&viewInfo, index: index_2, item: copy_2, state: state)
            // <+928>
            fatalError("TODO")
        case .inherited:
            // <+500>
            fatalError("TODO")
        }
        
        // <+944>
        fatalError("TODO")
    }
}
