// EFAEDE41CB8C85EF3A6A18DC05438A3C
private import CoreGraphics
internal import QuartzCore
internal import RenderBox
private import _MySwiftUICoreShims

extension DisplayList {
    package final class GraphicsRenderer {
        private var oldCache: DisplayList.GraphicsRenderer.Cache // 0x10
        private var newCache: DisplayList.GraphicsRenderer.Cache // 0x20
        private var index: DisplayList.Index // 0x30
        private var time: Time // 0x48
        private var nextTime: Time // 0x50
        var stableIDs: _DisplayList_StableIdentityMap? // 0x58
        private var inTransitionGroup: Bool // 0x60
        private var stateHashes: [StrongHash] // 0x68
        var platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode // 0x70
        private var placeholderUserInfo: [CodingUserInfoKey: Any]? // 0x78
        private var rbEncoderSet: RBEncoderSet? // 0x80
        
        init(platformViewMode: DisplayList.GraphicsRenderer.PlatformViewMode) {
            self.oldCache = DisplayList.GraphicsRenderer.Cache(callbacks: [:], animators: [:])
            self.newCache = DisplayList.GraphicsRenderer.Cache(callbacks: [:], animators: [:])
            self.index = DisplayList.Index()
            self.time = Time.zero
            self.nextTime = Time.infinity
            self.stableIDs = nil
            self.inTransitionGroup = false
            self.stateHashes = []
            self.placeholderUserInfo = nil
            self.rbEncoderSet = nil
            self.platformViewMode = platformViewMode
            self.index.enter(identity: _DisplayList_Identity())
        }
        
        func render(at time: Time, do body: () -> ()) {
            assertUnimplemented()
        }
        
        func render(list: DisplayList, in context: inout GraphicsContext) {
            let identifier = context.storage.state.identifier
            
            let identifierNamespace2 = unsafe UUID(
                uuid: unsafeBitCast(context.storage.state.identifierNamespace2, to: uuid_t.self)
            )
            
            for item in list.items {
                // <+112>
                // item -> sp + 0x70
                let oldIndex = self.index.enter(identity: item.identity)
                
                if item.identity == .none {
                    // <+404>
                } else {
                    // <+172>
                    if let stableIDs, let existing = stableIDs[item.identity] {
                        // <+220>
                        let rbHash = RBHash(
                            v0: existing.hash.words.0,
                            v1: existing.hash.words.1,
                            v2: existing.hash.words.2,
                            v3: existing.hash.words.3
                        )
                        
                        let rbUUID = RBUUID.fromHash(rbHash, version: 5)
                        context.setIdentifier(existing.serial, in: rbUUID)
                    } else {
                        // <+328>
                        context.identifier = item.identity.value
                    }
                }
                
                self.render(item: item, in: &context)
                self.index.leave(index: oldIndex)
            }
            
            context.setIdentifier(identifier, in: identifierNamespace2)
        }
        
        func render(item: DisplayList.Item, in context: inout GraphicsContext) {
            /*
             self -> x20 -> x22
             item -> x0 -> x20
             context -> x1 -> x24
             */
            // <+164>
            // x19 + 0x390 (sp + 0x3d0)
            let copy_1 = item
            
            switch copy_1.value {
            case .content(let content):
                // <+228>
                switch content.value {
                case .backdrop(let effect):
                    // <+256>
                    var context = context
                    
                    for filter in effect.filters.reversed() {
                        context.addFilter(filter, in: CGRect(origin: .zero, size: copy_1.frame.size))
                    }
                    
                    // <+9092>
                    context.draw(
                        Path(copy_1.frame),
                        with: GraphicsContext.Shading(storage: .backdrop(effect.color)),
                        style: .fill(FillStyle(eoFill: false, antialiased: true))
                    )
                    
                    // <+12424>
                    return
                case .color(let colorView):
                    // <+3736>
                    context.draw(
                        Path(copy_1.frame),
                        with: .color(colorView.color),
                        style: .fill(FillStyle(eoFill: false, antialiased: colorView.isAntialiased))
                    )
                    
                    return
                case .chameleonColor(let chameleonColor):
                    // <+3844>
                    var context = context
                    
                    for filter in chameleonColor.filters.reversed() {
                        context.addFilter(filter, in: CGRect(origin: .zero, size: copy_1.frame.size))
                    }
                    
                    // <+9028>
                    context.draw(
                        Path(copy_1.frame),
                        with: .color(chameleonColor.fallback),
                        style: .fill(FillStyle(eoFill: false, antialiased: true))
                    )
                    
                    return
                case .image(let image):
                    // <+3308>
                    context.draw(
                        image,
                        in: copy_1.frame,
                        style: FillStyle(eoFill: false, antialiased: true),
                        shading: nil
                    )
                    
                    return
                case .shape(let path, let paint, let fillStyle):
                    // <+4160>
                    let w8 = (copy_1.frame.origin.x == 0)
                    let w22 = (copy_1.frame.origin.y != 0) ? false : w8
                    
                    if !w22 {
                        // <+8356>
                        context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                        // <+8388>
                    } else {
                        // <+8388>
                    }
                    
                    // <+8388>
                    paint.draw(
                        path: path,
                        style: .fill(fillStyle),
                        in: context,
                        bounds: CGRect(origin: .zero, size: copy_1.frame.size)
                    )
                    
                    if !w22 {
                        context.translateBy(x: -copy_1.frame.origin.x, y: -copy_1.frame.origin.y)
                        // <+12440>
                    } else {
                        // <+12440>
                    }
                    
                    // <+12440>
                    return
                case .sdfShape(let shape):
                    // <+4328>
                    var context = context
                    
                    let d0 = shape.origin.x
                    let d1 = shape.origin.y
                    let d2 = copy_1.frame.origin.x
                    let d3 = copy_1.frame.origin.y
                    let d10 = d2 - d0
                    let d11 = d3 - d1
                    
                    if (d10 != 0) || (d11 != 0) {
                        // <+8152>
                        context.translateBy(x: d10, y: d11)
                        // <+8236>
                    } else {
                        // <+8236>
                    }
                    
                    // <+8236>
                    context.fillSDF(
                        of: shape.path,
                        with: shape.style,
                        ovalization: shape.ovalization,
                        bounds: nil,
                        context: nil
                    )
                    
                    return
                case .sdfMask(let list, let layer):
                    // <+4064>
                    var context = context
                    if (copy_1.frame.origin.x != 0) || (copy_1.frame.origin.y != 0) {
                        // <+7980>
                        context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                        // <+8048>
                    } else {
                        // <+8048>
                    }
                    
                    let renderer = DisplayListSDFRenderer(
                        list: list,
                        renderer: self
                    )
                    
                    context.drawSDFStyle(
                        layer.style,
                        ovalization: layer.ovalizationAmount,
                        renderer: renderer,
                        bounds: { 
                            return copy_1.frame
                        },
                        content: nil
                    )
                    
                    return
                case .shadow(let path, let style):
                    // <+4528>
                    var context = context
                    
                    if (copy_1.frame.origin.x != 0) || (copy_1.frame.origin.y != 0) {
                        // <+8496>
                        context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                        // <+8556>
                    } else {
                        // <+8556>
                    }
                    
                    // <+8556>
                    // inlined
                    context.addFilter(
                        GraphicsContext.Filter(
                            storage: .resolvedShadow(
                                GraphicsContext.Filter.ResolvedShadow(
                                    color: style.color,
                                    radius: style.radius,
                                    offset: style.offset,
                                    midpoint: style.midpoint,
                                    blend: context.blendMode,
                                    options: .shadowOnly
                                )
                            )
                        ),
                        options: [] // 알 수 없음
                    )
                    
                    context.draw(
                        path,
                        with: GraphicsContext.ResolvedShading.color(.white),
                        style: .fill(FillStyle(eoFill: false, antialiased: true))
                    )
                    
                    return
                case .platformView(let factory):
                    // <+3588>
                    self.drawImplicitLayer(in: &context) { context in
                        // $s7SwiftUI11DisplayListV16GraphicsRendererC6render4item2inyAC4ItemV_AA0E7ContextVztFyALzXEfU0_TA
                        if (copy_1.frame.origin.x != 0) || (copy_1.frame.origin.y != 0) {
                            context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                        }
                        
                        factory.renderPlatformView(in: context, size: copy_1.frame.size, renderer: self)
                    }
                    
                    return
                case .platformLayer(let factory):
                    // <+4456>
                    let w8 = (copy_1.frame.origin.x == 0)
                    let w23 = (copy_1.frame.origin.y != 0) ? false : w8
                    
                    if !w23 {
                        context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                    }
                    
                    factory.renderPlatformLayer(in: context, size: copy_1.frame.size, renderer: self)
                    
                    if !w23 {
                        context.translateBy(x: -copy_1.frame.origin.x, y: -copy_1.frame.origin.y)
                    }
                    
                    return
                case .text(let text, let size):
                    // <+3096>
                    if
                        self.placeholderUserInfo != nil,
                        text.text.needsDynamicRenderingInArchive
                    {
                        context.draw(text.text, size: size)
                        return
                    } else {
                        // <+10404>
                        self.drawImplicitLayer(in: &context) { context in
                            if (copy_1.frame.origin.x != 0) || (copy_1.frame.origin.y != 0) {
                                context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                            }
                            
                            let d0 = round(context.userToDeviceScale)
                            let d1: CGFloat = 1
                            let d10 = d0.isNaN ? d1 : max(d0, d1)
                            
                            let key = DisplayList.GraphicsRenderer.Cache.CallbackKey(
                                index: self.index.id,
                                seed: content.seed,
                                scale: d10
                            )
                            
                            let callback: (any RBDisplayListContents)
                            if let existing = self.oldCache.callbacks[key] {
                                callback = existing
                            } else {
                                callback = {
                                    // $s7SwiftUI11DisplayListV16GraphicsRendererC6render4item2inyAC4ItemV_AA0E7ContextVztFyALzXEfU1_So09RBDisplayD8Contents_pyKXEfu_SoAM_pyXEfU_
                                    let displayList = RBDisplayList()
                                    displayList.defaultColorSpace = context.storage.state.defaultColorSpace
                                    displayList.deviceScale = d10
                                    
                                    let state = RBDisplayListGetState(displayList)
                                    
                                    let cgContext = unsafe state.beginCGContext(
                                        alpha: 1,
                                        flags: []
                                    ).takeUnretainedValue()
                                    
                                    let msuiContext = CoreGraphicsContext(cgContext: cgContext)
                                    msuiContext.push()
                                    
                                    let textContext = TextDrawingContext.shared
                                    
                                    text.text.draw(
                                        in: CGRect(origin: .zero, size: size),
                                        with: size,
                                        applyingMarginOffsets: true,
                                        context: textContext,
                                        renderer: text.renderer
                                    )
                                    
                                    msuiContext.pop()
                                    state.endCGContext()
                                    
                                    return displayList.moveContents()
                                }()
                            }
                            
                            self.newCache.callbacks[key] = callback
                            context.storage.state.drawDisplayList(callback)
                        }
                        
                        return
                    }
                case .flattened(let list, let point, let options):
                    // <+3508>
                    let d8 = copy_1.frame.origin.x - point.x
                    let d9 = copy_1.frame.origin.y - point.y
                    
                    if options.flags.contains(.requiresLayer) {
                        // <+7636>
                        // inlined
                        context.drawLayer(flags: []) { context in
                            if (d8 != 0) || (d9 != 0) {
                                context.translateBy(x: d8, y: d9)
                            }
                            
                            self.render(list: list, in: &context)
                        }
                        
                        return
                    } else {
                        // <+3548>
                        let w8 = (d8 == 0)
                        let w22 = (d9 != 0) ? false : w8
                        
                        if !w22 {
                            context.translateBy(x: d8, y: d9)
                        }
                        
                        self.render(list: list, in: &context)
                        
                        if !w22 {
                            context.translateBy(x: -d8, y: -d9)
                        }
                        
                        return
                    }
                case .drawing(let contents, let point, let options):
                    // <+4248>
                    let d8 = copy_1.frame.origin.x - point.x
                    let d9 = copy_1.frame.origin.y - point.y
                    
                    if options.flags.contains(.requiresLayer) {
                        // <+8796>
                        self.drawImplicitLayer(in: &context) { context in
                            if (d8 != 0) || (d9 != 0) {
                                context.translateBy(x: d8, y: d9)
                            }
                            
                            context.storage.state.drawDisplayList2(
                                contents: contents,
                                opacity: context.storage.opacity
                            )
                        }
                        
                        return
                    } else {
                        // <+4284>
                        let w8 = (d8 == 0)
                        let w21 = (d9 != 0) ? false : w8
                        
                        if !w21 {
                            context.translateBy(x: d8, y: d9)
                        }
                        
                        context.storage.state.drawDisplayList2(
                            contents: contents,
                            opacity: context.storage.opacity
                        )
                        
                        if !w21 {
                            context.translateBy(x: -d8, y: -d9)
                        }
                        
                        return
                    }
                case .view(let factory):
                    // <+2860>
                    guard
                        let placeholderUserInfo,
                        let placeholder = FactoryViewPlaceholder(factory: factory, userInfo: placeholderUserInfo)
                    else {
                        return
                    }
                   
                    // <+3060>
                    context.drawPlaceholder(placeholder)
                    return
                case .placeholder(_):
                    // <+12440>
                    return
                }
            case .effect(var effect, let list):
                // <+628>
                var w8 = (copy_1.frame.origin.x == 0)
                w8 = (copy_1.frame.origin.y != 0) ? false : w8
                
                if !w8 {
                    context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                }
                
                // <+736>
                if (self.placeholderUserInfo == nil), case .animation(let animation) = effect {
                    let key = DisplayList.GraphicsRenderer.Cache.AnimatorKey(index: self.index.id)
                    
                    let animator: any _DisplayList_AnyEffectAnimator
                    if let existing = self.oldCache.animators[key] {
                        animator = existing
                    } else {
                        animator = animation.makeAnimator()
                    }
                    
                    let (_effect, finished) = animator.evaluate(animation, at: self.time, size: copy_1.size)
                    effect = _effect
                    
                    if !finished {
                        self.nextTime = self.time
                    }
                    
                    self.newCache.animators[key] = animator
                }
                
                // <+2588>
                switch effect {
                case .backdropGroup(_):
                    // <+2620>
                    // <+11340>
                    self.render(list: list, in: &context)
                case .archive(let archiveIDs):
                    // <+5916>
                    let oldStableIDs = self.stableIDs
                    if let archiveIDs {
                        // <+9816>
                        self.stableIDs = archiveIDs.stableIDs
                    } else {
                        // <+6032>
                        self.stableIDs = nil
                        // <+9872>
                    }
                    
                    self.index.updateArchive(entering: (archiveIDs != nil))
                    self.render(list: list, in: &context)
                    self.stableIDs = oldStableIDs
                case .properties(let properties):
                    // <+2620>
                    if self.placeholderUserInfo != nil {
                        // <+4636>
                        var context = context
                        let placeholder = DisplayList.PropertiesPlaceholder(properties: properties)
                        
                        // <+9692>
                        context.addPlaceholderStyle(placeholder)
                        context.drawLayer(flags: [.unknown5]) { context in
                            self.render(list: list, in: &context)
                        }
                        
                        // <+11384>
                    } else {
                        // <+11340>
                        self.render(list: list, in: &context)
                    }
                case .platformGroup(let factory):
                    // <+5240>
                    factory.renderPlatformGroup(list, in: context, size: copy_1.frame.size, renderer: self)
                case .opacity(let opacity):
                    // <+5812>
                    var context = context
                    context._opacity = context.storage.opacity * opacity
                    self.render(list: list, in: &context)
                case .blendMode(let blendMode):
                    // <+4872>
                    var context = context
                    context.blendMode = GraphicsContext.BlendMode(blendMode)
                    self.render(list: list, in: &context)
                case .clip(let path, let fillStyle, let options):
                    // <+5012>
                    var context = context
                    context.clip(to: path, style: fillStyle, options: options)
                    self.render(list: list, in: &context)
                case .mask(let displayList, let options):
                    // <+5604>
                    var context = context
                    context.clipToLayer(
                        opacity: 1,
                        options: options
                    ) { context in
                        self.render(list: displayList, in: &context)
                    }
                    
                    self.render(list: list, in: &context)
                case .sdfShape(let shape):
                    // <+6936>
                    var context = context
                    
                    context.fillSDF(
                        of: shape.path,
                        with: shape.style,
                        ovalization: shape.ovalization,
                        bounds: nil,
                        context: { context in
                            // $s7SwiftUI11DisplayListV16GraphicsRendererC6render4item2inyAC4ItemV_AA0E7ContextVztFyALzcfU8_TA
                            self.render(list: list, in: &context)
                        }
                    )
                case .transform(let transform):
                    // <+5392>
                    var context = context
                    
                    switch transform {
                    case .affine(let transform):
                        // <+11192>
                        context.concatenate(transform)
                    case .projection(let transform):
                        // <+12992>
                        context.addFilter(.projectionTransform(transform), options: [] /* 알 수 없음 */)
                    case .affine3D(let transform):
                        // <+12740>
                        context.concatenate(CGAffineTransform(transform))
                    case .rotation(let data):
                        // <+5528>
                        context.addFilter(GraphicsContext.Filter(storage: .rotation(data)), options: [] /* 알 수 없음 */)
                    case .rotation3D(let data):
                        // <+12860>
                        context.addFilter(GraphicsContext.Filter(storage: .rotation3D(data)), options: [] /* 알 수 없음 */)
                    }
                    
                    self.render(list: list, in: &context)
                case .filter(let filter):
                    // <+7300>
                    var context = context
                    
                    if case .vibrantColorMatrix(let matrix) = filter {
                        // <+7408>
                        context.clipToLayer(opacity: 1, options: []) { context in
                            self.render(list: list, in: &context)
                        }
                        
                        context.addFilter(
                            GraphicsContext.Filter(
                                storage: .colorMatrix(matrix.matrix, premultiplied: false)
                            ),
                            options: [] // 정확히 알 수 없지만 linearColor는 없음
                        )
                        
                        // <+12588>
                        context.draw(
                            Path(context.clipBoundingRect),
                            with: .backdrop(.clear),
                            style: .fill(FillStyle(eoFill: false, antialiased: true))
                        )
                    } else {
                        // <+10212>
                        context.addFilter(filter, in: CGRect(origin: .zero, size: copy_1.frame.size))
                        self.render(list: list, in: &context)
                    }
                case .animation(let animation):
                    // <+2620>
                    if self.placeholderUserInfo != nil {
                        // <+2660>
                        var context = context
                        let placeholder = DisplayList.AnimationPlaceholder(
                            animation: animation,
                            size: copy_1.frame.size
                        )
                        
                        context.addPlaceholderStyle(placeholder)
                        context.drawLayer(flags: [.unknown5]) { context in
                            self.render(list: list, in: &context)
                        }
                        
                        // <+11384>
                    } else {
                        // <+11340>
                        self.render(list: list, in: &context)
                    }
                case .contentTransition(let state):
                    // <+6080>
                    var context = context
                    let oldInTransitionGroup = self.inTransitionGroup
                    
                    if state.options.intersection([.formsGroup, .implicitGroup]).isEmpty {
                        // <+11448>
                        self.render(list: list, in: &context)
                    } else {
                        // <+6152>
                        context.setTransition(state.transition)
                        
                        let formsGroup = state.options.contains(.formsGroup)
                        self.inTransitionGroup = self.inTransitionGroup || formsGroup
                        
                        if formsGroup {
                            // <+6332>
                            context.drawLayer(flags: [.unknown5]) { context in
                                self.render(list: list, in: &context)
                            }
                        } else {
                            // <+11496>
                            self.render(list: list, in: &context)
                        }
                    }
                    
                    // <+11568>
                    self.inTransitionGroup = oldInTransitionGroup
                case .view(let factory):
                    // <+2620>
                    if let placeholderUserInfo {
                        // <+4696>
                        if let placeholder = FactoryStylePlaceholder(factory: factory, userInfo: placeholderUserInfo) {
                            var context = context
                            context.addPlaceholderStyle(placeholder)
                            context.drawLayer(flags: [.unknown5]) { context in
                                self.render(list: list, in: &context)
                            }
                            
                            // <+11384>
                        } else {
                            // <+11320>
                            self.render(list: list, in: &context)
                        }
                        // <+11384>
                    } else {
                        // <+11340>
                        self.render(list: list, in: &context)
                    }
                case .accessibility(let accessibilityEffect):
                    // <+2620>
                    if self.placeholderUserInfo != nil {
                        // <+2788>
                        var context = context
                        switch accessibilityEffect {
                        case .attachments(let attachments):
                            let placeholder = AccessibilityAttachmentsPlaceholder(attachments: attachments)
                            
                            context.addPlaceholderStyle(placeholder)
                            context.drawLayer(flags: [.unknown5]) { context in
                                self.render(list: list, in: &context)
                            }
                            
                            // <+11384>
                        case .representation(let displayList):
                            // <+9344>
                            let rbDisplayList = RBDisplayList()
                            rbDisplayList.defaultColorSpace = context.storage.state.defaultColorSpace
                            var anotherContext = GraphicsContext(displayList: rbDisplayList, environment: context.environment)
                            self.render(list: displayList, in: &anotherContext)
                            let contents = rbDisplayList.moveContents()
                            
                            if let rbEncoderSet {
                                rbEncoderSet.addDisplayList(contents)
                            }
                            
                            let placeholder = AccessibilityRepresentationPlaceholder(representation: contents)
                            context.addPlaceholderStyle(placeholder)
                            context.drawLayer(flags: [.unknown5]) { context in
                                self.render(list: list, in: &context)
                            }
                            
                            // <+11384>
                        }
                        // <+11384>
                    } else {
                        // <+11340>
                        self.render(list: list, in: &context)
                    }
                case .platform(_):
                    // <+2620>
                    // <+11340>
                    self.render(list: list, in: &context)
                case .state(let hash):
                    // <+6656>
                    self.stateHashes.append(hash)
                    self.render(list: list, in: &context)
                    self.stateHashes.removeLast()
                case .interpolatorRoot(_, _, _):
                    // <+2620>
                    self.render(list: list, in: &context)
                case .interpolatorLayer(_, _):
                    // <+2620>
                    self.render(list: list, in: &context)
                case .interpolatorAnimation(let animation):
                    // <+7212>
                    var context = context
                    context.addInterpolatorAnimation(animation)
                    context.drawLayer(flags: [.unknown5]) { context in
                        self.render(list: list, in: &context)
                    }
                case .identity:
                    // <+6440>
                    // <+2620>
                    self.render(list: list, in: &context)
                case .geometryGroup:
                    // <+6468>
                    var context = context
                    context.addAffineTransformStyle()
                    context.drawLayer(flags: [.unknown5]) { context in
                        self.render(list: list, in: &context)
                    }
                case .compositingGroup:
                    // <+12520>
                    context.drawLayer(flags: []) { context in
                        self.render(list: list, in: &context)
                    }
                }
                
                if !w8 {
                    context.translateBy(x: -copy_1.frame.origin.x, y: -copy_1.frame.origin.y)
                }
                
                return
            case .states(let states):
                // <+488>
                if let lastHash = self.stateHashes.popLast() {
                    // <+1616>
                    for state in states {
                        if state.0 == lastHash {
                            if (copy_1.frame.origin.x != 0) || (copy_1.frame.origin.y != 0) {
                                // <+1968>
                                context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                                self.render(list: state.1, in: &context)
                                context.translateBy(x: -copy_1.frame.origin.x, y: -copy_1.frame.origin.y)
                            } else {
                                self.render(list: state.1, in: &context)
                            }
                            
                            break
                        }
                    }
                    
                    // <+1848>
                    self.stateHashes.append(lastHash)
                    return
                } else {
                    // <+900>
                    if self.placeholderUserInfo != nil {
                        // <+928>
                        let rbDisplayList = RBDisplayList()
                        rbDisplayList.defaultColorSpace = context.storage.state.defaultColorSpace
                        
                        var contents: [(StrongHash, any RBDisplayListContents)] = []
                        
                        if !states.isEmpty {
                            contents.reserveCapacity(states.count)
                            
                            for state in states {
                                // <+1104>
                                var newContext = GraphicsContext(
                                    displayList: rbDisplayList,
                                    environment: context.environment
                                )
                                
                                self.render(list: state.1, in: &newContext)
                                let _contents = rbDisplayList.moveContents()
                                
                                if let rbEncoderSet {
                                    rbEncoderSet.addDisplayList(_contents)
                                }
                                
                                contents.append((state.0, _contents))
                            }
                        }
                        
                        // <+2108>
                        let w8 = (copy_1.frame.origin.x == 0)
                        let w21 = (copy_1.frame.origin.y != 0) ? false : w8
                        
                        if !w21 {
                            context.translateBy(x: copy_1.frame.origin.x, y: copy_1.frame.origin.y)
                        }
                        
                        let placeholder = DisplayList.StatesPlaceholder(states: contents)
                        context.drawPlaceholder(placeholder)
                        
                        if !w21 {
                            context.translateBy(x: -copy_1.frame.origin.x, y: -copy_1.frame.origin.y)
                        }
                        
                        return
                    } else {
                        // <+12448>
                        return
                    }
                }
            case .empty:
                // <+12448>
                return
            }
        }
        
        func renderDisplayList(_ list: DisplayList, at time: Time, in context: inout GraphicsContext) {
            let index = self.index
            self.time = time
            self.nextTime = .infinity
            
            self.render(list: list, in: &context)
            
            self.oldCache.callbacks = [:]
            let newCache = self.newCache
            self.newCache = DisplayList.GraphicsRenderer.Cache(callbacks: [:], animators: [:])
            self.oldCache = newCache
            self.index = index
        }
        
        func drawImplicitLayer(in context: inout GraphicsContext, content: (inout GraphicsContext) -> ()) {
            let old = self.inTransitionGroup
            self.inTransitionGroup = false
            
            context.drawLayer(flags: old ? [] : [.unknown4]) { context in
                content(&context)
            }
            
            self.inTransitionGroup = old
        }
        
        func drawPlatformLayer(_ layer: CALayer, in context: GraphicsContext, size: CGSize, update: Bool) {
            assertUnimplemented()
        }
        
        func renderPlatformView(_ view: Any?, in context: GraphicsContext, size: CGSize, viewType: Any.Type) {
            assertUnimplemented()
        }
    }
}
extension DisplayList.GraphicsRenderer {
    enum PlatformViewMode {
        case rendered(update: Bool) // 0/1
        case ignored // 2
        case unsupported // 3
    }
    
