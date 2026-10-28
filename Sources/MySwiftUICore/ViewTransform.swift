// 1CC2FE016A82CF91549A64E942CE8ED4
package import CoreGraphics
internal import AttributeGraph
package import Spatial

@_spi(Internal) public struct ViewTransform : Equatable {
    @_spi(Internal) public static func == (lhs: ViewTransform, rhs: ViewTransform) -> Bool {
        guard
            lhs.positionAdjustment == rhs.positionAdjustment &&
                lhs.pendingTranslation == rhs.pendingTranslation &&
                lhs.depth == rhs.depth
        else {
            return false
        }
        
        let lhsHead = lhs.head
        let rhsHead = rhs.head
        
        guard
            var lhsHead,
            var rhsHead
        else {
            return lhsHead === rhsHead
        }
        
        guard lhsHead.depth == rhsHead.depth else {
            return false
        }

        while true {
            if lhsHead === rhsHead {
                return true
            }
            
            if !lhsHead.isEqual(to: rhsHead) {
                return lhsHead === rhsHead
            }
            
            let lhsNext = lhsHead.next
            let rhsNext = rhsHead.next
            
            if let lhsNext, let rhsNext {
                lhsHead = lhsNext
                rhsHead = rhsNext
            } else {
                return lhsNext === rhsNext
            }
        }
    }
    
    private var head: AnyElement? // 0x0
    private var spaces: CoordinateSpaceNode? // 0x8
    var positionAdjustment: CGSize // 0x10
    var pendingTranslation: CGSize // 0x20
    package var depth: ViewDepth // 0x30
    
    package init() {
        self.head = nil
        self.spaces = nil
        self.positionAdjustment = .zero
        self.pendingTranslation = .zero
        self.depth = ViewDepth(0, proposal: 0)
    }
    
    package func withPosition(_ position: CGPoint) -> ViewTransform {
        assertUnimplemented()
    }
    
    package mutating func appendCoordinateSpace(id: CoordinateSpace.ID) {
        // self = x19
        // sp + 0x50
        let coordinateSpace = CoordinateSpace.id(id)
        let tag = updateNode(coordinateSpace: coordinateSpace)
        
        // <+260>
        self.updateHead(element: CoordinateSpaceElement(space: tag))
    }
    
    package mutating func appendSizedSpace(name: AnyHashable, size: CGSize) {
        updateHead(
            element: SizedSpaceElement(
                space: updateNode(coordinateSpace: .named(name)),
                size: size
            )
        )
    }
    
    mutating func appendSizedSpace(id: CoordinateSpace.ID, size: CGSize) {
        updateHead(
            element: SizedSpaceElement(
                space: updateNode(coordinateSpace: .id(id)),
                size: size
            )
        )
    }
    
    package mutating func append(movingContentsOf buffer: inout ViewTransform.UnsafeBuffer) {
        /*
         buffer = x19
         */
        // x22
        let head = head
        let element = BufferedElement(next: head, translation: pendingTranslation, elements: buffer)
        
        self.head = element
        pendingTranslation = .zero
        buffer = ViewTransform.UnsafeBuffer()
    }
    
    package mutating func appendPosition(_ position: CGPoint) {
        self.pendingTranslation.width = self.pendingTranslation.width - (position.x - self.positionAdjustment.width)
        self.pendingTranslation.height = self.pendingTranslation.height - (position.y - self.positionAdjustment.height)
        self.positionAdjustment = CGSize(width: position.x, height: position.y)
    }
    
    // 원래 없음
    @inline(always)
    mutating func updateNode(coordinateSpace: CoordinateSpace) -> CoordinateSpaceTag {
        let tag: CoordinateSpaceTag
        if let _tag = coordinateSpaceTag(coordinateSpace) {
            tag = _tag
        } else {
            let spaces = CoordinateSpaceNode(next: spaces, space: coordinateSpace)
            self.spaces = spaces
            tag = CoordinateSpaceTag(base: spaces.depth)
        }
        
        return tag
    }
    
