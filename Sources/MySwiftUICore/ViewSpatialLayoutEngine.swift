// 182E3E8D4B483E7956A2DBDA9F7535A2
internal import Spatial
private import _MySwiftUIShims
internal import CoreGraphics

struct ViewSpatialLayoutEngine<L : SpatialLayout> : SpatialLayoutEngine, DefaultSpatialAlignmentFunctions {
    typealias Cache3D = L.Cache3D
    
    private var layout: L
    private let layoutContext: SizeAndSpacingContext // 0x24
    private var children: LayoutProxyCollection // 0x28
    private var layoutDirection: LayoutDirection // 0x2c
    private var cache: L.Cache3D // 0x30
    private var volumeCache = ViewVolumeCache() // 0x34
    private var cachedAlignmentVolume = ViewSize3D.zero // 0x38
    private var cachedAlignmentGeometry: [ViewGeometry3D] = [] // 0x3c
    private var cachedAlignment = Cache3<ObjectIdentifier, CGFloat?>() // 0x40
    private var preferredSpacing: Spacing3D? = nil // 0x44
    
    init(layout: L, layoutContext: SizeAndSpacingContext, children: LayoutProxyCollection) {
        // <+256>
        self.layout = layout
        self.layoutContext = layoutContext
        self.children = children
        
        // <+320>
        let layoutDirection = layoutContext.layoutDirection
        self.layoutDirection = layoutDirection
        
        let subviews = SpatialLayoutSubviews(
            subviews: LayoutSubviews(
                context: children.context,
                attributes: children.attributes,
                layoutDirection: layoutDirection
            )
        )
        self.cache = layout.makeCache(subviews: subviews)
    }
    
    mutating func update(layout: L, context: SizeAndSpacingContext, children: LayoutProxyCollection) {
        /*
         self -> x20 -> x19
         layout -> x0 -> x21
         context -> x1 -> dead
         children -> x2 -> w25/x20
         */
        self.children = children
        
        // <+108>
        self.layoutDirection = context.layoutDirection
        
        // <+356>
        self.layout = layout
        self.volumeCache = ViewVolumeCache()
        self.cachedAlignmentGeometry = []
        self.cachedAlignment = Cache3<ObjectIdentifier, CGFloat?>()
        self.preferredSpacing = nil
        
        layout.updateCache(
            &self.cache,
            subviews: SpatialLayoutSubviews(
                subviews: LayoutSubviews(
                    context: children.context,
                    attributes: children.attributes,
                    layoutDirection: layoutDirection
                )
            )
        )
    }
    
    mutating func volumeThatFits(_ size: _ProposedSize3D) -> Size3D {
        return self.volumeCache.get(size) { 
            // $s7SwiftUI23ViewSpatialLayoutEngineV14volumeThatFitsySo8SPSize3DaAA15_ProposedSize3DVFAFyXEfU_TA
            let subviews = SpatialLayoutSubviews(
                subviews: LayoutSubviews(
                    context: children.context,
                    attributes: children.attributes,
                    layoutDirection: layoutDirection
                )
            )
            
            return self.layout.volumeThatFits(
                proposal: size,
                subviews: subviews,
                cache: &self.cache
            )
        }
    }
    
    func layoutPriority() -> Double {
        assertUnimplemented()
    }
    
    mutating func spacing() -> Spacing3D {
        if let preferredSpacing {
            return preferredSpacing
        }
        
        let subviews = SpatialLayoutSubviews(
            subviews: LayoutSubviews(
                context: children.context,
                attributes: children.attributes,
                layoutDirection: layoutDirection
            )
        )
        
        let spacing = self.layout.spacing(subviews: subviews, cache: &self.cache)
        self.preferredSpacing = spacing.spacing
        return self.preferredSpacing!
    }
    
