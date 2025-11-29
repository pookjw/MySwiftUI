// 1CC2FE016A82CF91549A64E942CE8ED4

#warning("TODO")
package import CoreGraphics
internal import AttributeGraph
package import Spatial

package struct ViewTransform {
    private var head: AnyElement?
    private var spaces: CoordinateSpaceNode?
    var positionAdjustment: CGSize
    var pendingTranslation: CGSize
    package var depth: ViewDepth
    
    package init() {
        self.head = nil
        self.spaces = nil
        self.positionAdjustment = .zero
        self.pendingTranslation = .zero
        self.depth = ViewDepth(0, proposal: 0)
    }
    
    package mutating func appendAffineTransform3D(_: AffineTransform3D, inverse: Bool) {
        fatalError("TODO")
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
    
    // 원래 없음
    @inline(__always)
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
    @inline(__always)
    mutating func updateHead<T: ViewTransformElement>(element: T) {
        let element = Element(
            next: head,
            translation: pendingTranslation,
            element: element
        )
        self.head = element
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
}

struct CoordinateSpaceTag: Hashable {
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

protocol ViewTransformElement: Equatable {}

fileprivate struct TranslationElement: ViewTransformElement {
    var offset: CGSize
}

fileprivate struct Translation3DElement: ViewTransformElement {
    var offset: Size3D
}

fileprivate struct AffineTransformElement: ViewTransformElement {
    private var matrix: CGAffineTransform
    private var inverse: Bool
    
    init(matrix: CGAffineTransform, inverse: Bool) {
        self.matrix = matrix
        self.inverse = inverse
    }
}

fileprivate struct AffineTransform3DElement: ViewTransformElement {
    // TODO
}

fileprivate struct SizedSpaceElement: ViewTransformElement {
    var space: CoordinateSpaceTag
    var size: CGSize
}

fileprivate struct CoordinateSpaceElement: ViewTransformElement {
    private var space: CoordinateSpaceTag
    
    init(space: CoordinateSpaceTag) {
        self.space = space
    }
}

fileprivate struct ProjectionTransformElement: ViewTransformElement {
    // TODO
}

fileprivate final class Element<T>: AnyElement {
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
}

fileprivate final class BufferedElement: AnyElement {
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
    
    func forEach(inverted: Bool, stop: inout Bool, _: (ViewTransform.Item, inout Bool) -> Void) {
        fatalError("TODO")
    }
    
    func isEqual(to other: AnyElement) -> Bool {
        fatalError("TODO")
    }
    
    var description: String? {
        fatalError("TODO")
    }
}

fileprivate class AnyElement {
    var next: AnyElement?
    let depth: Int
    
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
}

fileprivate final class CoordinateSpaceNode {
    fileprivate private(set) var next: CoordinateSpaceNode?
    fileprivate private(set) var space: CoordinateSpace
    let depth: Int
    
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

struct RootDepthTransform: Rule {
    @Attribute private var transform: ViewTransform
    @OptionalAttribute var layoutDirection: LayoutDirection?
    @Attribute private var proposedSize: ViewSize
    @OptionalAttribute private var safeAreaInsets: _SafeAreaInsetsModifier?
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
        if
            let safeAreaInsets = self.safeAreaInsets,
            !safeAreaInsets.elements.isEmpty
        {
            if safeAreaInsets.elements.count != 1 {
                for element in safeAreaInsets.elements {
                    if let cornerInsets = element.cornerInsets {
                        insets.top += cornerInsets.topLeading.width + cornerInsets.bottomTrailing.width
                        insets.leading += cornerInsets.topLeading.height + cornerInsets.bottomTrailing.height
                        insets.trailing += cornerInsets.topTrailing.width + cornerInsets.bottomLeading.width
                        insets.bottom += cornerInsets.topTrailing.height + cornerInsets.bottomLeading.height
                        fatalError("cornerInsets 값을 제대로 읽어오는지 검증 필요")
                    }
                }
            }
            
            for element in safeAreaInsets.elements {
                insets.top += element.insets.top
                insets.leading += element.insets.leading
                insets.bottom += element.insets.bottom
                insets.trailing += element.insets.trailing
            }
            
            if let layoutDirection = layoutDirection {
                insets.xFlipIfRightToLeft { return layoutDirection }
            }
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
    package struct UnsafeBuffer {
        private var contents: UnsafeHeterogeneousBuffer
        
        package init() {
            contents = UnsafeHeterogeneousBuffer()
        }
        
        func destroy() {
            contents.destroy()
        }
        
        package func appendScrollGeometry(_ geometry: ScrollGeometry, isClipped: Bool) {
            fatalError("TODO")
        }
        
        package mutating func appendCoordinateSpace(id: CoordinateSpace.ID, transform: inout ViewTransform) {
            /*
             self = x19
             */
            // inlined
            let tag = transform.updateNode(coordinateSpace: .id(id))
            
            // <+264>
            let element = CoordinateSpaceElement(space: tag)
            contents.append(element, vtable: ViewTransform.UnsafeBuffer._VTable<CoordinateSpaceElement>.self)
        }
        
        package mutating func appendAffineTransform(_ transform: CGAffineTransform, inverse: Bool) {
            /*
             transform = q2, q3, d8, d9
             inverse = w19
             */
            let q0: (Double, Double) = (1, 0)
            let q1: (Double, Double) = (0, 1)
            
            if (transform.a != 1) || (transform.b != 0) || (transform.c != 0) || (transform.d != 1) {
                // <+84>
                let element = AffineTransformElement(matrix: transform, inverse: inverse)
                contents.append(element, vtable: ViewTransform.UnsafeBuffer._VTable<AffineTransformElement>.self)
            } else {
                // <+228>
                if (transform.tx != 0) || (transform.ty != 0) {
                    // <+244>
                    let element = TranslationElement(offset: CGSize(width: transform.tx, height: transform.ty))
                    contents.append(element, vtable: ViewTransform.UnsafeBuffer._VTable<TranslationElement>.self)
                } else {
                    // <+388>
                    return
                }
            }
            
        }
    }
}

extension ViewTransform.UnsafeBuffer {
    fileprivate class VTable: _UnsafeHeterogeneousBuffer_VTable {
    }
    
    fileprivate final class _VTable<Element: ViewTransformElement>: VTable {
        override class var type: any Any.Type {
            return Element.self
        }
        
        override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        class func forEach(elt: _UnsafeHeterogeneousBuffer_Element, inverted: Bool, stop: inout Bool) {
            fatalError("TODO")
        }
        
        class func description(elt: _UnsafeHeterogeneousBuffer_VTable) -> String {
            fatalError("TODO")
        }
        
        class func equal(_ lhs: _UnsafeHeterogeneousBuffer_VTable, _ rhs: _UnsafeHeterogeneousBuffer_VTable) -> Bool {
            fatalError("TODO")
        }
    }
}

extension ViewTransform {
    enum Item {
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
    
    struct ScrollGeometryItem {
        private var base: ScrollGeometry
        private var isClipped: Bool
    }
}
