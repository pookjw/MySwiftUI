package enum ProtobufFormat {}

extension ProtobufFormat {
    package struct WireType: Equatable {
        package let rawValue: UInt
        
        package init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        package static var varint: WireType { WireType(rawValue: 0) }
        package static var fixed64: WireType { WireType(rawValue: 1) }
        package static var lengthDelimited: WireType { WireType(rawValue: 2) }
        package static var fixed32: WireType { WireType(rawValue: 5) }
    }
}

extension ProtobufFormat {
    package struct Field: Equatable {
        package let rawValue: UInt
        
        package init(rawValue: UInt) {
            self.rawValue = rawValue
        }
        
        package init(_ tag: UInt, wireType: WireType) {
            rawValue = wireType.rawValue | (tag &<< 3)
        }
        
        package var tag: UInt {
            return rawValue &>> 3
        }
        
        package func tag<Value>(as type: Value.Type = Value.self) -> Value where Value : ProtobufTag {
            return Value(rawValue: tag)
        }
        
        package var wireType: WireType {
            return WireType(rawValue: rawValue & 7)
        }
        
        package var _isEmpty: Bool {
            rawValue == 0
        }
    }
}
