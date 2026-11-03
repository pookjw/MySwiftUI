protocol __CoreConvertible {
    associatedtype Core
    
    var core: Self.Core {
        get
    }
    
    init(core: Self.Core)
}
