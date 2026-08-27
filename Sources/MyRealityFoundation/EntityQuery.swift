// 7A54867B5174F75ADC33C900CF3D7781
private import CoreRE

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct EntityQuery : @unchecked Sendable {
    private let _predicate: QueryPredicate<MyRealityFoundation::Entity>
    private var destructor: EntityQuery.Destructor?
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init() {
        assertUnimplemented()
    }
    
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public init(where predicate: QueryPredicate<Entity>) {
        self._predicate = predicate
        self.destructor = nil
        
        let factory = PredicateFactory()
        factory.enumerate(predicate)
        
        if let top = unsafe factory.top {
            let predicate = unsafe unsafeBitCast(top, to: CoreRE::Predicate.self)
            let query = CoreRE::Query(predicate: predicate)
            
            self.destructor = unsafe EntityQuery.Destructor(
                unsafeBitCast(query, to: OpaquePointer.self)
            )
        }
    }
}

extension EntityQuery {
    struct Selector {
        // TODO
    }
    
    @safe fileprivate final class Destructor {
        private var internalQuery: OpaquePointer?
        
        init(_ query: OpaquePointer?) {
            unsafe self.internalQuery = query
        }
        
        deinit {
            if let internalQuery = unsafe self.internalQuery {
                unsafe unsafeBitCast(internalQuery, to: CoreRE::Query.self)
                    .destroy()
            }
        }
    }
}

@safe final class PredicateFactory : QueryEnumerator, @unchecked Sendable {
    private var predicatePath: [OpaquePointer]
    fileprivate private(set) var top: OpaquePointer?
    
    init() {
        unsafe self.predicatePath = []
        unsafe self.top = nil
    }
    
    func connect<T>(_: T.Type, from: OpaquePointer, to: OpaquePointer) {
        assertUnimplemented()
    }
    
    func enumerate<T>(_ predicate: QueryPredicate<T>) {
        let last = unsafe self.predicatePath.last
        
        guard let internalPtr = unsafe predicate.makeInternalBlock() else {
            return
        }
        
        unsafe self.predicatePath.append(internalPtr)
        predicate.enumerateBlock(self)
        
        if let last = unsafe last  {
            unsafe unsafeBitCast(last, to: CoreRE::Predicate.self)
                .connectEntityPredicate(unsafeBitCast(internalPtr, to: CoreRE::Predicate.self))
        } else {
            unsafe self.top = internalPtr
        }
        
        let _ = unsafe self.predicatePath.popLast()
    }
    
    func enumerate<T, U>(_: QueryType<T, U>) {
        assertUnimplemented()
    }
}
