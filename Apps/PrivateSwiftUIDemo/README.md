-enable-private-imports

// MARK: Private

@available(macOS 14.0, iOS 17.0, watchOS 10.0, tvOS 17.0, *)
@_originallyDefinedIn(module: "SwiftUI", iOS 17.0)
@_originallyDefinedIn(module: "SwiftUI", macOS 14.0)
@_originallyDefinedIn(module: "SwiftUI", tvOS 17.0)
@_originallyDefinedIn(module: "SwiftUI", watchOS 10.0)
public enum ContentOffsetAdjustmentReason: UInt32, Hashable {
    case translation
    case positionTranslation
    case alignment
    case reset
    
    public static var maxValue: UInt32 { get }
    
    public func shouldAdjust(isScrolling: Bool, isTransitioning: Bool) -> Bool
}

@available(macOS 14.0, iOS 18.0, watchOS 10.0, tvOS 17.0, *)
@_originallyDefinedIn(module: "SwiftUI", iOS 18.0)
@_originallyDefinedIn(module: "SwiftUI", macOS 14.0)
@_originallyDefinedIn(module: "SwiftUI", tvOS 17.0)
@_originallyDefinedIn(module: "SwiftUI", watchOS 10.0)
public struct ScrollPhaseState: Equatable, CustomStringConvertible {
    public var shouldUpdateValue: Swift.Bool { get }
    
    public var phase: SwiftUICore.ScrollPhase
    public var velocity: CoreGraphics.CGVector
    
    public var isScrolling: Bool { get }
    public var isTracking: Bool { get }
    public var isInteracting: Bool { get }
    public var isDecelerating: Bool { get }
    public var isAnimating: Bool { get }
    
    public init(phase: SwiftUICore.ScrollPhase, velocity: CoreGraphics.CGVector)
}

@available(macOS 14.0, iOS 18.0, watchOS 10.0, tvOS 17.0, *)
@_originallyDefinedIn(module: "SwiftUI", iOS 18.0)
@_originallyDefinedIn(module: "SwiftUI", macOS 14.0)
@_originallyDefinedIn(module: "SwiftUI", tvOS 17.0)
@_originallyDefinedIn(module: "SwiftUI", watchOS 10.0)
public struct BloomFilter: Equatable {
    public var value: UInt
    public init()
}
@available(macOS 14.0, iOS 18.0, watchOS 10.0, tvOS 17.0, *)
@_originallyDefinedIn(module: "SwiftUI", iOS 18.0)
@_originallyDefinedIn(module: "SwiftUI", macOS 14.0)
@_originallyDefinedIn(module: "SwiftUI", tvOS 17.0)
@_originallyDefinedIn(module: "SwiftUI", watchOS 10.0)
public final class ArchiveReader {
    public static var readerKey: CodingUserInfoKey { get }
    public static var cacheKey: CodingUserInfoKey { get }
    public static var namedImagesKey: CodingUserInfoKey { get }
    
    private init(buffer: UnsafeBufferPointer<UInt8>) throws

    public subscript(index: Int) -> Data {
        get
    }
}