    fileprivate struct Cache {
        var callbacks: [DisplayList.GraphicsRenderer.Cache.CallbackKey: any RBDisplayListContents]
        var animators: [DisplayList.GraphicsRenderer.Cache.AnimatorKey: any _DisplayList_AnyEffectAnimator]
    }
}

extension DisplayList.GraphicsRenderer.Cache {
    fileprivate struct AnimatorKey : Hashable {
        private(set) var index: DisplayList.Index.ID
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey, rhs: DisplayList.GraphicsRenderer.Cache.AnimatorKey) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
    
    fileprivate struct CallbackKey : Hashable {
        private(set) var index: DisplayList.Index.ID
        private(set) var seed: DisplayList.Seed
        private(set) var scale: CGFloat
        
        static func == (lhs: DisplayList.GraphicsRenderer.Cache.CallbackKey, rhs: DisplayList.GraphicsRenderer.Cache.CallbackKey) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
    }
}

// nominal type descriptor가 없음
fileprivate struct DisplayListSDFRenderer : SDFRenderer {
    let list: DisplayList
    let renderer: DisplayList.GraphicsRenderer
    
    func drawSDF(in context: inout GraphicsContext, distanceRange: ClosedRange<CGFloat>, gradient: SDFGradient, ovalization: Float) {
        assertUnimplemented()
    }
    
    func fillShape(in: inout GraphicsContext, color: Color.ResolvedHDR) {
        assertUnimplemented()
    }
    
    func clipToShape(in context: inout GraphicsContext) {
        assertUnimplemented()
    }
}