    // 원래 없음
    @inline(always)
    mutating func updateHead<T : ViewTransformElement>(element: T) {
        let element = Element(
            next: head,
            translation: pendingTranslation,
            element: element
        )
        self.head = element
        pendingTranslation = .zero
    }
    
    func coordinateSpaceTag(_ coordinateSpace: CoordinateSpace) -> CoordinateSpaceTag? {
        // coordinateSpace = x21
        // return pointer = x19
        // x20
        let spaces = spaces
        // sp
        let copy_1 = coordinateSpace
        
        switch copy_1 {
        case .global:
            // <+244>
            return .global
        case .local:
            // <+256>
            return .local
        default:
            break
        }
        
        // <+108>
        guard let spaces else {
            return nil
        }
        
        // <+120>
        // x23
        var next = spaces.next
        let block: (CoordinateSpaceNode) -> Bool = { node in
            return node.space == coordinateSpace
        }
        
        if block(spaces) {
            return CoordinateSpaceTag(base: spaces.depth)
        }
        
        while let _next = next {
            if block(_next) {
                return CoordinateSpaceTag(base: _next.depth)
            } else {
                next = _next.next
            }
        }
        
        return nil
    }
    
    func convertGlobalToSpace(_ space: CoordinateSpace, _ block: (ViewTransform.Item) -> Void) {
        let tag: CoordinateSpaceTag
        
        if let _tag = self.coordinateSpaceTag(space) {
            tag = _tag
        } else {
            if space == .id(.worldReference) {
                tag = .root
            } else {
                tag = .invalid
            }
        }
        
        self.convert(.spaceToSpace(.global, tag), block)
    }
    
    func convertSpaceToGlobal(_ space: CoordinateSpace, _ block: (ViewTransform.Item) -> Void) {
        let tag: CoordinateSpaceTag
        
        if let _tag = self.coordinateSpaceTag(space) {
            tag = _tag
        } else {
            if space == .id(.worldReference) {
                tag = .root
            } else {
                tag = .invalid
            }
        }
        
        self.convert(.spaceToSpace(tag, .global), block)
    }
    
    func convertLocalToSpace(_ space: CoordinateSpace, _ block: (ViewTransform.Item) -> Void) {
        let tag: CoordinateSpaceTag
        
        if let _tag = self.coordinateSpaceTag(space) {
            tag = _tag
        } else {
            if space == .id(.worldReference) {
                tag = .root
            } else {
                tag = .invalid
            }
        }
        
        self.convert(.localToSpace(tag), block)
    }
    
    func convertSpaceToLocal(_ space: CoordinateSpace, _ block: (ViewTransform.Item) -> Void) {
        let tag: CoordinateSpaceTag
        
        if let _tag = self.coordinateSpaceTag(space) {
            tag = _tag
        } else {
            if space == .id(.worldReference) {
                tag = .root
            } else {
                tag = .invalid
            }
        }
        
        self.convert(.spaceToLocal(tag), block)
    }
    
