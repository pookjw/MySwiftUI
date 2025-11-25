// 1CC2FE016A82CF91549A64E942CE8ED4

#warning("TODO")
package import CoreGraphics
internal import AttributeGraph
package import Spatial

package struct ViewTransform {
    private var head: AnyElement?
    private var spaces: CoordinateSpaceNode?
    private var positionAdjustment: CGSize
    private var pendingTranslation: CGSize
    package var depth: ViewDepth
    
    package init() {
        self.head = nil
        self.spaces = nil
        self.positionAdjustment = .zero
        self.pendingTranslation = .zero
        self.depth = ViewDepth()
    }
    
    package mutating func appendAffineTransform3D(_: AffineTransform3D, inverse: Bool) {
        fatalError("TODO")
    }
    
    package mutating func appendCoordinateSpace(id: CoordinateSpace.ID) {
        // self = x19
        // sp + 0x50
        let coordinateSpace = CoordinateSpace.id(id)
        // sp + 0x80
        let copy_1 = self
        // sp
        let copy_2 = self
        // sp + 0xc0
        let _ = copy_2
        
        // sp + 0x40 / x20
        let tag: CoordinateSpaceTag
        if let _tag = copy_2.coordinateSpaceTag(coordinateSpace) {
            tag = _tag
        } else {
            // <+136>
            // sp
            let copy_3 = coordinateSpace
            let depth: Int
            if let spaces = copy_1.spaces {
                depth = spaces.depth + 1
            } else {
                depth = 1
            }
            let spaces = CoordinateSpaceNode(next: copy_1.spaces, space: copy_3, depth: depth)
            self.spaces = spaces
            tag = CoordinateSpaceTag(base: spaces.depth)
        }
        
        // <+260>
        let depth: Int
        if let spaces = copy_1.spaces {
            depth = spaces.depth + 1
        } else {
            depth = 1
        }
        
        let element = Element(
            next: copy_1.head,
            depth: depth,
            translation: copy_1.pendingTranslation,
            element: CoordinateSpaceElement(space: tag)
        )
        self.head = element
    }
    
    package mutating func appendSizedSpace3D(name: AnyHashable, size3D: Size3D) {
        fatalError("TODO")
    }
    
    package mutating func appendSizedSpace(name: AnyHashable, size: CGSize) {
        fatalError("TODO")
    }
    
    package mutating func append(movingContentsOf: inout ViewTransform.UnsafeBuffer) {
        fatalError("TODO")
    }
    
    func coordinateSpaceTag(_ coordinateSpace: CoordinateSpace) -> CoordinateSpaceTag? {
        fatalError("TODO")
    }
}

struct CoordinateSpaceTag: Hashable {
    static var global: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: 0)
    }
    
    static var local: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: .max)
    }
    
    static var root: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: .max - 1)
    }
    
    static var invalid: CoordinateSpaceTag {
        return CoordinateSpaceTag(base: .max - 2)
    }
    
    private var base: Int
    
    init(base: Int) {
        self.base = base
    }
}

protocol ViewTransformElement {}

fileprivate struct TranslationElement: ViewTransformElement {
    // TODO
}

fileprivate struct AffineTransformElement: ViewTransformElement {
    // TODO
}

fileprivate struct SizedSpaceElement: ViewTransformElement {
    // TODO
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
        depth: Int,
        translation: CGSize,
        element: T
    ) {
        self.translation = translation
        self.element = element
        super.init(next: next, depth: depth)
    }
}

fileprivate class AnyElement {
    var next: AnyElement?
    let depth: Int
    
    init(next: AnyElement?, depth: Int) {
        self.next = next
        self.depth = depth
    }
}

fileprivate final class CoordinateSpaceNode {
    private var next: CoordinateSpaceNode?
    private var space: CoordinateSpace
    let depth: Int
    
    init(next: CoordinateSpaceNode?, space: CoordinateSpace, depth: Int) {
        self.next = next
        self.space = space
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
        let proposedSize = proposedSize
        let size = proposedSize.value.inset(by: insets)
        let transform = transform
        
        fatalError("TODO")
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
        
        package func appendScrollGeometry(_: ScrollGeometry, isClipped: Bool) {
            fatalError("TODO")
        }
        
        package func appendCoordinateSpace(id: CoordinateSpace.ID, transform: inout ViewTransform) {
            fatalError("TODO")
        }
    }
}
