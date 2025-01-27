@propertyWrapper
package struct ProtobufCodable<Value>: Codable where Value : Codable {
    package var wrappedValue: Value
    
    package init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

extension ProtobufCodable: Equatable where Value : Equatable {}
