public import CoreGraphics

@frozen public struct VerticalAlignment: Equatable {
    public init(_ id: any AlignmentID.Type) {
        fatalError("TODO")
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
  
  public static let firstTextBaseline: VerticalAlignment = {
      fatalError("TODO")
  }()
  
  public static let lastTextBaseline: VerticalAlignment = {
      fatalError("TODO")
  }()
}

extension VerticalAlignment: Sendable {}
extension VerticalAlignment: BitwiseCopyable {}
