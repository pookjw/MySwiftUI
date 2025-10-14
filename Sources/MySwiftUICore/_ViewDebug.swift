#warning("TODO")

public enum _ViewDebug {
}

extension _ViewDebug {
    public enum Property : UInt32, Hashable {
        case type
        case value
        case transform
        case position
        case size
        case environment
        case phase
        case layoutComputer
        case displayList
    }
}

extension _ViewDebug {
    public struct Properties: OptionSet {
        public let rawValue: UInt32
        
        public init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        @inlinable package init(_ property: _ViewDebug.Property) {
            self.init(rawValue: 1 << property.rawValue)
        }
        
        public nonisolated(unsafe) static let type = _ViewDebug.Properties(rawValue: (1 << 0))
        public nonisolated(unsafe) static let value = _ViewDebug.Properties(rawValue: (1 << 1))
        public nonisolated(unsafe) static let transform = _ViewDebug.Properties(rawValue: (1 << 2))
        public nonisolated(unsafe) static let position = _ViewDebug.Properties(rawValue: (1 << 3))
        public nonisolated(unsafe) static let size = _ViewDebug.Properties(rawValue: (1 << 4))
        public nonisolated(unsafe) static let environment = _ViewDebug.Properties(rawValue: (1 << 5))
        public nonisolated(unsafe) static let phase = _ViewDebug.Properties(rawValue: (1 << 6))
        public nonisolated(unsafe) static let layoutComputer = _ViewDebug.Properties(rawValue: (1 << 7))
        public nonisolated(unsafe) static let displayList = _ViewDebug.Properties(rawValue: (1 << 8))
        public nonisolated(unsafe) static let all = _ViewDebug.Properties(rawValue: .max)
    }
}

extension _ViewDebug {
    public struct Data {
        
    }
}
