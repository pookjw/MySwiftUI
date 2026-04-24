// 1135C055CD2C2B1265C25B13E3E74C01
public import CoreGraphics

@frozen public struct VerticalAlignment : Equatable {
    public init(_ id: any AlignmentID.Type) {
        key = AlignmentKey(id: id, axis: .vertical)
    }
    
    @_documentation(visibility: private) public let key: AlignmentKey
}

extension VerticalAlignment {
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Sequence, S.Element == CGFloat? {
        assertUnimplemented()
    }
}

extension VerticalAlignment {
    public static let top = VerticalAlignment(VerticalAlignment.Top.self)
    public static let center = VerticalAlignment(VerticalAlignment.Center.self)
    public static let bottom = VerticalAlignment(VerticalAlignment.Bottom.self)
    public static let firstTextBaseline = VerticalAlignment(VerticalAlignment.FirstTextBaseline.self)
    public static let lastTextBaseline = VerticalAlignment(VerticalAlignment.LastTextBaseline.self)
}

extension VerticalAlignment : Sendable {}
extension VerticalAlignment : BitwiseCopyable {}

extension VerticalAlignment {
    fileprivate enum Center : FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height * 0.5
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            assertUnimplemented()
        }
    }
    
    fileprivate enum FirstTextBaseline : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            assertUnimplemented()
        }
    }
    
    fileprivate enum LastTextBaseline : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            assertUnimplemented()
        }
    }
    
    fileprivate enum FirstTextLineCenter : AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            assertUnimplemented()
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            assertUnimplemented()
        }
    }
    
    fileprivate enum Top : FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return 0
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            assertUnimplemented()
        }
    }
    
    fileprivate enum Bottom : FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.height
        }
        
        static func _combineExplicit(childValue: CGFloat, _ n: Int, into parentValue: inout CGFloat?) {
            assertUnimplemented()
        }
    }
}