    func convert(_ conversion: ViewTransform.Conversion, _ block: (ViewTransform.Item) -> Void) {
        guard self.head != nil || self.pendingTranslation.width != 0 || self.pendingTranslation.height != 0 else {
            return
        }
        
        // <+96>
        let inverted: Bool
        var x290x81: Bool
        var x22 = conversion
        
        switch conversion {
        case .rootToSpace(let tag):
            // <+192>
            if tag == .root {
                return
            } else {
                // <+312>
                inverted = false
                x290x81 = true
            }
        case .spaceToRoot(let tag):
            // <+260>
            if tag == .local {
                // <+276>
                inverted = true
                x290x81 = true
            } else {
                // <+268>
                inverted = true
                x290x81 = false
            }
        case .localToSpace(let tag):
            // <+212>
            if tag == .local {
                // <+248>
                return
            } else {
                // <+276>
                inverted = true
                x290x81 = true
            }
        case .spaceToLocal(let tag):
            // <+304>
            if tag != .root {
                // <+328>
                inverted = false
                x290x81 = false
            } else {
                // <+312>
                inverted = false
                x290x81 = true
            }
        case .spaceToSpace(let tag1, let tag2):
            // <+136>
            if tag1 == .local {
                // <+224>
                x22 = .localToSpace(tag2)
                
                if tag2 == .local {
                    return
                } else {
                    // <+276>
                    inverted = true
                    x290x81 = true
                }
            } else if tag2 == .local {
                // <+288>
                x22 = .spaceToLocal(tag1)
                x290x81 = false
                
                if tag1 == .root {
                    inverted = false
                    x290x81 = true
                } else {
                    inverted = false
                }
            } else if tag1 == .root {
                // <+160>
                x22 = .rootToSpace(tag2)
                
                if tag2 == .root {
                    // <+248>
                    return
                } else {
                    // <+312>
                    inverted = false
                    x290x81 = true
                }
            } else if tag2 == .root {
                // <+344>
                x22 = .spaceToRoot(tag1)
                inverted = true
                x290x81 = false
            } else {
                // <+364>
                x290x81 = false
                inverted = !self.spaceBeforeSpace(tag1, tag2)
            }
        }
        
        // capture x22, x290x81
        forEach(inverted: inverted) { item, stop in
            // $s7SwiftUI13ViewTransformV7convertyyAC10ConversionO_yAC4ItemOXEtFyAH_SbztXEfU_
            _ = x22
            _ = x290x81
            assertUnimplemented()
        }
    }
    
    func forEach(_ block: (ViewTransform.Item, inout Bool) -> Void) {
        self.forEach(inverted: false, block)
    }
    
    func forEach(inverted: Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        /*
         inverted -> w0
         block -> x1/x2 -> x23/x24
         */
        guard let head else {
            return
        }
        
        let q1 = self.pendingTranslation
        var x190x1f = false
        
        if inverted {
            // <+80>
            if (q1.width != 0) || (q1.height != 0) {
                // <+408>
                let item = ViewTransform.Item.translation(
                    CGSize(width: -q1.width, height: -q1.height)
                )
                
                block(item, &x190x1f)
                
                if x190x1f {
                    // <+548>
                } else {
                    // <+496>
                    var _head: AnyElement? = head
                    
                    while let __head = _head {
                        _head = __head.next
                        __head.forEach(inverted: inverted, stop: &x190x1f, block)
                        
                        if x190x1f {
                            break
                        }
                    }
                    
                    // <+548>
                }
            } else {
                // <+496>
                var _head: AnyElement? = head
                
                while let __head = _head {
                    _head = __head.next
                    __head.forEach(inverted: inverted, stop: &x190x1f, block)
                    
                    if x190x1f {
                        break
                    }
                }
                
                // <+548>
            }
            
            // <+548>
        } else {
            // <+112>
            let depth = head.depth
            
            withUnsafeTemporaryAllocation(
                of: Unmanaged<AnyElement>.self,
                capacity: depth
            ) { buffer in
                // $s7SwiftUI13ViewTransformV7forEach8inverted_ySb_yAC4ItemO_SbztXEtFySrys9UnmanagedVyAA10AnyElement33_1CC2FE016A82CF91549A64E942CE8ED4LLCGGXEfU1_
                var next: AnyElement? = head
                var i = 0
                while let _next = next {
                    unsafe buffer.initializeElement(
                        at: i,
                        to: Unmanaged.passUnretained(_next)
                    )
                    
                    i &+= 1
                    next = _next.next
                }
                
                // <+76>
                for i in 0..<depth {
                    unsafe buffer[depth &- (i + 1)]
                        .takeUnretainedValue()
                        .forEach(inverted: inverted, stop: &x190x1f, block)
                    
                    if x190x1f {
                        break
                    }
                }
            }

            if !x190x1f && ((q1.width != 0) || (q1.height != 0)) {
                block(.translation(q1), &x190x1f)
            }
        }
    }
    
    fileprivate func spaceBeforeSpace(_: CoordinateSpaceTag, _: CoordinateSpaceTag) -> Bool {
        assertUnimplemented()
    }
}

