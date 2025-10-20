// _C4DC82F2A500E9B6DEA3064A36584B42
#warning("TODO")
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

struct _SafeAreaInsetsModifier: ViewModifier {
    var elements: [SafeAreaInsets.Element] = []
    var nextInsets: SafeAreaInsets.OptionalValue? = nil
    
    func body(content: Content) -> some View {
        fatalError("TODO") // TODO
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
        var copy_1 = inputs
        // x25
        let id = CoordinateSpace.ID(value: UniqueID())
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
        // sp, #0x20
        var copy_4 = copy_3
        
        return body(_Graph(), copy_4)
    }
}

extension _SafeAreaInsetsModifier {
    fileprivate struct Transform: Rule, AsyncAttribute {
        var value: ViewTransform {
            // 단순히 transform의 값을 반환하지 않음
            fatalError("TODO")
        }
        
        let space: CoordinateSpace.ID
        @Attribute var transform: ViewTransform
        @Attribute var position: CGPoint
        @Attribute var size: ViewSize
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
