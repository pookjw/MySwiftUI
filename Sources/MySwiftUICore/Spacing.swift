// EF1C7FCB82CB27FA7772A4944789FD3D
internal import CoreGraphics

package struct Spacing: Equatable, CustomStringConvertible {
    var minima: [Spacing.Key: Spacing.Value]
    
    package var description: String {
        fatalError("TODO")
    }
    
    init(minima: [Spacing.Key: Spacing.Value]) {
        self.minima = minima
    }
    
    init() {
        minima = [
            Spacing.Key(category: .edgeBelowText, edge: .top): Spacing.Value(0),
            Spacing.Key(category: .edgeAboveText, edge: .bottom): Spacing.Value(0),
            Spacing.Key(category: .edgeRightText, edge: .left): Spacing.Value(0),
            Spacing.Key(category: .edgeLeftText, edge: .right): Spacing.Value(0),
        ]
    }
    
    func incorporate(_: AbsoluteEdge.Set, of: Spacing) {
        fatalError("TODO")
    }
    
    func reset(_: Edge.Set, layoutDirection: LayoutDirection) {
        fatalError("TODO")
    }
    
    func clear(_: Edge.Set, layoutDirection: LayoutDirection) {
        fatalError("TODO")
    }
    
    var isLayoutDirectionSymmetric: Bool {
        fatalError("TODO")
    }
    
    func distanceToSuccessorView(along axis: Axis, layoutDirection: LayoutDirection, preferring: Spacing) -> CGFloat? {
        /*
         preferring.minima -> x8
         self.minima -> x9
         */
        var w11: AbsoluteEdge
        var w12: AbsoluteEdge
        
        switch layoutDirection {
        case .leftToRight:
            w11 = .right
            w12 = .left
        case .rightToLeft:
            w11 = .left
            w12 = .right
        }
        
        var w10: AbsoluteEdge
        
        switch axis {
        case .horizontal:
            w10 = w11
            w11 = w12
        case .vertical:
            w10 = .bottom
            w11 = .top
        }
        
        // sp + 0x18
        let x20: Spacing
        // sp + 0x17
        let x0: AbsoluteEdge
        // sp + 0x16
        let x1: AbsoluteEdge
        // sp + 0x8
        let x2: Spacing
        if self.minima.count < preferring.minima.count {
            // <+76>
            x20 = self
            x0 = w10
            x1 = w11
            x2 = preferring
        } else {
            // <+96>
            x20 = preferring
            x0 = w11
            x1 = w10
            x2 = self
        }
        
        // <+112>
        return x20._distance(from: x0, to: x1, ofViewPreferring: x2)
    }
    
    static var defaultMinimum: CGFloat {
        let defaultValue = defaultValue
        return min(defaultValue.width, defaultValue.height)
    }
    
    func clear(_ set: AbsoluteEdge.Set) {
        fatalError("TODO")
    }
    
    func reset(_ set: AbsoluteEdge.Set) {
        fatalError("TODO")
    }
    
    fileprivate func _distance(from: AbsoluteEdge, to: AbsoluteEdge, ofViewPreferring preferring: Spacing) -> CGFloat? {
        /*
         from -> sp + 0x44
         to -> sp + 0x34
         preferring -> x19 -> x20 -> sp + 0x38
         self -> x27
         */
        var sp0x28 = true
        var sp0x20: CGFloat = 0
        // key -> x9
        // value -> x24, x28, x9, d13, w19
        for (key, value) in self.minima {
            // <+200>
            // w21
            if (key.category != .default) || (key.edge != from) {
                continue
            }
            
            // <+296>
            // key -> x9
            // x15, x14, x10, _, w9
            guard let preferringValue = preferring.minima[key] else {
                continue
            }
            
            // <+328>
            // inlined
            guard var d0 = value.distance(to: preferringValue) else {
                continue
            }
            
            // <+1700>
            var d1 = sp0x20
            let d2: CGFloat = .infinity
            if !sp0x28 {
                d1 = d2
            }
            
            if d1 > d0 {
                d0 = d1
            }
            
            sp0x20 = d1
            sp0x28 = false
        }
        
        // <+1872>
        guard sp0x28 else {
            return sp0x20
        }
        
        // <+1888>
        // d8/w21
        var d8: CGFloat?
        
        if let value = self.minima[Spacing.Key(category: .default, edge: from)] {
            d8 = value.value
        } else {
            d8 = nil
        }
        
        // <+1996>
        // x0/w8
        let x0: CGFloat?
        if let value = preferring.minima[Spacing.Key(category: .default, edge: to)] {
            // <+2032>
            x0 = value.value
        } else {
            // <+2084>
            x0 = nil
        }
        
        if let d8 {
            // <+2068>
            if let x0 {
                // <+2116>
                if d8 <= x0 {
                    return x0
                } else {
                    return d8
                }
            } else {
                // <+2072>
                if d8 <= -.infinity {
                    return .infinity
                } else {
                    return d8
                }
            }
        } else {
            // <+2096>
            if let x0 {
                // <+2108>
                if -CGFloat.infinity <= x0 {
                    return x0
                } else {
                    return -.infinity
                }
            } else {
                // <+2100>
                return nil
            }
        }
    }
    
    @safe static nonisolated(unsafe) var defaultValue = CGSize(width: 8, height: 8)
    
    static let zero = Spacing.all(0)
    
    static func all(_ value: CGFloat) -> Spacing {
        return Spacing(
            minima: [
                Spacing.Key(category: .default, edge: .left): Spacing.Value(value),
                Spacing.Key(category: .default, edge: .bottom): Spacing.Value(value),
                Spacing.Key(category: .default, edge: .right): Spacing.Value(value),
                Spacing.Key(category: .default, edge: .top): Spacing.Value(value)
            ]
        )
    }
    
    static func horizontal(_ value: CGFloat) -> Spacing {
        return Spacing(
            minima: [
                Spacing.Key(category: .default, edge: .left): Spacing.Value(value),
                Spacing.Key(category: .default, edge: .right): Spacing.Value(value)
            ]
        )
    }
    
    static func vertical(_ value: CGFloat) -> Spacing {
        return Spacing(
            minima: [
                Spacing.Key(category: .default, edge: .top): Spacing.Value(value),
                Spacing.Key(category: .default, edge: .bottom): Spacing.Value(value)
            ]
        )
    }
}