extension ViewTransform {
    enum Conversion {
        case rootToSpace(CoordinateSpaceTag)
        case spaceToRoot(CoordinateSpaceTag)
        case localToSpace(CoordinateSpaceTag)
        case spaceToLocal(CoordinateSpaceTag)
        case spaceToSpace(CoordinateSpaceTag, CoordinateSpaceTag)
    }
}

struct CoordinateSpaceTag : Hashable {
    static var global: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: 0)
    }
    
    static var local: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: -1)
    }
    
    static var root: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: -2)
    }
    
    static var invalid: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: -3)
    }
    
    private var base: Int
    
    init(base: Int) {
        self.base = base
    }
}

protocol ViewTransformElement : Equatable {
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void)
}

fileprivate struct TranslationElement : ViewTransformElement {
    var offset: CGSize
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
}

fileprivate struct Translation3DElement : ViewTransformElement {
    var offset: Size3D
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
}

fileprivate struct AffineTransformElement : ViewTransformElement {
    private var matrix: CGAffineTransform
    private var inverse: Bool
    
    init(matrix: CGAffineTransform, inverse: Bool) {
        self.matrix = matrix
        self.inverse = inverse
    }
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
}

fileprivate struct SizedSpaceElement : ViewTransformElement {
    var space: CoordinateSpaceTag
    var size: CGSize
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
}

fileprivate struct CoordinateSpaceElement : ViewTransformElement {
    private var space: CoordinateSpaceTag
    
    init(space: CoordinateSpaceTag) {
        self.space = space
    }
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
}

fileprivate struct ProjectionTransformElement : ViewTransformElement {
    private var matrix: ProjectionTransform
    private var inverse: Bool
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
}

fileprivate final class Element<T : Equatable> : AnyElement {
    private let translation: CGSize
    private let element: T
    
    init(
        next: AnyElement?,
        translation: CGSize,
        element: T
    ) {
        self.translation = translation
        self.element = element
        super.init(next: next)
    }
    
    override func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        assertUnimplemented()
    }
    
    override func isEqual(to other: AnyElement) -> Bool {
        guard let casted = other as? Self else {
            return false
        }
        
        guard self.translation == casted.translation else {
            return false
        }
        
        return self.element == casted.element
    }
}

fileprivate final class BufferedElement : AnyElement {
    private let translation: CGSize
    private var elements: ViewTransform.UnsafeBuffer
    
    init(next: AnyElement?, translation: CGSize, elements: ViewTransform.UnsafeBuffer) {
        self.translation = translation
        self.elements = elements
        super.init(next: next)
    }
    
    deinit {
        elements.destroy()
    }
    
    override func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        /*
         self -> x20 -> x23
         inverted -> w0 -> w24
         stop -> x1 -> x22
         block -> x2/x3 -> x19/x21
         */
        do {
            let translation = self.translation
            
            if !inverted && ((translation.width != 0) || (translation.height != 0)) {
                // <+76>
                block(.translation(translation), &stop)
                
                if stop {
                    return
                }
            }
        }
        
        // <+156>
        self.elements.forEach(inverted: inverted, stop: &stop, block)
        
        if stop {
            return
        }
        
        let translation = self.translation
        
        if inverted && ((translation.width != 0) || (translation.height != 0)) {
            block(
                .translation(CGSize(width: -translation.width, height: -translation.height)),
                &stop
            )
        }
    }
    
    override func isEqual(to other: AnyElement) -> Bool {
        guard type(of: other) == BufferedElement.self else {
            return false
        }
        
        let casted = unsafe unsafeDowncast(other, to: BufferedElement.self)
        
        guard self.translation == casted.translation else {
            return false
        }
        
        return self.elements == casted.elements
    }
    
    var description: String? {
        assertUnimplemented()
    }
}

fileprivate class AnyElement {
    var next: AnyElement?
    let depth: Int

    deinit {
        assertUnimplemented()
    }
    
    init(next: AnyElement?) {
        self.next = next
        
        let depth: Int
        if let next = next {
            depth = next.depth + 1
        } else {
            depth = 1
        }
        self.depth = depth
    }
    
    func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
        // noop
    }
    
    func isEqual(to other: AnyElement) -> Bool {
        return false
    }
}

