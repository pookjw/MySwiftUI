package struct PropertyList {
    
}

extension PropertyList {
    package final class Tracker {
        
    }
}

extension PropertyList {
    @_spi(MySwiftUICorePrivate)
    open class Element: CustomStringConvertible {
        public init(keyType: Any.Type, before: Element?, after: Element?) {
            fatalError("TODO")
        }
        
        open var description: String {
            // override me
            fatalError()
        }
        
        open func value<Value>(as: Value.Type) -> Value {
            // override me
            fatalError()
        }
    }
}
