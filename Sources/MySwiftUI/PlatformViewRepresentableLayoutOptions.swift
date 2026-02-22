@available(iOS 16.1, macOS 13.0, tvOS 16.1, watchOS 9.1, *)
public struct _PlatformViewRepresentableLayoutOptions: OptionSet {
    public let rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    @available(iOS 16.1, tvOS 16.1, watchOS 9.1, macOS 13.0, *)
    public typealias ArrayLiteralElement = _PlatformViewRepresentableLayoutOptions
    
    @available(iOS 16.1, tvOS 16.1, watchOS 9.1, macOS 13.0, *)
    public typealias Element = _PlatformViewRepresentableLayoutOptions
    
    @available(iOS 16.1, tvOS 16.1, watchOS 9.1, macOS 13.0, *)
    public typealias RawValue = Int
}

@available(*, unavailable)
extension _PlatformViewRepresentableLayoutOptions: Sendable {
}
