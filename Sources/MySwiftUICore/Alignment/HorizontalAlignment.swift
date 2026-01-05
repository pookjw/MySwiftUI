public import CoreGraphics

@frozen public struct HorizontalAlignment: Equatable {
    public init(_ id: any AlignmentID.Type) {
        key = AlignmentKey(id: id, axis: .horizontal)
    }
    
    @_documentation(visibility: private) public let key: AlignmentKey
}

extension HorizontalAlignment {
    public func combineExplicit<S>(_ values: S) -> CGFloat? where S : Sequence, S.Element == CGFloat? {
        fatalError("TODO")
    }
}

extension HorizontalAlignment {
    public static let leading: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let center = HorizontalAlignment(HorizontalAlignment.Center.self)
    
    public static let trailing: HorizontalAlignment = {
        fatalError("TODO")
    }()
}

extension HorizontalAlignment {
    public static let listRowSeparatorLeading: HorizontalAlignment = {
        fatalError("TODO")
    }()
    
    public static let listRowSeparatorTrailing: HorizontalAlignment = {
        fatalError("TODO")
    }()
}

extension HorizontalAlignment {
    fileprivate struct TrailingListSeparator: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
        }
    }
    
    fileprivate struct LeadingListSeparator: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
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
            fatalError("TODO")
        }
    }
    
    fileprivate struct Center: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            return context.size.value.width * 0.5
        }
    }
    
    fileprivate struct FormDetailLeading: FrameAlignment {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            fatalError("TODO")
        }
    }
}

extension HorizontalAlignment: Sendable {}
extension HorizontalAlignment: BitwiseCopyable {}

extension HorizontalAlignment: AlignmentGuide {
}