extension DisplayList {
    final class PropertiesPlaceholder: NSObject, RBPlaceholderStyle {
        private let properties: DisplayList.Properties
        
        var identifier: String? {
            assertUnimplemented()
        }
        
        func boundingRect(for content: any RBPlaceholderStyleContent) -> CGRect {
            assertUnimplemented()
        }
        
        func draw(inState state: RBDrawingState, content: any RBPlaceholderStyleContent) {
            assertUnimplemented()
        }
        
        func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
            assertUnimplemented()
        }
        
        init(properties: DisplayList.Properties) {
            self.properties = properties
            super.init()
        }
    }
    
    final class AnimationPlaceholder: NSObject, RBPlaceholderStyle {
        private let animation: any _DisplayList_AnyEffectAnimation
        private let size: CGSize
        
        init(animation: any _DisplayList_AnyEffectAnimation, size: CGSize) {
            self.animation = animation
            self.size = size
            super.init()
        }
        
        var identifier: String? {
            assertUnimplemented()
        }
        
        func boundingRect(for content: any RBPlaceholderStyleContent) -> CGRect {
            assertUnimplemented()
        }
        
        func draw(inState state: RBDrawingState, content: any RBPlaceholderStyleContent) {
            assertUnimplemented()
        }
        
        func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
            assertUnimplemented()
        }
    }
    
    final class StatesPlaceholder: NSObject, RBPlaceholderDrawingOperation {
        private let states: [(StrongHash, any RBDisplayListContents)]
        
        init(states: [(StrongHash, any RBDisplayListContents)]) {
            self.states = states
            super.init()
        }
        
        var identifier: String? {
            assertUnimplemented()
        }
        
        var boundingRect: CGRect {
            assertUnimplemented()
        }
        
        func draw(inState state: RBDrawingState) {
            assertUnimplemented()
        }
        
        func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
            assertUnimplemented()
        }
    }
}

