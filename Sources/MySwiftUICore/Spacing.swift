// EF1C7FCB82CB27FA7772A4944789FD3D
internal import CoreGraphics

package struct Spacing: Equatable, CustomStringConvertible {
    var minima: [Spacing.Key: Spacing.Value]
    
    package var description: String {
        fatalError("TODO")
    }
    
    init(minima: [Spacing.Key : Spacing.Value]) {
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
    
    func distanceToSuccessorView(along: Axis, layoutDirection: LayoutDirection, preferring: Spacing) -> CGFloat? {
        fatalError("TODO")
    }
    
    static var defaultMinimum: CGFloat {
        let defaultValue = unsafe defaultValue
        return min(defaultValue.width, defaultValue.height)
    }
    
    func clear(_ set: AbsoluteEdge.Set) {
        fatalError("TODO")
    }
    
    func reset(_ set: AbsoluteEdge.Set) {
        fatalError("TODO")
    }
    
    fileprivate func _distance(from: AbsoluteEdge, to: AbsoluteEdge, ofViewPreferring: Spacing) -> CGFloat? {
        fatalError("TODO")
    }
    
    static nonisolated(unsafe) var defaultValue = CGSize(width: 8, height: 8)
    
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
