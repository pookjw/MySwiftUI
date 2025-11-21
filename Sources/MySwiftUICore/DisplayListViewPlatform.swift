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
            _ platformViewInfo: inout DisplayList.ViewUpdater.PlatformViewInfo,
            item: DisplayList.Item,
            size: CGSize,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.PlatformState>
        ) {
            /*
             state = x19
             platformViewInfo = x22
             */
            // w23
            let identity = item.identity
            // x24
            let platformState = platformViewInfo.state
            // w8
            let flags = platformState.pointee.flags
            
            if
                !flags.contains(.unknown2),
                platformViewInfo.seeds.pointee.zPosition != DisplayList.Seed(state.pointee.versions.zPosition)
            {
                // <+112>
                self.setZPosition(state.pointee.zPosition, of: platformViewInfo.view, identity: identity)
                // <+140>
                platformViewInfo.seeds.pointee.zPosition = DisplayList.Seed(state.pointee.versions.zPosition)
            }
            
            // <+172>
            if platformViewInfo.seeds.pointee.separatedState != DisplayList.Seed(state.pointee.versions.separatedState) {
                // <+224>
                // sp + 0x18
                let parameters = CoreGlue2.SetSeparatedStateParameters(
                    state: state.pointee.separatedState,
                    view: platformViewInfo.view,
                    identity: identity,
                    reason: .separatedState,
                    platform: self
                )
                CoreGlue2.shared.setSeparatedState(parameters)
                platformViewInfo.seeds.pointee.separatedState = DisplayList.Seed(state.pointee.versions.separatedState)
            }
            
            // <+396>
            if platformViewInfo.seeds.pointee.separatedOptions != DisplayList.Seed(state.pointee.versions.separatedOptions) {
                // <+444>
                // x21
                let separatedOptionKeys = platformState.pointee.platformState.separatedOptionKeys
                self.updateSeparatedOptions(fromKeys: separatedOptionKeys, to: state.pointee.separatedOptions, for: platformViewInfo.view)
                
                platformState.pointee.platformState.separatedOptionKeys = state.pointee.separatedOptions.storage.map { (_, _) -> (any AnySeparatedOptionKey.Type) in
                    // $sSlsE3mapySayqd__Gqd__7ElementQzqd_0_YKXEqd_0_YKs5ErrorRd_0_r0_lF7SwiftUI21SeparatedOptionValuesV_AF03AnyfG3Key_pXps5NeverOTB503$s7d128UI11DisplayListV11ViewUpdaterC8PlatformV06updateG5State_4item4size5stateyAE0gE4InfoVz_AC4ItemVSo6CGSizeVSPyAE5ModelO0gI0VGtFAA21ifgJ74_pXpAA0qrS0_pcfu_33_29d95f9531728096fd6b966fd8998e4bAaX_pAaW_pXpTf3nnnpk_nTf1cn_n
                    fatalError("TODO")
                }
                
                platformViewInfo.seeds.pointee.separatedOptions = DisplayList.Seed(state.pointee.versions.separatedOptions)
            }
            
            // <+588>
            if platformViewInfo.seeds.pointee.remoteEffects != DisplayList.Seed(state.pointee.versions.remoteEffects) {
                // <+636>
                // x20, x21, x23
                let remoteEffects = state.pointee.remoteEffects
                self.updateRemoteEffects(of: &platformViewInfo, to: remoteEffects.values)
                platformViewInfo.seeds.pointee.remoteEffects = DisplayList.Seed(state.pointee.versions.remoteEffects)
            }
            
            // <+772>
            switch platformViewInfo.kind {
            case .image, .shape, .drawing:
                // <+804>
                if platformViewInfo.seeds.pointee.renderingTechnique != DisplayList.Seed(state.pointee.versions.renderingTechnique) {
                    // <+852>
                    CoreViewSetUsesPerspectiveCorrectRendering(
                        system,
                        platformViewInfo.view,
                        state.pointee.renderingTechnique == .perspectiveCorrect
                    )
                    platformViewInfo.seeds.pointee.renderingTechnique = DisplayList.Seed(state.pointee.versions.renderingTechnique)
                }
                
                // <+900>
            default:
                // <+900>
                break
            }
            
            // <+900>
            // x20
            let projectiveShadowVersion = max(state.pointee.versions.hierarchicalProjectiveShadow, state.pointee.versions.currentProjectiveShadow)
            if platformViewInfo.seeds.pointee.projectiveShadow != DisplayList.Seed(projectiveShadowVersion) {
                // <+956>
                let visibility: _UIPlatterGroundingShadowVisibility
                // TODO: enum
                if state.pointee.currentProjectiveShadow != nil {
                    visibility = _UIPlatterGroundingShadowVisibility(rawValue: 1)
                } else if state.pointee.hierarchicalProjectiveShadow != nil {
                    visibility = _UIPlatterGroundingShadowVisibility(rawValue: 1)
                } else {
                    visibility = _UIPlatterGroundingShadowVisibility(rawValue: 0)
                }
                
                CoreViewSetPreferredGroundingShadowVisibility(system, platformViewInfo.view, visibility)
                platformViewInfo.seeds.pointee.projectiveShadow = DisplayList.Seed(projectiveShadowVersion)
            }
            
            // <+1036>
            if platformViewInfo.seeds.pointee.hitTestsAsOpaque != DisplayList.Seed(state.pointee.versions.hitTestsAsOpaque) {
                // <+1084>
                // x21
                let layer = viewLayer(platformViewInfo.view)
                layer.hitTestsAsOpaque = state.pointee.hitTestsAsOpaque
                platformViewInfo.seeds.pointee.hitTestsAsOpaque = DisplayList.Seed(state.pointee.versions.hitTestsAsOpaque)
            }
            
            // <+1164>
            if platformViewInfo.seeds.pointee.serverResponderID != DisplayList.Seed(state.pointee.versions.serverResponderID) {
                // <+1212>
                CoreViewSetSwiftUIServerResponderID(system, platformViewInfo.view, UInt(state.pointee.serverResponderID ?? 0))
                platformViewInfo.seeds.pointee.serverResponderID = DisplayList.Seed(state.pointee.versions.serverResponderID)
            }
            
            // <+1272>
            // fin
        }
        
        func updateDrawingView(
            _: inout AnyObject,
            options: RasterizationOptions,
            contentsScale: CGFloat
        ) -> PlatformDrawable {
            fatalError("TODO")
        }
        
        fileprivate func updateState(
            _ viewInfo: inout DisplayList.ViewUpdater.ViewInfo,
            item: DisplayList.Item,
            size: CGSize,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            // x28 = sp + 0x160
            // x26 = sp + 0xa0
            /*
             state = x19
             size = d9/d8
             item = x22
             viewInfo = x21
             */
            let x28 = item.version
            // x26
            let item_1 = item
            // x27
            let encoding = encoding
            
            if viewInfo.seeds.opacity != DisplayList.Seed(state.pointee.versions.opacity) {
                // <+144>
                CoreViewSetOpacity(encoding.viewSystem, viewInfo.view, CGFloat(state.pointee.opacity))
                viewInfo.seeds.opacity = DisplayList.Seed(state.pointee.versions.opacity)
            }
            
            // <+196>
            if viewInfo.seeds.blend != DisplayList.Seed(state.pointee.versions.blend) {
                // <+244>
                fatalError("TODO")
            }
            
            // <+636>
            if viewInfo.seeds.filters != DisplayList.Seed(state.pointee.versions.filters) {
                // <+684>
                fatalError("TODO")
            }
            
            // <+892>
            // w3
            let clipRectChanged: Bool
            if (viewInfo.seeds.clips != DisplayList.Seed(state.pointee.versions.clips)) || (viewInfo.seeds.transform != DisplayList.Seed(state.pointee.versions.transform)) {
                // <+992>
                let w23 = viewInfo.state.flags
                self.updateClipShapes(&viewInfo, state: state)
                viewInfo.seeds.clips = DisplayList.Seed(state.pointee.versions.clips)
                
                if w23.contains(.unknown3) {
                    clipRectChanged = true
                } else {
                    clipRectChanged = viewInfo.state.flags.contains(.unknown3)
                }
            } else {
                // <+980>
                clipRectChanged = false
            }
            
            // <+1072>
            // sp + 0x10
            var item_2 = item
            // <+1164>
            var to1260: Bool
            if self.updateGeometry(&viewInfo, item: item_2, size: size, state: state, clipRectChanged: clipRectChanged) {
                // <+1264>
                to1260 = true
            } else {
                // w8
                let shadowSeed = viewInfo.seeds.shadow
                // x9
                let stateShadowVersion = state.pointee.versions.shadow
                
                if stateShadowVersion.value == 0 {
                    // <+1216>
                    if shadowSeed.value != 0 {
                        // <+1264>
                        to1260 = true
                    } else {
                        // <+1220>
                        to1260 = false
                    }
                } else {
                    // w9
                    let stateShadowSeed = DisplayList.Seed(stateShadowVersion)
                    if shadowSeed == stateShadowSeed {
                        // <+1220>
                        to1260 = false
                    } else {
                        // <+1264>
                        to1260 = true
                    }
                }
            }
            
            if !to1260 {
                // <+1220>
                // w8
                let itemSeed = viewInfo.seeds.item
                if x28.value == 0 && itemSeed.value == 0 {
                    // <+1380>
                } else {
                    // <+1228>
                    let w9 = DisplayList.Seed(x28)
                    to1260 = itemSeed != w9 // <+1260> or <+1380>
                }   
            }
            
            if to1260 {
                // <+1264>
                // sp + 0x10
                item_2 = item
                self.updateShadow(&viewInfo, state: state, item: item_2)
                viewInfo.seeds.shadow = DisplayList.Seed(state.pointee.versions.shadow)
            }
            
            // <+1380>
            if viewInfo.seeds.properties != DisplayList.Seed(state.pointee.versions.properties) {
                // <+1428>
                self.updateProperties(&viewInfo, state: state)
                viewInfo.seeds.shadow = DisplayList.Seed(state.pointee.versions.shadow)
            }
            
            // <+1484>
            let kind = viewInfo.state.kind
            switch kind {
            case .image,
                    .drawing,
                    .affine3D,
                    .platformView,
                    .platformGroup:
                // <+1680>
                viewInfo.layer.contentsScale = state.pointee.globals.pointee.environment.contentsScale
                // <+1520>
            case .inherited,
                    .color,
                    .shape,
                    .sdfLayer,
                    .sdfEffect,
                    .shadow,
                    .backdrop,
                    .chameleonColor,
                    .compositing,
                    .geometry,
                    .projection,
                    .mask,
                    .platformLayer,
                    .platformEffect:
                // <+1520>
                break
            }
            
            // <+1520>
            var platformViewInfo = DisplayList.ViewUpdater.PlatformViewInfo(
                view: viewInfo.view,
                kind: kind,
                state: &viewInfo.state,
                seeds: &viewInfo.seeds.platformSeeds
            )
            let platformState = UnsafeRawPointer(state)
                .advanced(by: MemoryLayout<DisplayList.ViewUpdater.Model.State>.offset(of: \.platformState)!)
                .assumingMemoryBound(to: DisplayList.ViewUpdater.Model.PlatformState.self)
            
            self.updatePlatformState(&platformViewInfo, item: item_2, size: size, state: platformState)
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
                // w20
                let seed = content.seed
                if viewInfo.seeds.content == seed {
                    // <+296>
                    fatalError("TODO")
                } else {
                    // <+656>
                    // sp + 0x60
                    let encoding_1 = encoding
                    // sp + 0x480
                    let state_1 = state.pointee
                    // sp + 0x330
                    var state_2 = state.pointee
                    
                    // d9/d13
                    let size = item_1.size
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
                        // seed = x27
                        // viewInfo = x21
                        switch viewInfo.state.kind {
                        case .color:
                            // <+4908>
                            // sp + 0x1e0
                            let item_2 = item_1
                            // sp + 0x1e0
                            let _ = state_1
                            // <+9492>
                            // x23
                            let layer = viewInfo.layer
                            let cache = Color.ResolvedHDR.cache
                            let cgColor = cache[colorView.color]
                            layer.backgroundColor = cgColor
                            layer.allowsEdgeAntialiasing = isAntialiased
                            
                            // <+9576> / <+12788> (inlined)
                            layer.updateEDR(allowedDynamicRange: allowedDynamicRange, contentHeadroom: color._headroom)
                            
                            // <+13012>
                            // seed -> x20
                            if viewInfo.state.flags == .unknown5 {
                                // <+15100>
                                state_2.versions.transform.combine(with: item_1.version)
                            }
                            
                            // <+15120>
                            if !viewInfo.isInvalid {
                                // <+15128>
                                if viewInfo.nextUpdate == .infinity {
                                    viewInfo.seeds.content = seed
                                }
                            }
                            
                            // <+15152>
                            // sp + 0x150
                            let viewInfo_1 = viewInfo
                            // sp + 0x200
                            let item_3 = item_1
                            
                            // <+15212>
                            self.updateState(&viewInfo, item: item_3, size: size, state: &state_2)
                            return
                        default:
                            // <+9292>
                            fatalError("TODO")
                        }
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
            _ viewInfo: inout DisplayList.ViewUpdater.ViewInfo,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>
        ) {
            /*
             viewInfo = x19
             state = x21
             */
            // x23
            let encoding = encoding
            // sp + 0x2e0
            let viewInfo_1 = viewInfo
            // sp + 0x150
            let state_1 = state.pointee
            // sp + 0x2a8
            let clipRect = state_1.clipRect()
            // sp + 0x430
            let _ = state_1
            // sp
            let viewInfo_2 = viewInfo_1
            
            if let clipRect {
                // <+256>
                fatalError("TODO")
            } else {
                // w25
                var flags = viewInfo.state.flags
                if flags.contains(.unknown3) {
                    // <+148>
                    flags.remove(.unknown3)
                    viewInfo.state.flags = flags
                    // x20
                    let view = viewInfo.view
                    CoreViewSetClipsToBounds(system, view, false, !isLinkedOnOrAfter(.v6))
                    // x20
                    let layer = viewInfo.layer
                    
                    var bounds = layer.bounds
                    bounds.origin = .zero
                    layer.bounds = bounds
                    layer.cornerRadius = 0
                    layer.cornerCurve = .circular
                }
                
                // <+736>
                if !state.pointee.clips.isEmpty {
                    // <+748>
                    fatalError("TODO")
                } else {
                    // <+828>
                    if flags.contains(.unknown4) {
                        viewInfo.layer.mask = nil
                    }
                    // <+1152>
                }
                
                // <+1152>
                return
            }
            fatalError("TODO")
        }
        
        fileprivate func updateGeometry(
            _ viewInfo: inout DisplayList.ViewUpdater.ViewInfo,
            item: DisplayList.Item,
            size: CGSize,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            clipRectChanged: Bool
        ) -> Bool {
            /*
             state = x21
             viewInfo = x19
             */
            // x25/w25
            let encoding = encoding
            var d9 = size.width
            var d8 = size.height
            let d15 = viewInfo.state.size.width
            let d14 = viewInfo.state.size.height
            
            var w22 = (d9 == d15 && d8 == d14)
            
            // <+88>
            // w26
            let transformSeed = viewInfo.seeds.transform
            // w27
            let stateTransformSeed = DisplayList.Seed(state.pointee.versions.transform)
            viewInfo.seeds.transform = stateTransformSeed
            w22 = (w22 || (transformSeed != stateTransformSeed))
            
            guard w22 || clipRectChanged else {
                return false
            }
           
            // <+148>
            // d13, d12
            var (d13, d12) = {
                let transform = state.pointee.transform
                return (transform.tx, transform.ty)
            }()
            // w24
            var w24 = viewInfo.state.flags
            var w20: Bool!
            var w23: Bool!
            var d10: CGFloat!
            var d11: CGFloat!
            
            enum Branch {
                case to556Or960
                case to1072Or588
                case to504
                case to1072
                case to728
            }
            
            var branch: Branch!
            
            if w24.contains(.unknown3) {
                // <+160>
                w23 = clipRectChanged
                // sp + 0x2e0
                let state_1 = state.pointee
                // sp + 0x158
                let state_2 = state.pointee
                // sp + 0x2a8
                let clipRect = state_2.clipRect()
                // sp + 0x430
                let state_3 = state_2
                // <+224>
                // sp + 0x8
                let state_4 = state_3
                
                if let clipRect {
                    // <+328>
                    let rect = clipRect.rect
                    d10 = rect.origin.x
                    d11 = rect.origin.y
                    d9 = rect.size.width
                    d8 = rect.size.height
                    
                    w22 = w22 || w23
                    d13 += rect.origin.x
                    d12 += rect.origin.y
                    
                    //
                    
                    if (transformSeed != stateTransformSeed) || !w23 {
                        // <+392>
                        // d0, d1
                        let position = viewInfo.state.position
                        if (d13 == position.x), (d12 == position.y) {
                            // <+504>
                            branch = .to504
                        } else {
                            // <+408>
                            // x8 = 1
                            viewInfo.state.position = CGPoint(x: d13, y: d12)
                            
                            if !w22 || (d9 == d15 && d8 == d14) {
                                // <+436>
                                w20 = false
                                w23 = true
                                
                                // x8로 인해 <+956>
                                // TODO: x8이 0이면 <+956>/<+588>
                                // <+956>
                                branch = .to556Or960
                            } else {
                                // <+1008>
                                viewInfo.state.size = CGSize(width: d9, height: d8)
                                w20 = true
                                w23 = true
                                
                                branch = .to556Or960
                            }
                        }
                    } else if w22 {
                        // <+508>
                        if (d9 == d15 && d8 == d14) {
                            // <+524>
                            w20 = false
                            w23 = false
                        } else {
                            // <+540>
                            w23 = false
                            viewInfo.state.size = CGSize(width: d9, height: d8)
                            w20 = true
                        }
                        
                        branch = .to556Or960
                    } else {
                        // <+372>
                        w22 = false
                        w20 = false
                        w23 = false
                        
                        branch = .to1072Or588
                    }
                } else {
                    // <+256>
                }
            }
            
            if branch == nil {
                // <+256>
                if w24.contains(.unknown0) {
                    // <+308>
                    d10 = 0
                    if transformSeed == stateTransformSeed {
                        // <+492>
                        if w22 {
                            d11 = 0
                            // <+540>
                            w23 = false
                            viewInfo.state.size = size
                            w20 = true
                            // <+552>
                            
                            branch = .to556Or960
                        } else {
                            // <+944>
                            w20 = false
                            w23 = false
                            d11 = 0
                            
                            branch = .to556Or960
                        }
                    } else {
                        // <+320>
                        d11 = 0
                        // <+392>
                        // d0/d1
                        let position = viewInfo.state.position
                        
                        if (d13 == position.x), (d12 == position.y) {
                            // <+504>
                            branch = .to504
                        } else {
                            // <+408>
                            // w8 = 1
                            viewInfo.state.position = CGPoint(x: d13, y: d12)
                            if !w22, (d9 == d15), (d8 == d14) {
                                // <+436>
                                w20 = false
                                w23 = true
                                // w8 = 1로 인해 <+956>로 분기
                                // <+956>
                            } else {
                                // <+1008>
                                viewInfo.state.size = size
                                w20 = true
                                // w8 = 1로 인해 <+1020>로 분기
                                w23 = true
                                // <+1024>
                            }
                            
                            // <+956>/<+1024>
                            branch = .to556Or960
                        }
                    }
                } else if transformSeed == stateTransformSeed {
                    // <+460>
                    if w22 {
                        // <+912>
                        w22 = false
                        w23 = false
                        viewInfo.state.size = size
                        w20 = true
                        d10 = 0
                        d11 = 0
                        
                        branch = .to1072Or588
                    } else {
                        // <+464>
                        w20 = false
                        w22 = false
                        w23 = false
                        d10 = 0
                        d11 = 0
                        
                        branch = .to1072Or588
                    }
                } else {
                    // <+268>
                    // d0/d1
                    let position = viewInfo.state.position
                    if position == .zero {
                        // <+908>
                        w22 = false
                        w23 = false
                        viewInfo.state.size = size
                        w20 = true
                        d10 = 0
                        d11 = 0
                        
                        branch = .to1072Or588
                    } else {
                        // <+284>
                        /*
                         w8 = 0
                         */
                        d10 = 0
                        d11 = 0
                        viewInfo.state.position = CGPoint(x: d13, y: d12)
                        
                        if w22 {
                            // <+420>
                            if (d9 == d15), (d8 == d14) {
                                // <+436>
                            } else {
                                // <+1008>
                                viewInfo.state.size = size
                                w20 = true
                                // x8 = 0으로 인해 <+1060>으로 분기
                                w22 = false
                                w23 = true
                                
                                branch = .to1072Or588
                                // fin
                            }
                        }
                        
                        if branch == nil {
                            // <+436>
                            w20 = false
                            w23 = true
                            
                            // x8 = 0이기에 <+956>로 분기
                            // <+956>
                            branch = .to556Or960
                        }
                    }
                }
            }
            
            if branch! == .to504 {
                if !w22 || ((d9 == d15) && (d8 == d14)) {
                    // <+524>
                    w20 = false
                    w23 = false
                } else {
                    // <+540>
                    w23 = false
                    viewInfo.state.size = CGSize(width: d9, height: d8)
                    w20 = true
                }
                
                branch = .to556Or960
            }
            
            if branch! == .to556Or960 {
                if w24.contains(.unknown0) {
                    // <+556>
                    w22 = true
                    if d10 == 0, d11 == 0 {
                        w24.remove(.unknown0)
                        viewInfo.state.flags = w24
                    }
                    
                    // <+584>
                    branch = .to1072Or588
                } else {
                    // <+960>
                    if d10 == 0, d11 == 0 {
                        w22 = false
                        branch = .to1072Or588
                    } else {
                        w24.remove(.unknown0)
                        viewInfo.state.flags = w24
                        w22 = true
                        branch = .to1072Or588
                    }
                }
            }
            
            assert(branch == .to1072Or588)
            branch = nil
            
            if w24.contains(.unknown2) {
                // <+1072>
                branch = .to1072
            } else if transformSeed == stateTransformSeed {
                // <+728>
                branch = .to728
            } else {
                // <+596>
                let d0 = state.pointee.transform.a
                let d1 = state.pointee.transform.b
                var w26 = true
                
                if d0 == 1, d1 == 0, (state.pointee.transform.c == 0) {
                    w26 = (state.pointee.transform.d != 1)
                    if w24.contains(.unknown1) {
                        // <+660>
                    } else {
                        branch = .to728
                        // fin
                    }
                } else {
                    // <+660>
                }
                
                if branch == nil {
                    // <+660>
                    let existing = state.pointee.transform
                    let transform = CGAffineTransform(d0, d1, existing.c, existing.d, 0, 0)
                    CoreViewSetTransform(system, viewInfo.view, transform)
                    
                    if w26 {
                        // <+704>
                        if w24.contains(.unknown1) {
                            // <+728>
                            branch = .to728
                        } else {
                            // <+708>
                            // <+724>
                            viewInfo.state.flags.insert(.unknown2)
                            // <+728>
                            branch = .to728
                        }
                    } else {
                        // <+716>
                        if w24.contains(.unknown1) {
                            // <+728>
                            branch = .to728
                            viewInfo.state.flags.remove([.unknown1, .unknown2])
                        } else {
                            // <+728>
                            branch = .to728
                        }
                    }
                }
            }
            
            if branch == .to728 {
                // <+728>
                
                let isPlatformView: Bool
                switch viewInfo.state.kind {
                case .platformView, .platformGroup, .platformLayer, .platformEffect:
                    isPlatformView = true
                default:
                    isPlatformView = false
                }
                
                CoreViewSetGeometry(
                    system,
                    viewInfo.view,
                    isPlatformView,
                    w23,
                    w22,
                    w20,
                    CGPoint(x: (d13.isNaN ? 0 : d13), y: (d12.isNaN ? 0 : d12)),
                    CGRect(
                        x: (d10.isNaN ? 0 : d10),
                        y: (d11.isNaN ? 0 : d11),
                        width: (d9.isNaN ? 0 : d9),
                        height: (d8.isNaN ? 0 : d8)
                    )
                )
                
                // <+900>
            } else if branch == .to1072 {
                if w20 || w22 {
                    // <+1088>
                    CoreViewSetSize(system, viewInfo.view, CGSize(width: d9, height: d8))
                }
                
                // <+1112>
                // x23
                let layer = viewLayer(viewInfo.view)
                layer.rasterizationScale = state.pointee.globals.pointee.environment.contentsScale
                // <+1164>
            } else {
                fatalError("unexpected")
            }
            
            // <+900>/<+1164>
            if w20 || w22 {
                // <+1180>
                if viewInfo.state.kind == .mask {
                    CoreViewSetMaskGeometry(
                        system,
                        viewInfo.view,
                        CGRect(x: d10, y: d11, width: d9, height: d8))
                }
                return true
            } else {
                // <+1172>
                return false
            }
        }
        
        fileprivate func updateShadow(
            _ viewInfo: inout DisplayList.ViewUpdater.ViewInfo,
            state: UnsafePointer<DisplayList.ViewUpdater.Model.State>,
            item: DisplayList.Item
        ) {
            /*
             state = x28
             viewInfo = x25
             */
            // x21
            if let shadow = state.pointee.shadow {
                // <+84>
                fatalError("TODO")
            } else {
                // <+648>
                // w8
                let shadowSeed = viewInfo.seeds.shadow
                let shadowVersions = state.pointee.versions.shadow
                if shadowSeed != DisplayList.Seed(shadowVersions) {
                    // <+696>
                    fatalError("TODO")
                } else {
                    // <+1620>
                    return
                }
            }
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
        
        func updateSeparatedOptions(fromKeys: [any AnySeparatedOptionKey.Type], to: SeparatedOptionValues, for: AnyObject) {
            fatalError("TODO")
        }
        
        func updateRemoteEffects(of: inout DisplayList.ViewUpdater.PlatformViewInfo, to: [RemoteEffectGroupInfo.ID: RemoteEffectGroupInfo]) {
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
        var zPosition: DisplayList.Seed
        var separatedState: DisplayList.Seed
        var separatedOptions: DisplayList.Seed
        var remoteEffects: DisplayList.Seed
        var renderingTechnique: DisplayList.Seed
        var projectiveShadow: DisplayList.Seed
        var hitTestsAsOpaque: DisplayList.Seed
        var serverResponderID: DisplayList.Seed
        
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
        var position: CGPoint
        var size: CGSize
        let kind: PlatformViewDefinition.ViewKind
        var flags: DisplayList.ViewUpdater.Platform.ViewFlags
        var platformState: DisplayList.ViewUpdater.Platform.PlatformState
        
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
        static let unknown0 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 0)
        static let unknown1 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 1)
        static let unknown2 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 2)
        static let unknown3 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 3)
        static let unknown4 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 4)
        static let unknown5 = DisplayList.ViewUpdater.Platform .ViewFlags(rawValue: 1 << 5)
        let rawValue: UInt8
        
        init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
    
    struct PlatformState {
        var separatedOptionKeys: [any AnySeparatedOptionKey.Type] = []
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
    mutating func update(
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
        
        /*
         frame.origin.x/y -> sp + 0xf0
         frame.size.width/height -> d9/d8
         version -> sp + 0xc0
         value -> sp + 0x560
         identity -> sp + 0x68
         */
        let item_1 = item
        
        // sp + 0xb0
        let platform_1 = platform
        // w23 / sp + 0x70
        let system = platform.system
        // sp + 0x68
        let identity_1 = item.identity
        // self = sp + 0x80
        // sp + 0x48
        let indexID = index.id
        // sp + 0x58
        let (archiveSerial, archiveIdentity) = (index.archiveSerial, index.archiveIdentity)
        
        // sp + 0x38
        let key = DisplayList.ViewUpdater.ViewCache.Key(id: indexID, system: PlatformViewDefinition.System(base: system), tag: tag)
        if let viewInfo = map[key] {
            // <+212>
            // viewInfo = sp + 0x2e0
            // sp + 0x380
            var viewInfo_2 = viewInfo
            
            let cacheSeed = self.cacheSeed
            guard viewInfo.cacheSeed != cacheSeed else {
                // <+4316>
                fatalError("TODO")
            }
            
            // <+364>
            viewInfo_2.cacheSeed = cacheSeed
            
            // sp + 0x4c0
            let viewInfo_3: DisplayList.ViewUpdater.ViewInfo
            if viewInfo.isRemoved {
                // <+380>
                viewInfo_3 = viewInfo
                self.removed.insert(key)
                // <+1716>
            } else {
                // <+1688>
                viewInfo_3 = viewInfo
                // <+1716>
            }
            
            // <+1716>
            // sp + 0x88 (8 bytes만)
            let seeds = viewInfo_3.seeds
            // sp + 0x90
            let parentID = viewInfo_3.parentID
            // sp + 0x420
            let viewInfo_4 = viewInfo_3
            // x20/sp + 0x78
            let oldView = viewInfo_4.view
            _ = consume viewInfo_4
            // sp + 0x420
            var map = self.map
            map.removeValue(forKey: key)
            self.map = map
            
            // <+1856>
            // id -> x9
            // sp + 0xc8
            var flag: Bool
            if seeds.item == DisplayList.Seed(item_1.version) {
                // <+1908>
                flag = viewInfo_3.nextUpdate <= state.pointee.globals.pointee.time
                viewInfo_2.nextUpdate = .infinity
            } else {
                // <+1964>
                viewInfo_2.nextUpdate = .infinity
                flag = true
            }
            
            // state -> x22
            
            // <+1992>
            if parentID != id {
                // <+1996>
                // parentID -> sp + 0x3e0
                viewInfo_2.seeds.invalidate()
                // <+2012>
            }
            
            // <+2012>
            // x19
            let platform_2 = viewInfo_3.platform
            // tag -> w28
            switch tag {
            case .item:
                // <+2144>
                // sp + 0x100
                let platform_3 = platform
                // self = x26
                // sp + 0x240
                let index = self.index
                
                // <+2176>
                // sp + 0x420
                let item_2 = item
                // sp + 0xb0
                let origin = item.frame.origin
                
                platform_3.updateItemView(&viewInfo_2, index: index, item: item_2, state: state)
                
                // <+2252>
                // origin -> q0
                // w10 -> origin.x
                // <+2460>
            case .inherited:
                // <+2028>
                // 이 과정에서 'self = x26'이어야함
                fatalError("TODO")
            }
            
            // <+2460>
            if !viewInfo_2.isInvalid {
                viewInfo_2.seeds.item = DisplayList.Seed(item_1.version)
            }
            
            // <+2512>
            if viewInfo_2.view !== oldView {
                // <+2524>
                fatalError("TODO")
            }
            
            // <+3900>
            // sp + 0x420
            let viewInfo_5 = viewInfo_2
            // sp + 0x240
            let _ = viewInfo_5
            self.map[key] = viewInfo_5
            
            // <+4044>
            // x9
            let result = DisplayList.ViewUpdater.ViewCache.Result(
                platform: viewInfo_2.platform,
                view: viewInfo_5.view,
                container: viewInfo_5.container,
                id: viewInfo_5.id,
                key: DisplayList.ViewUpdater.ViewCache.Key(
                    id: indexID,
                    system: PlatformViewDefinition.System(base: system),
                    tag: tag
                ),
                changed: flag,
                isValid: !viewInfo_5.isInvalid,
                nextUpdate: viewInfo_5.nextUpdate
            )
            
            return result
        }
        
        // <+436>
        let disableActions = CATransaction.disableActions()
        CATransaction.setDisableActions(true)
        // tag -> sp + 0xa0
        // disableActions -> sp + 0x88
        
        // sp + 0x90
        let identity_2: _DisplayList_Identity
        // sp + 0x420
        var viewInfo: DisplayList.ViewUpdater.ViewInfo
        
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
            // w21/sp + 0x508
            let identity_3 = identity_1
            // sp + 0x90
            var index_1 = index
            // sp + 0x420
            viewInfo = platform._makeItemView(item: copy_2, state: state)
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
            identity_2 = index_1.archiveIdentity
            // <+944>
        case .inherited:
            // <+500>
            fatalError("TODO")
            // <+944>
        }
        
        // <+944>
        // x27
        let platform_2 = viewInfo.platform
        // viewInfo -> x28
        // opacity~platformSeeds (sp + 0x2e0~0x300)
        let seeds = viewInfo.seeds
        // d8
        let nextUpdate = viewInfo.nextUpdate
        CATransaction.setDisableActions(disableActions)
        
        // sp + 0x4c0
        var viewInfo_2 = viewInfo
        // <+1032>에서 값 읽어와서 <+1092>에 할당
        viewInfo_2.parentID = id
        // sp + 0x380
        let viewInfo_3 = viewInfo_2
        // <+1000>
        // x21
        let container = viewInfo_2.container
        // x24
        let mapKey = DisplayList.ViewUpdater.ViewCache.Key(
            id: indexID,
            system: PlatformViewDefinition.System(base: system),
            tag: tag
        )
        
        map[key] = viewInfo_2
        
        // <+1276>
        // x19
        let reverseMapKey = OpaquePointer(Unmanaged.passUnretained(viewInfo_2.view).toOpaque())
        reverseMap.removeValue(forKey: reverseMapKey)
        reverseMap[reverseMapKey] = mapKey
        
        // <+1444>
        /*
         x23 = sp + 0x100
         x20 = sp + 0x4c0
         */
        if (identity_2.value == 0), (identity_1.value != 0) {
            // <+1472>
            viewInfo_2.layer.mySwiftUI_displayListID = Int(identity_1.value)
        }
        
        // <+1492>
        // x9 = sp + 0x380
        let _ = viewInfo
        // <+1536>
        // x8 = sp + 0x100
        // opacity~platformSeeds (sp + 0x3ea~0x3fa)
        let seeds_2 = seeds
        // sp + 0x3d8
        let _ = platform_1
        // w22
        let isInvalid = viewInfo_2.isInvalid
        let viewID = viewInfo_2.id
        // sp + 0x380
        let _ = platform_2
        
        // <+1620>
        let result = DisplayList.ViewUpdater.ViewCache.Result(
            platform: platform_2,
            view: viewInfo_2.view,
            container: container,
            id: viewID,
            key: DisplayList.ViewUpdater.ViewCache.Key(
                id: DisplayList.Index.ID(
                    identity: indexID.archiveIdentity,
                    serial: indexID.archiveSerial,
                    archiveIdentity: archiveIdentity,
                    archiveSerial: archiveSerial
                ),
                system: PlatformViewDefinition.System(base: system),
                tag: tag
            ),
            changed: true,
            isValid: !isInvalid,
            nextUpdate: nextUpdate
        )
        
        return result
    }
}

extension DisplayList.ViewUpdater.Platform {
    package enum SeparationReason {
        case separatedState
        case linkEnabled
        case affine3D
        case separatedMask
    }
}
