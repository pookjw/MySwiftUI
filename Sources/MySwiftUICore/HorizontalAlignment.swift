public import CoreGraphics

@frozen public struct HorizontalAlignment: Equatable {
    public init(_ id: any AlignmentID.Type) {
        key = AlignmentKey(id: id, axis: .horizontal)
    }
    
    @_documentation(visibility: private) public let key: AlignmentKey
}

extension HorizontalAlignment {
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Sequence, S.Element == CGFloat? {
        assertUnimplemented()
    }
}

extension HorizontalAlignment {
    public static let leading: HorizontalAlignment = {
        assertUnimplemented()
    }()
    
    public static let center = HorizontalAlignment(HorizontalAlignment.Center.self)
    
    public static let trailing: HorizontalAlignment = {
        assertUnimplemented()
    }()
}

extension HorizontalAlignment {
    public static let listRowSeparatorLeading: HorizontalAlignment = {
        assertUnimplemented()
    }()
    
    public static let listRowSeparatorTrailing: HorizontalAlignment = {
        assertUnimplemented()
    }()
}

extension HorizontalAlignment {
    fileprivate struct TrailingListSeparator: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            assertUnimplemented()
        }
    }
    
    fileprivate struct LeadingListSeparator: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            assertUnimplemented()
        }
    }
    
    fileprivate struct Trailing: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.size.value.width
        }
    }
    
    fileprivate struct Leading: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return 0
        }
    }
    
    fileprivate struct LeadingText: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            assertUnimplemented()
        }
    }
    
    fileprivate struct Center: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.size.value.width * 0.5
        }
    }
    
    fileprivate struct FormDetailLeading: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            assertUnimplemented()
        }
    }
}

extension HorizontalAlignment: Sendable {}
extension HorizontalAlignment: BitwiseCopyable {}

extension HorizontalAlignment: AlignmentGuide {
}