    mutating func childGeometries3D(at size: ViewSize3D, origin: Point3D) -> [ViewGeometry3D] {
        /*
         self -> x20 -> x19
         L -> x1 -> x21
         size -> x0
         origin -> d0/d1/d2
         */
        // x29 - 0xf0
        let copy_1 = size
        // sp + 0x8
        let count = self.children.count
        
        if
            (self.cachedAlignmentVolume == copy_1) &&
            origin.isZero &&
            self.cachedAlignmentGeometry.count == count
        {
            return self.cachedAlignmentGeometry
        }
        
        // sp + 0xe0
        let copy_2 = origin
        // sp + 0x100
        let copy_3 = size.value
        // x29 - 0xf0
        let copy_4 = size
        // sp + 0x120
        let proposal = copy_4.proposal
        
        // <+248>
        // w23
        let layoutDirection = self.layoutDirection
        // x29 - 0xf0
        let invalidValue = ViewGeometry3D.invalidValue
        // sp + 0x10
        let _ = invalidValue
        // x20
        let geometries = Array<ViewGeometry3D>(repeating: invalidValue, count: count)
        
        // <+360>
        // sp + 0x80
        var data = SpatialPlacementData(
            geometries: geometries,
            unknown0: 0,
            origin: copy_2,
            size: copy_3,
            layoutDirection: layoutDirection,
            flag: false
        )
        
        unsafe data.asCurrent { pointer in
            // $s7SwiftUI23ViewSpatialLayoutEngineV17childGeometries3D2at8origin3DSayAA0C10Geometry3DVGAA0C6Size3DV_So9SPPoint3DatFySpyAA0D13PlacementData031_182E3E8D4B483E7956A2DBDA9F7535U0LLVGXEfU_
            /*
             pointer -> x0 -> x24
             self -> x1 -> x27
             copy_2 + copy_3 -> x2 -> x19 + 0x40
             proposal -> x3 -> x22
             count -> x4 -> x25
             */
            // <+176>
            self.layout.placeSubviews(
                in: Rect3D(origin: copy_2, size: copy_3),
                proposal: proposal,
                subviews: SpatialLayoutSubviews(
                    subviews: LayoutSubviews(
                        context: self.children.context,
                        attributes: self.children.attributes,
                        layoutDirection: self.layoutDirection
                    )
                ),
                cache: &self.cache
            )
            
            // <+368>
            if unsafe pointer.pointee.unknown0 == count {
                return
            }
            
            for i in 0..<count {
                // <+436>
                guard unsafe pointer.pointee.geometries[i].isInvalid else {
                    continue
                }
                
                // x19 + 0x50 -> x19 + 0xf0
                let dimensions3D = self.children[i].dimensions3D(in: proposal)
                
                // <+584>
                var d0: CGFloat
                var d1: CGFloat
                var d2: CGFloat
                var d3: CGFloat
                let d4: CGFloat
                let d5: CGFloat
                do {
                    let origin = unsafe pointer.pointee.origin
                    d0 = origin.x
                    d1 = origin.y
                    d2 = origin.z
                    
                    let size = unsafe pointer.pointee.size
                    d3 = size.width
                    d4 = size.height
                    d5 = size.depth
                }
                
                d3 = d3 * 0.5
                d0 = d0 + d3
                d3 = d4 * 0.5
                d1 = d1 + d3
                d3 = d5 * 0.5
                d2 = d2 + d3
                
                // x19 + 0x50 -> x19 + 0x40 / d9
                let point_2 = Point3D(x: d0, y: d1, z: d2)
                let halfSize = dimensions3D.size.value * 0.5
                
                // x19 + 0xc0
                let point_3 = Point3D(
                    vector: simd_double3(
                        halfSize.width,
                        halfSize.height,
                        halfSize.depth
                    )
                )
                
                // x19 + 0xc0
                let point_4 = Point3D(
                    vector: simd_double3(
                        point_2.x - point_3.x,
                        point_2.y - point_3.y,
                        point_2.z - point_3.z
                    )
                )
                
                unsafe pointer.pointee.setGeometry3D(
                    ViewGeometry3D(
                        origin: ViewOrigin3D(point_4),
                        dimensions: dimensions3D
                    ),
                    at: i,
                    layoutDirection: .leftToRight
                )
            }
        }
        
        return data.geometries
    }
    
    func requiresTrueDepthLayout() -> Bool {
        return self.children.requiresTrueDepthLayout()
    }
    
    mutating func explicitAlignment(of alignment: AlignmentKey, at size: ViewSize3D) -> CGFloat? {
        return self.explicitAlignment(
            AlignmentKey3D.alignment(alignment),
            at: size
        )
    }
    