fileprivate final class CoordinateSpaceNode {
    fileprivate private(set) var next: CoordinateSpaceNode?
    fileprivate private(set) var space: CoordinateSpace
    let depth: Int

    deinit {
        assertUnimplemented()
    }
    
    init(next: CoordinateSpaceNode?, space: CoordinateSpace) {
        self.next = next
        self.space = space
        
        let depth: Int
        if let next = next {
            depth = next.depth + 1
        } else {
            depth = 1
        }
        self.depth = depth
    }
}

struct RootDepthTransform : Rule, AsyncAttribute {
    @Attribute var transform: ViewTransform
    @OptionalAttribute var layoutDirection: LayoutDirection?
    @Attribute var proposedSize: ViewSize
    @OptionalAttribute var safeAreaInsets: _SafeAreaInsetsModifier?
    @OptionalAttribute var childLayoutComputer: LayoutComputer?
    
    init(
        transform: Attribute<ViewTransform>,
        layoutDirection: OptionalAttribute<LayoutDirection>,
        proposedSize: Attribute<ViewSize>,
        safeAreaInsets: OptionalAttribute<_SafeAreaInsetsModifier>,
        childLayoutComputer: OptionalAttribute<LayoutComputer>
    ) {
        self._transform = transform
        self._layoutDirection = layoutDirection
        self._proposedSize = proposedSize
        self._safeAreaInsets = safeAreaInsets
        self._childLayoutComputer = childLayoutComputer
    }
    
    var value: ViewTransform {
        // w25 = AGAttributeNil
        let childLayoutComputer = childLayoutComputer ?? .defaultValue
        // <+124>
        
        var insets = EdgeInsets.zero
        if let safeAreaInsets = self.safeAreaInsets {
            // inlined
            insets = safeAreaInsets.combined(layoutDirection: layoutDirection)
        }
        
        // <+400>
        // d9/d8
        let size = proposedSize.value.inset(by: insets)
        let transform = transform
        // d10
        let depth = transform.depth.value
        // d8
        let depthThatFits = childLayoutComputer.depthThatFits(_ProposedSize3D(width: size.width, height: size.height, depth: depth))
        
        // sp + 0x60
        var transform_2 = transform
        transform_2.depth = ViewDepth(depthThatFits, proposal: depth)
        
        return transform_2
    }
}

extension ViewTransform {
    package struct UnsafeBuffer : Equatable {
        private var contents: UnsafeHeterogeneousBuffer
        
        package init() {
            contents = UnsafeHeterogeneousBuffer()
        }
        
        func destroy() {
            contents.destroy()
        }
        
        package mutating func appendScrollGeometry(_ geometry: ScrollGeometry, isClipped: Bool) {
            /*
             geometry -> x21
             isClipped -> x19
             */
            let item = ViewTransform.ScrollGeometryItem(base: geometry, isClipped: isClipped)
            append(item)
        }
        
        package mutating func appendCoordinateSpace(id: CoordinateSpace.ID, transform: inout ViewTransform) {
            /*
             self = x19
             */
            // inlined
            let tag = transform.updateNode(coordinateSpace: .id(id))
            
            // <+264>
            let element = CoordinateSpaceElement(space: tag)
            append(element)
        }
        
        package mutating func appendAffineTransform(_ transform: CGAffineTransform, inverse: Bool) {
            /*
             transform = q2, q3, d8, d9
             inverse = w19
             */
            let _: (Double, Double) = (1, 0)
            let _: (Double, Double) = (0, 1)
            
            if (transform.a != 1) || (transform.b != 0) || (transform.c != 0) || (transform.d != 1) {
                // <+84>
                let element = AffineTransformElement(matrix: transform, inverse: inverse)
                append(element)
            } else {
                // <+228>
                if (transform.tx != 0) || (transform.ty != 0) {
                    // <+244>
                    let element = TranslationElement(offset: CGSize(width: inverse ? -transform.tx : transform.tx, height: inverse ? -transform.ty : transform.ty))
                    append(element)
                } else {
                    // <+388>
                    return
                }
            }
        }
        
        mutating func append<T : ViewTransformElement>(_ element: T) {
            contents.append(element, vtable: ViewTransform.UnsafeBuffer._VTable<T>.self)
        }
        
        fileprivate func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
            assertUnimplemented()
        } 
        