extension Spacing {
    struct Category: Hashable {
        static let `default` = Spacing.Category()
        static let textToText = Spacing.Category()
        static let edgeAboveText = Spacing.Category()
        static let edgeBelowText = Spacing.Category()
        static let textBaseline = Spacing.Category()
        static let edgeLeftText = Spacing.Category()
        static let edgeRightText = Spacing.Category()
        static let leftTextBaseline = Spacing.Category()
        static let rightTextBaseline = Spacing.Category()
        
        var base: UniqueID
        
        init() {
            base = UniqueID()
        }
    }
    
    struct Key: Hashable {
        var category: Spacing.Category
        var edge: AbsoluteEdge
        
        init(category: Spacing.Category, edge: AbsoluteEdge) {
            self.category = category
            self.edge = edge
        }
    }
    
    struct TextMetrics: Comparable {
        var ascend: CGFloat
        var descend: CGFloat
        var leading: CGFloat
        var pixelLength: CGFloat
        
        init(ascend: CGFloat, descend: CGFloat, leading: CGFloat, pixelLength: CGFloat) {
            self.ascend = ascend
            self.descend = descend
            self.leading = leading
            self.pixelLength = pixelLength
        }
        
        var lineSpacing: CGFloat {
            return ascend + descend + leading
        }
        
        static func < (lhs: Spacing.TextMetrics, rhs: Spacing.TextMetrics) -> Bool {
            return lhs.lineSpacing < rhs.lineSpacing
        }
        
        static func spacing(top: Spacing.TextMetrics, bottom: Spacing.TextMetrics) -> CGFloat {
            fatalError("TODO")
        }
    }
    
    enum Value: Comparable {
        case distance(CGFloat)
        case topTextMetrics(Spacing.TextMetrics)
        case bottomTextMetrics(Spacing.TextMetrics)
        
        static func < (lhs: Spacing.Value, rhs: Spacing.Value) -> Bool {
            switch (lhs, rhs) {
            case (.distance(let lhs), .distance(let rhs)):
                return lhs < rhs
            case (.topTextMetrics(let lhs), .topTextMetrics(let rhs)):
                return lhs < rhs
            case (.bottomTextMetrics(let lhs), .bottomTextMetrics(let rhs)):
                return lhs < rhs
            default:
                return false
            }
        }
        
        init(_ value: CGFloat) {
            self = .distance(value)
        }
        
        var value: CGFloat? {
            guard case .distance(let value) = self else {
                return nil
            }
            
            return value
        }
        
        func distance(to other: Spacing.Value) -> CGFloat? {
            switch self {
            case .distance(let value):
                if case .distance(let other) = other {
                    return value + other
                } else {
                    return value
                }
            case .topTextMetrics(let top):
                if case .bottomTextMetrics(let bottom) = other {
                    return Spacing.TextMetrics.spacing(top: top, bottom: bottom)
                } else {
                    return nil
                }
            case .bottomTextMetrics(let bottom):
                if case .topTextMetrics(let top) = other {
                    return Spacing.TextMetrics.spacing(top: top, bottom: bottom)
                } else {
                    return nil
                }
            }
        }
    }
}
