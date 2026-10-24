public import CoreGraphics

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text {
    public struct Layout : RandomAccessCollection, Equatable {
        @available(iOS 18.0, macOS 15.0, tvOS 18.0, watchOS 11.0, visionOS 2.0, *)
        public var isTruncated: Bool {
            get {
                assertUnimplemented()
            }
        }

        public var startIndex: Int {
            @_alwaysEmitIntoClient get { 0 }
        }

        public var endIndex: Int {
            get {
                assertUnimplemented()
            }
        }

        public subscript(index: Int) -> Text.Layout.Line {
            get {
                assertUnimplemented()
            }
        }

        @frozen public struct CharacterIndex : Comparable, Hashable, Strideable, Sendable {
            @usableFromInline
            package var value: Int

            @_alwaysEmitIntoClient internal init(value: Int) {
                self.value = value
            }

            @_alwaysEmitIntoClient public static func < (lhs: Text.Layout.CharacterIndex, rhs: Text.Layout.CharacterIndex) -> Bool {
                return lhs.value < rhs.value
            }

            @_alwaysEmitIntoClient public func advanced(by n: Int) -> Text.Layout.CharacterIndex {
                return .init(value: value + n)
            }

            @_alwaysEmitIntoClient public func distance(to other: Text.Layout.CharacterIndex) -> Int {
                return other.value - value
            }

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Stride = Int

            public func hash(into hasher: inout Hasher) {
                assertUnimplemented()
            }

            public var hashValue: Int {
                get {
                    assertUnimplemented()
                }
            }
        }

        @frozen public struct TypographicBounds : Equatable, Sendable {
            public var origin: CGPoint

            public var width: CGFloat

            public var ascent: CGFloat

            public var descent: CGFloat

            public var leading: CGFloat

            @_alwaysEmitIntoClient public init() {
                origin = .init()
                (width, ascent, descent, leading) = (0, 0, 0, 0)
            }

            public var rect: CGRect {
                @_alwaysEmitIntoClient get {
                    return CGRect(x: origin.x, y: origin.y - ascent,
                    width: width, height: ascent + descent)
                }
            }

            public static func == (a: Text.Layout.TypographicBounds, b: Text.Layout.TypographicBounds) -> Bool {
                assertUnimplemented()
            }
        }

        public struct Line : RandomAccessCollection, Equatable {
            public var origin: CGPoint

            public var startIndex: Int {
                @_alwaysEmitIntoClient get { 0 }
            }

            public var endIndex: Int {
                get {
                    assertUnimplemented()
                }
            }

            public subscript(index: Int) -> Text.Layout.Run {
                get {
                    assertUnimplemented()
                }
            }

            public var typographicBounds: Text.Layout.TypographicBounds {
                get {
                    assertUnimplemented()
                }
            }

            public static func == (lhs: Text.Layout.Line, rhs: Text.Layout.Line) -> Bool {
                assertUnimplemented()
            }

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Element = Text.Layout.Run

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Index = Int

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Indices = Range<Int>

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Iterator = IndexingIterator<Text.Layout.Line>

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias SubSequence = Slice<Text.Layout.Line>
        }

        public struct Run : RandomAccessCollection, Equatable {
            public var startIndex: Int {
                @_alwaysEmitIntoClient get { 0 }
            }

            public var endIndex: Int {
                get {
                    assertUnimplemented()
                }
            }

            public subscript(index: Int) -> Text.Layout.RunSlice {
                @_alwaysEmitIntoClient get {
                    return self[index ..< index &+ 1]
                }
            }

            public subscript(bounds: Range<Int>) -> Text.Layout.RunSlice {
                @_alwaysEmitIntoClient get {
                    return RunSlice(run: self, indices: bounds)
                }
            }

            public subscript<T>(key: T.Type) -> T? where T : TextAttribute {
                get {
                    assertUnimplemented()
                }
            }

            public var layoutDirection: LayoutDirection {
                get {
                    assertUnimplemented()
                }
            }

            public var typographicBounds: Text.Layout.TypographicBounds {
                get {
                    assertUnimplemented()
                }
            }

            public var characterIndices: [Text.Layout.CharacterIndex] {
                get {
                    assertUnimplemented()
                }
            }

            public static func == (lhs: Text.Layout.Run, rhs: Text.Layout.Run) -> Bool {
                assertUnimplemented()
            }

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Element = Text.Layout.RunSlice

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Index = Int

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Indices = Range<Int>

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Iterator = IndexingIterator<Text.Layout.Run>

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias SubSequence = Text.Layout.RunSlice
        }

        public struct RunSlice : RandomAccessCollection, Equatable {
            public var run: Text.Layout.Run

            public var indices: Range<Int>

            public init(run: Text.Layout.Run, indices: Range<Int>) {
                assertUnimplemented()
            }

            public var startIndex: Int {
                @_alwaysEmitIntoClient get { indices.lowerBound }
            }

            public var endIndex: Int {
                @_alwaysEmitIntoClient get { indices.upperBound }
            }

            public subscript(index: Int) -> Text.Layout.RunSlice {
                @_alwaysEmitIntoClient get { self[index ..< index &+ 1] }
            }

            public subscript(bounds: Range<Int>) -> Text.Layout.RunSlice {
                get {
                    assertUnimplemented()
                }
            }

            public subscript<T>(key: T.Type) -> T? where T : TextAttribute {
                @_alwaysEmitIntoClient get { run[key] }
            }

            public var typographicBounds: Text.Layout.TypographicBounds {
                get {
                    assertUnimplemented()
                }
            }

            public var characterIndices: [Text.Layout.CharacterIndex] {
                get {
                    assertUnimplemented()
                }
            }

            public static func == (a: Text.Layout.RunSlice, b: Text.Layout.RunSlice) -> Bool {
                assertUnimplemented()
            }

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Element = Text.Layout.RunSlice

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Index = Int

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Indices = Range<Int>

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias Iterator = IndexingIterator<Text.Layout.RunSlice>

            @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
            public typealias SubSequence = Text.Layout.RunSlice
        }

        public static func == (a: Text.Layout, b: Text.Layout) -> Bool {
            assertUnimplemented()
        }

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias Element = Text.Layout.Line

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias Index = Int

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias Indices = Range<Int>

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias Iterator = IndexingIterator<Text.Layout>

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias SubSequence = Slice<Text.Layout>
    }
}

@available(*, unavailable)
extension Text.Layout : Sendable {
}

@available(*, unavailable)
extension Text.Layout.Line : Sendable {
}

@available(*, unavailable)
extension Text.Layout.Run : Sendable {
}

@available(*, unavailable)
extension Text.Layout.RunSlice : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text.Layout {
    @frozen public struct DrawingOptions : OptionSet {
        public let rawValue: UInt32

        @_alwaysEmitIntoClient public init(rawValue: UInt32) { self.rawValue = rawValue }

        @_alwaysEmitIntoClient public static var disablesSubpixelQuantization: Text.Layout.DrawingOptions {
            get {
                return .init(rawValue: 1 << 0)
            }
        }

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias ArrayLiteralElement = Text.Layout.DrawingOptions

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias Element = Text.Layout.DrawingOptions

        @available(iOS 17.0, tvOS 17.0, watchOS 10.0, macOS 14.0, *)
        public typealias RawValue = UInt32
    }
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text.Layout.CharacterIndex : BitwiseCopyable {}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text.Layout.TypographicBounds : BitwiseCopyable {}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text.Layout.DrawingOptions : Sendable {}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension Text.Layout.DrawingOptions : BitwiseCopyable {}
