// 1135C055CD2C2B1265C25B13E3E74C01
public import CoreGraphics

@frozen public struct VerticalAlignment: Equatable {
    public init(_ id: any AlignmentID.Type) {
        key = AlignmentKey(id: id, axis: .vertical)
    }
    
    @_documentation(visibility: private) public let key: AlignmentKey
}

extension VerticalAlignment {
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Sequence, S.Element == CGFloat? {
        fatalError("TODO")
    }
}

extension VerticalAlignment {
    public static let top: VerticalAlignment = {
        fatalError("TODO")
    }()
    
    public static let center: VerticalAlignment = {
        fatalError("TODO")
    }()
    
    public static let bottom: VerticalAlignment = {
        fatalError("TODO")
    }()
    
    public static let firstTextBaseline = VerticalAlignment(VerticalAlignment.FirstTextBaseline.self)
    
    public static let lastTextBaseline = VerticalAlignment(VerticalAlignment.LastTextBaseline.self)
}

extension VerticalAlignment: Sendable {}
extension VerticalAlignment: BitwiseCopyable {}

extension VerticalAlignment {
    fileprivate enum FirstTextBaseline: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            fatalError("TODO")
        }
    }
    
    fileprivate enum LastTextBaseline: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            fatalError("TODO")
        }
    }
}