final class AccessibilityAttachmentsPlaceholder: NSObject, RBPlaceholderStyle {
    private let attachments: [AccessibilityNodeAttachment]
    
    init(attachments: [AccessibilityNodeAttachment]) {
        self.attachments = attachments
        super.init()
    }
    
    var identifier: String? {
        assertUnimplemented()
    }
    
    func boundingRect(for content: any RBPlaceholderStyleContent) -> CGRect {
        assertUnimplemented()
    }
    
    func draw(inState state: RBDrawingState, content: any RBPlaceholderStyleContent) {
        assertUnimplemented()
    }
    
    func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
        assertUnimplemented()
    }
}

final class AccessibilityRepresentationPlaceholder: NSObject, RBPlaceholderStyle {
    private let representation: any RBDisplayListContents
    
    init(representation: any RBDisplayListContents) {
        self.representation = representation
        super.init()
    }
    
    var identifier: String? {
        assertUnimplemented()
    }
    
    func boundingRect(for content: any RBPlaceholderStyleContent) -> CGRect {
        assertUnimplemented()
    }
    
    func draw(inState state: RBDrawingState, content: any RBPlaceholderStyleContent) {
        assertUnimplemented()
    }
    
    func encodedData(delegate: (any RBEncoderDelegate)?) throws -> Data {
        assertUnimplemented()
    }
}
