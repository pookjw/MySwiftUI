// _C4DC82F2A500E9B6DEA3064A36584B42
private import AttributeGraph
private import CoreGraphics

struct SafeAreaInsets {
    var space: CoordinateSpace.ID
    var elements: [SafeAreaInsets.Element]
    var next: SafeAreaInsets.OptionalValue
}

extension SafeAreaInsets {
    struct Element {
        var regions: SafeAreaRegions
        var insets: EdgeInsets
        var cornerInsets: AbsoluteRectangleCornerInsets?
    }
}

extension SafeAreaInsets {
    enum OptionalValue {
        indirect case insets(SafeAreaInsets)
        case empty
    }
}

struct _SafeAreaInsetsModifier: PrimitiveViewModifier, MultiViewModifier {
    private(set) var elements: [SafeAreaInsets.Element]
    @safe private(set) nonisolated(unsafe) var nextInsets: SafeAreaInsets.OptionalValue?
    
    nonisolated init(insets: EdgeInsets, cornerInsets: AbsoluteRectangleCornerInsets?, nextInsets: SafeAreaInsets.OptionalValue?) {
        fatalError("TODO") // TODO
    }
    
    nonisolated init() {
        self.elements = []
        self.nextInsets = nil
    }
    
    nonisolated init(elements: [SafeAreaInsets.Element], nextInsets: SafeAreaInsets.OptionalValue?) {
        self.elements = elements
        self.nextInsets = nextInsets
    }
    
    @inlinable
    @inline(__always)
    static func _makeView(modifier: _GraphValue<_SafeAreaInsetsModifier>, inputs: _ViewInputs, body: (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        // x29 = sp + 0x260
        /*
         modifier = w28
         inputs = x19
         body = sp + 0x10 & 0x18
         */
        // sp + 0x1a0
        let copy_1 = inputs
        // x25
        let id = CoordinateSpace.ID()
        // x23
        let cachedEnvironment = copy_1.base.cachedEnvironment
        // w22
        let transform = inputs.transform
        // sp, #0x140
        var copy_2 = inputs
        // x24
        let animatedPosition = cachedEnvironment.value.animatedPosition(for: copy_2)
        copy_2 = copy_1
        // x20
        let animatedSize = cachedEnvironment.value.animatedSize(for: copy_2)
        _ = consume cachedEnvironment
        
        // sp, #0x140
        let transformRule = _SafeAreaInsetsModifier.Transform(
            space: id,
            transform: transform,
            position: animatedPosition,
            size: animatedSize
        )
        // x24
        let transformAttribute = Attribute(transformRule)
        
        // sp, #0x140
        let insetsRule = _SafeAreaInsetsModifier.Insets(
            space: id,
            modifier: modifier.value,
            next: copy_1.safeAreaInsets
        )
        // x25
        let insetsAttribute = Attribute(insetsRule)
        
        // <+424>
        // sp, #0x80
        var copy_3 = inputs
        copy_3.transform = transformAttribute
        copy_3.safeAreaInsets = OptionalAttribute(insetsAttribute)
        // sp, #0x20
        let copy_4 = copy_3
        
        return body(_Graph(), copy_4)
    }
}

extension _SafeAreaInsetsModifier {
    fileprivate struct Transform: Rule, AsyncAttribute {
        let space: CoordinateSpace.ID
        @Attribute var transform: ViewTransform
        @Attribute var position: CGPoint
        @Attribute var size: ViewSize
        
        var value: ViewTransform {
            let space = space
            // positionAdjustment = d10/d11, pendingTranslation = d8/d9
            var transform = transform
            
            let position = position
            
            var adjusted = position
            adjusted -= transform.positionAdjustment
            adjusted -= transform.pendingTranslation
            
            transform.positionAdjustment = CGSize(width: position.x, height: position.y)
            transform.pendingTranslation = CGSize(width: adjusted.x, height: adjusted.y)
            
            transform.appendSizedSpace(id: space, size: size.value)
            return transform
        }
    }
    
    fileprivate struct Insets: Rule, AsyncAttribute {
        var value: SafeAreaInsets {
            fatalError("TODO")
        }
        let space: CoordinateSpace.ID
        @Attribute var modifier: _SafeAreaInsetsModifier
        @OptionalAttribute var next: SafeAreaInsets?
    }
}

@frozen public struct SafeAreaRegions: OptionSet {
    public static var all: SafeAreaRegions {
        SafeAreaRegions(rawValue: .max)
    }
    
    public static var container: SafeAreaRegions {
        SafeAreaRegions(rawValue: 1 << 0)
    }
    
    public static var keyboard: SafeAreaRegions {
        SafeAreaRegions(rawValue: 1 << 1)
    }
    
    public static var background: SafeAreaRegions {
        SafeAreaRegions(rawValue: 1 << 0)
    }
    
    public let rawValue: UInt
    
    @inlinable
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}  
