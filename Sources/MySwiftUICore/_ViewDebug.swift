#warning("TODO")
private import _DarwinFoundation3._stdlib
private import AttributeGraph

public enum _ViewDebug {
    static nonisolated(unsafe) var isInitialized = false
    static nonisolated(unsafe) var properties: _ViewDebug.Properties = []
}

extension _ViewDebug {
    static func initialize(inputs: inout _ViewInputs) {
        if !_ViewDebug.isInitialized {
            if let value = getenv("SWIFTUI_VIEW_DEBUG") {
                _ViewDebug.properties = _ViewDebug.Properties(rawValue: UInt32(atoi(value)))
            }
            _ViewDebug.isInitialized = true
        }
        
        if !_ViewDebug.properties.isEmpty {
            Subgraph.setShouldRecordTree()
        }
    }
    
    static func reallyWrap<T>(_: inout _ViewOutputs, value: _GraphValue<T>, inputs: UnsafePointer<_ViewInputs>) {
        // value는 안 쓰이는 값으로 추정
        fatalError("TODO")
    }
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