        package static func == (lhs: UnsafeBuffer, rhs: UnsafeBuffer) -> Bool {
            guard lhs.contents.count == rhs.contents.count else {
                return false
            }
            
            for index in lhs.contents.indices {
                let lhsContent = lhs.contents[index]
                let rhsContent = rhs.contents[index]
                
                let lhsTable = lhsContent.vtable(as: ViewTransform.UnsafeBuffer.VTable.self)
                let rhsTable = rhsContent.vtable(as: ViewTransform.UnsafeBuffer.VTable.self)
                
                guard lhsTable == rhsTable else {
                    return false
                }
                
                guard lhsTable.equal(lhsContent, rhsContent) else {
                    return false
                }
            }
            
            return true
        }
    }
}

extension ViewTransform.UnsafeBuffer {
    fileprivate class VTable : _UnsafeHeterogeneousBuffer_VTable {
        class func forEach(elt : _UnsafeHeterogeneousBuffer_Element, inverted: Bool, stop: inout Bool) {
            // noop
        }
        
        class func description(elt : _UnsafeHeterogeneousBuffer_Element) -> String {
            return ""
        }
        
        class func equal(_ lhs : _UnsafeHeterogeneousBuffer_Element, _ rhs: _UnsafeHeterogeneousBuffer_Element) -> Bool {
            return false
        }
    }
    
    fileprivate final class _VTable<Element : ViewTransformElement>: VTable {
        override class var type : any Any.Type {
            return Element.self
        }
        
        override class func moveInitialize(elt : _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
            let eltPtr = unsafe elt.body(as: Element.self)
            let fromPtr = unsafe from.body(as: Element.self)
            
            let element = unsafe fromPtr.move()
            unsafe eltPtr.initialize(to: element)
        }
        
        override class func deinitialize(elt : _UnsafeHeterogeneousBuffer_Element) {
            let pointer = unsafe elt.body(as: Element.self)
            unsafe pointer.deinitialize(count: 1)
        }
        
        override class func forEach(elt : _UnsafeHeterogeneousBuffer_Element, inverted: Bool, stop: inout Bool) {
            assertUnimplemented()
        }
        
        override class func description(elt : _UnsafeHeterogeneousBuffer_Element) -> String {
            assertUnimplemented()
        }
        
        override class func equal(_ lhs : _UnsafeHeterogeneousBuffer_Element, _ rhs: _UnsafeHeterogeneousBuffer_Element) -> Bool {
            return unsafe lhs.body(as: Element.self).pointee == rhs.body(as: Element.self).pointee
        }
    }
}

extension ViewTransform {
    enum Item : Equatable {
        case translation(CGSize)
        case affineTransform(CGAffineTransform, inverse: Bool)
        case projectionTransform(ProjectionTransform, inverse: Bool)
        case coordinateSpace(CoordinateSpaceTag)
        case sizedSpace(CoordinateSpaceTag, size: CGSize)
        case scrollGeometry(ViewTransform.ScrollGeometryItem)
        case depthTranslation(CGFloat)
        case affineTransform3D(AffineTransform3D, inverse: Bool)
        case sizedSpace3D(CoordinateSpaceTag, size3D: Size3D)
    }
    
    struct ScrollGeometryItem : ViewTransformElement {
        private(set) var base: ScrollGeometry
        private(set) var isClipped: Bool
        
        func forEach(inverted: Bool, stop: inout Bool, _ block: (ViewTransform.Item, inout Bool) -> Void) {
            assertUnimplemented()
        }
    }
}

extension Array where Element == CGPoint {
    mutating func applyTransform(item: ViewTransform.Item) {
        self._applyTransform(item: item)
    }
}

extension MutableCollection where Element == CGPoint {
    fileprivate mutating func _applyTransform(item: ViewTransform.Item) {
        assertUnimplemented()
    }
}