    fileprivate mutating func explicitAlignment(_ alignment: AlignmentKey3D, at size: ViewSize3D) -> CGFloat? {
        /*
         self -> x20 -> x21
         L -> x2 -> x19
         size -> x1 -> x20
         alignment -> x2/w3 -> x24/w23
         */
        // x29 - 0x80
        let copy_1 = size
        // x29 - 0xc0
        let copy_2 = size
        
        if !(self.cachedAlignmentVolume == copy_2) {
            // <+104>
            self.cachedAlignmentVolume = size
            self.cachedAlignmentGeometry = []
            self.cachedAlignment = Cache3()
        }
        
        // <+176>
        if let found = self.cachedAlignment.find(alignment.objectIdentifier) {
            return found
        }
        
        // <+280>
        let newValue: CGFloat? = withUnsafeMutablePointer(to: &self) { pointer1 in
            // $s7SwiftUI23ViewSpatialLayoutEngineV17explicitAlignment031_182E3E8D4B483E7956A2DBDA9F7535N0LL_2at12CoreGraphics7CGFloatVSgAA0H5Key3DV_AA0C6Size3DVtFAJSpyACyxGGXEfU_TA
            /*
             pointer1 -> x0 -> x26
             copy_1 -> x1 -> x25
             alignment -> x2/w3 -> x24/w23
             */
            var alignmentData = unsafe SpatialAlignmentData(
                flag: true,
                function: type(of: self),
                data: UnsafeMutableRawPointer(pointer1),
                size: copy_1
            )
            
            return unsafe alignmentData.asCurrent { _ -> CGFloat? in
                // $s7SwiftUI23ViewSpatialLayoutEngineV17explicitAlignment031_182E3E8D4B483E7956A2DBDA9F7535N0LL_2at12CoreGraphics7CGFloatVSgAA0H5Key3DV_AA0C6Size3DVtFAJSpyACyxGGXEfU_AJSpyAA0dH4DataAELLVGXEfU_
                /*
                 _ -> x0
                 copy_1 -> x1 -> x20
                 alignment -> x2/w3 -> x27/w28
                 pointer1 -> x4 -> x24
                 */
                // <+176>
                switch alignment {
                case .alignment(let key):
                    switch key.axis {
                    case .horizontal:
                        return unsafe pointer1.pointee.layout.explicitAlignment(
                            of: HorizontalAlignment(key.id),
                            in: .zero,
                            proposal: copy_1.proposal,
                            subviews: SpatialLayoutSubviews(
                                subviews: LayoutSubviews(
                                    context: pointer1.pointee.children.context,
                                    attributes: pointer1.pointee.children.attributes,
                                    layoutDirection: pointer1.pointee.layoutDirection
                                )
                            ),
                            cache: &pointer1.pointee.cache
                        )
                    case .vertical:
                        return unsafe pointer1.pointee.layout.explicitAlignment(
                            of: VerticalAlignment(key.id),
                            in: .zero,
                            proposal: copy_1.proposal,
                            subviews: SpatialLayoutSubviews(
                                subviews: LayoutSubviews(
                                    context: pointer1.pointee.children.context,
                                    attributes: pointer1.pointee.children.attributes,
                                    layoutDirection: pointer1.pointee.layoutDirection
                                )
                            ),
                            cache: &pointer1.pointee.cache
                        )
                    }
                case .depthAlignment(let depthKey):
                    return unsafe pointer1.pointee.layout.explicitAlignment(
                        of: DepthAlignment(depthKey.id),
                        in: .zero,
                        proposal: copy_1.proposal,
                        subviews: SpatialLayoutSubviews(
                            subviews: LayoutSubviews(
                                context: pointer1.pointee.children.context,
                                attributes: pointer1.pointee.children.attributes,
                                layoutDirection: pointer1.pointee.layoutDirection
                            )
                        ),
                        cache: &pointer1.pointee.cache
                    )
                }
            }
        }
        
        self.cachedAlignment.put(alignment.objectIdentifier, value: newValue)
        return newValue
    }
    
    func explicitDepthAlignment(_ alignment: DepthAlignmentKey, at size: ViewSize3D) -> CGFloat? {
        assertUnimplemented()
    }
    
