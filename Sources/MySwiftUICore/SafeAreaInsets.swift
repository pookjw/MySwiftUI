#warning("TODO")

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
    indirect enum OptionalValue {
        case insets(SafeAreaInsets)
        case empty
    }
}

struct _SafeAreaInsetsModifier {
    var elements: [SafeAreaInsets.Element] = []
    var nextInsets: SafeAreaInsets.OptionalValue? = nil
}

@frozen public struct SafeAreaRegions: OptionSet {
    public let rawValue: UInt
    
    @inlinable
    public init(rawValue: UInt) {
        self.rawValue = rawValue
    }
}  
