package struct _ViewDebug {
    
}

extension _ViewDebug {
    package struct Properties: OptionSet, Equatable {
        package let rawValue: UInt32
        
        package init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        package init(_ property: Property) {
//            var w9 = property.rawValue
//            var w10 = UInt32(0x1)
//            w10 = w10 &<< w9
//            w9 = (w9 < 0x20) ? w10 : 0
            rawValue = 1 &<< property.rawValue
        }
        
        package static var type: Properties { Properties(.type) }
        package static var value: Properties { Properties(.value) }
        package static var transform: Properties { Properties(.transform) }
        package static var position: Properties { Properties(.position) }
        package static var size: Properties { Properties(.size) }
        package static var environment: Properties { Properties(.environment) }
        package static var phase: Properties { Properties(.phase) }
        package static var layoutComputer: Properties { Properties(.layoutComputer) }
        package static var displayList: Properties { Properties(.displayList) }
        package static var all: Properties { Properties(rawValue: UInt32.max) /* 0xffffffff */ }
    }
    
    package enum Property: UInt32, Hashable {
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