    static func defaultAlignment(_ alignment: DepthAlignmentKey, volume: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? {
        assertUnimplemented()
    }
    
    fileprivate static func defaultAlignment(_ alignment: AlignmentKey3D, volume: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? {
        /*
         alignment -> x0 -> sp + 0xf0 / w24
         volume -> x1
         data -> x2 -> x20
         */
        guard volume.value.isFinite else {
            return nil
        }
        
        // <+116>
        // x20
        let casted = unsafe data.assumingMemoryBound(to: Self.self)
        // sp + 0x58 / x22
        let children = unsafe casted.pointee.children
        // x21
        var geometries = unsafe casted.pointee.cachedAlignmentGeometry
        
        if children.count != geometries.count {
            // <+220>
            geometries = unsafe casted.pointee.childGeometries3D(at: volume, origin: .zero)
            unsafe casted.pointee.cachedAlignmentGeometry = geometries
        }
        
        // x29 - 0xc0
        var result: CGFloat?
        
        // children.array -> x22 -> x26
        // <+316>
        guard !geometries.isEmpty else {
            return nil
        }
        
        // <+344>
        var sp0xc8 = 0
        
        let sp0x54: UInt8
        switch alignment {
        case .alignment(let key):
            sp0x54 = (key.axis == .horizontal) ? 0 : 1
        case .depthAlignment(_):
            sp0x54 = 2
        }
        
        for x25 in 0..<geometries.count {
            // <+516>
            // x27/w26
            let explicitAlignment: CGFloat?
            switch alignment {
            case .alignment(let key):
                explicitAlignment = children[x25].layoutComputer.explicitAlignment(key, at: geometries[x25].dimensions.size.size2D)
            case .depthAlignment(let key):
                explicitAlignment = children[x25].layoutComputer.explicitDepthAlignment(key, at: geometries[x25].dimensions.size)
            }
            
            // <+1504>
            guard let explicitAlignment else {
                continue
            }
            
            var d0: CGFloat
            var d1: CGFloat
            let d2: CGFloat
            do {
                let geoOrigin = geometries[x25].origin
                
                let origin = Size3D(
                    width: geoOrigin.value.x,
                    height: geoOrigin.value.y,
                    depth: geoOrigin.value.z
                )
                
                d0 = origin.width
                d1 = origin.height
                d2 = origin.depth
            }
            
            if sp0x54 != 0 {
                d0 = (sp0x54 == 1) ? d1 : d2
            }
            
            d1 = explicitAlignment
            let d8 = d0 + d1
            
            switch alignment {
            case .alignment(let key):
                key.id._combineExplicit(childValue: d8, sp0xc8, into: &result)
            case .depthAlignment(let key):
                key.id._combineExplicit(childValue: d8, sp0xc8, into: &result)
            }
            
            sp0xc8 += 1
        }
        
        return result
    }
    
    static func defaultAlignment(_ alignment: AlignmentKey, volume: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat? {
        return unsafe defaultAlignment(
            AlignmentKey3D.alignment(alignment),
            volume: volume,
            data: data
        )
    }
}

struct SpatialLayoutProperties {
    let value: UInt32
}

struct SpatialLayoutSubview {
    let subview: LayoutSubview
    
    func place(at origin: Point3D, anchor: UnitPoint3D, dimensions: ViewDimensions3D) {
        /*
         origin -> d0/d1/d2
         anchor -> v3/v4/v5
         dimensions -> x0
         */
        let d0 = origin.x
        let d1 = origin.y
        let d2 = origin.z
        let d3 = anchor.x
        let d4 = anchor.y
        let d5 = anchor.z
        
        // x29 - 0x80
        let copy_1 = dimensions
        
        let v6 = (d3, d4)
        var v7 = (copy_1.size.value.width, copy_1.size.value.height)
        var v16 = (v6.0 * v7.0, v6.1 * v7.1)
        v7 = (d0, d1)
        v16.0 = (v6.0 == 0) ? v7.0 : (v7.0 - v16.0)
        v16.1 = (v6.1 == 0) ? v7.1 : (v7.1 - v16.1)
        
        // <+84>
        var d6 = copy_1.size.value.depth
        d6 = d5 * d6
        d6 = d2 - d6
        let d7 = (d5 == 0) ? d2 : d6
        d6 = v16.1
        
        if v16.0.isNaN || d6.isNaN || d7.isNaN {
            preconditionFailure("view origin is invalid: \(origin), \(anchor), \(copy_1.size.value)")
        }
        
        let geometry = ViewGeometry3D(
            origin: ViewOrigin3D(
                Point3D(x: v16.0, y: v16.1, z: d7)
            ),
            dimensions: dimensions
        )
        
        self.place(in: geometry, layoutDirection: .leftToRight)
    }
    
    func place(in geometry: ViewGeometry3D, layoutDirection: LayoutDirection) {
        let pointer = unsafe SpatialPlacementData.current!
        unsafe assert(!pointer.pointee.flag)
        unsafe pointer.pointee.setGeometry3D(
            geometry,
            at: Int(self.subview.index),
            layoutDirection: layoutDirection
        )
    }
}

struct SpatialLayoutSubviews {
    let subviews: LayoutSubviews
}

@safe fileprivate struct SpatialPlacementData {
    private(set) var geometries: [ViewGeometry3D] // 0x0
    private(set) var unknown0: Int // 0x8
    let origin: Point3D // 0x10
    let size: Size3D // 0x30
    let layoutDirection: LayoutDirection // 0x50
    let flag: Bool // 0x51
    
    @inline(always) // 원래 없음
    static var current: UnsafeMutablePointer<SpatialPlacementData>? {
        get {
            if let ptr = unsafe _threadLayoutData() {
                return unsafe ptr.assumingMemoryBound(to: SpatialPlacementData.self)
            } else {
                return nil
            }
        }
        set {
            unsafe _setThreadLayoutData(newValue)
        }
        _modify {
            var value = unsafe current
            yield unsafe &value
            unsafe current = unsafe value
        }
    }
    
    @inline(always) // 원래 없음
    mutating func asCurrent<T>(_ block: (UnsafeMutablePointer<SpatialPlacementData>) -> T) -> T {
        return withUnsafeMutablePointer(to: &self) { pointer in
            let oldLayoutData = unsafe _threadLayoutData()
            unsafe _setThreadLayoutData(pointer)
            let result = unsafe block(pointer)
            unsafe _setThreadLayoutData(oldLayoutData)
            return result
        }
    }
    
    mutating func setGeometry3D(_ geometry: ViewGeometry3D, at index: Int, layoutDirection: LayoutDirection) {
        /*
         geometry -> x0
         index -> x1 -> x21
         layoutDirection -> x2 -> w22
         */
        // sp + 0x70
        let copy_1 = geometry
        
        var d8: CGFloat
        var d9: CGFloat
        var d10: CGFloat
        do {
            let origin = self.geometries[index].origin
            d8 = origin.origin2D.x
            d9 = origin.origin2D.y
            d10 = origin.depthOrigin.value
        }
        
        let size = Size3D(width: d8, height: d9, depth: d10)
        
        if size.width.isNaN {
            // <+348>
            self.unknown0 &+= 1
        }
        
        // <+156>
        self.geometries[index] = copy_1
        
        if self.layoutDirection != layoutDirection {
            // <+216>
            d8 = copy_1.origin.origin2D.x
            d9 = copy_1.origin.origin2D.y
            d10 = copy_1.origin.depthOrigin.value
            let d11 = copy_1.dimensions.size.value.width
            let d12 = self.origin.x
            var d0 = self.size.width
            let d13 = d12 + d0
            d0 = copy_1.origin.value.x
            
            d0 = d11 + d0
            d0 = d0 - d12
            d0 = d13 - d0
            self.geometries[index].origin.origin2D.x = d0
            // <+284>
        } else {
            // <+200>
            // <+284>
        }
        
        // <+284>
    }
}

fileprivate protocol DefaultSpatialAlignmentFunctions {
    static func defaultAlignment(_ alignment: AlignmentKey, volume: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat?
    static func defaultAlignment(_ alignment: DepthAlignmentKey, volume: ViewSize3D, data: UnsafeMutableRawPointer) -> CGFloat?
}

@unsafe fileprivate struct SpatialAlignmentData {
    let flag: Bool // 0x0
    let function: (any DefaultSpatialAlignmentFunctions.Type) // 0x8
    let data: UnsafeMutableRawPointer
    let size: ViewSize3D // 0x20
    
    @inline(always) // 원래 없음
    mutating func asCurrent<T>(_ block: (UnsafeMutablePointer<SpatialAlignmentData>) -> T) -> T {
        return withUnsafeMutablePointer(to: &self) { pointer in
            let oldLayoutData = unsafe _threadLayoutData()
            unsafe _setThreadLayoutData(pointer)
            let result = unsafe block(pointer)
            unsafe _setThreadLayoutData(oldLayoutData)
            return result
        }
    }
}

extension DerivedSpatialLayout where Self == _ZStackLayout {
    nonisolated func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> CGFloat? {
        guard let data = unsafe _threadLayoutData() else {
            return nil
        }
        
        
        let ptr = unsafe data
            .assumingMemoryBound(to: SpatialAlignmentData.self)
        
        return unsafe ptr
            .pointee
            .function
            .defaultAlignment(
                guide.key,
                volume: ptr.pointee.size,
                data: ptr.pointee.data
            )
    }
}

extension DerivedSpatialLayout where Self == ZStackLayout3D {
    nonisolated func explicitAlignment(of guide: HorizontalAlignment, in bounds: Rect3D, proposal: _ProposedSize3D, subviews: SpatialLayoutSubviews, cache: inout ZStackSpatialLayout.Cache3D) -> CGFloat? {
        guard let data = unsafe _threadLayoutData() else {
            return nil
        }
        
        
        let ptr = unsafe data
            .assumingMemoryBound(to: SpatialAlignmentData.self)
        
        return unsafe ptr
            .pointee
            .function
            .defaultAlignment(
                guide.key,
                volume: ptr.pointee.size,
                data: ptr.pointee.data
            )
    }
}
