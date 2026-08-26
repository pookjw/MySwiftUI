private import CoreRE

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@safe public struct QueryPredicate<Value> {
    private let evaluateBlock: @MainActor (Value) -> Bool
    private let makeInternalBlock: @MainActor () -> OpaquePointer?
    private let enumerateBlock: @MainActor (QueryEnumerator) -> ()
    private let performNativeEntityQueryBlock: (@MainActor (MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]?)?
    
    func enumerate(using enumerator: QueryEnumerator) {
        assertUnimplemented()
    }
    
    func performNativeEntityQuery(for scene: MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]? {
        assertUnimplemented()
    }
    
    func evaluate(value: Value) -> Bool {
        assertUnimplemented()
    }
    
    init<T : QueryPredicateProtocol>(_ predicate: T) where Self == T.Value {
        assertUnimplemented()
    }
}

extension QueryPredicate {
    @available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
    public static func has<T : MyRealityFoundation::Component>(_ t: T.Type) -> QueryPredicate<Entity> {
        return QueryPredicate.Has<MyRealityFoundation::Entity, T>()
            .eraseToQueryPredicate()
    }
    
    static func hasAll<T : MyRealityFoundation::Component, U : MyRealityFoundation::Component>(_: T.Type, _: U.Type) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func hasAll<T : MyRealityFoundation::Component, U : MyRealityFoundation::Component, V : MyRealityFoundation::Component>(_: T.Type, _: U.Type, _: V.Type) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func hasAll<T : MyRealityFoundation::Component, U : MyRealityFoundation::Component, V : MyRealityFoundation::Component, Y : MyRealityFoundation::Component>(_: T.Type, _: U.Type, _: V.Type, _: Y.Type) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func hasAny<T : MyRealityFoundation::Component, U : MyRealityFoundation::Component>(_: T.Type, _: U.Type) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func hasAny<T : MyRealityFoundation::Component, U : MyRealityFoundation::Component, V : MyRealityFoundation::Component>(_: T.Type, _: U.Type, _: V.Type) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func hasAny<T : MyRealityFoundation::Component, U : MyRealityFoundation::Component, V : MyRealityFoundation::Component, Y : MyRealityFoundation::Component>(_: T.Type, _: U.Type, _: V.Type, _: Y.Type) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func isChild(of entity: MyRealityFoundation::Entity) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func isChild(of entity: () -> MyRealityFoundation::Entity) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func isDescendant(of entity: MyRealityFoundation::Entity) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func isDescendant(of entity: () -> MyRealityFoundation::Entity) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static func canInteract(on scene: MyRealityFoundation::Scene?) -> QueryPredicate<MyRealityFoundation::Entity> {
        assertUnimplemented()
    }
    
    static var everything: QueryPredicate<Value> {
        assertUnimplemented()
    }
}

extension QueryPredicate {
    struct Has<T, U : MyRealityFoundation::Component> : QueryPredicateProtocol, QueryInternalizable {
        private let componentClass: CoreRE::Component.ClassPtr
        
        init() {
            let sceneManager = (__ServiceLocator.shared.sceneService as! SceneManager)
            
            if let componentClass = unsafe sceneManager.componentTypeToComponentClass(U.self) {
                self.componentClass = unsafe unsafeBitCast(componentClass, to: CoreRE.Component.ClassPtr.self)
            } else {
                U.registerComponent()
                let componentClass = unsafe sceneManager.componentTypeToComponentClass(U.self)!
                self.componentClass = unsafe unsafeBitCast(componentClass, to: CoreRE.Component.ClassPtr.self)
            }
        }
        
        func makeInternal() -> OpaquePointer? {
            assertUnimplemented()
        }
        
        func performNativeEntityQuery(for scene: MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]? {
            assertUnimplemented()
        }
        
        func evaluate(value: T) -> Bool {
            assertUnimplemented()
        }
        
        func enumerate(using enumerator: any QueryEnumerator) {
            // noop
        }
    }
}

protocol QueryEnumerator : AnyObject {
    func enumerate<T>(_ predicate: QueryPredicate<T>)
    func enumerate<T, U>(_ queryType: QueryType<T, U>)
}

struct QueryType<T, U> {
    private let block: (T) -> U
}

protocol QueryEvaluable {
    associatedtype Value
    associatedtype Result
    
    func evaluate(value: Self.Value) -> Self.Result
    func enumerate(using enumerator: QueryEnumerator)
}

protocol QueryPredicateProtocol : QueryEvaluable {
}

extension QueryPredicateProtocol {
    static var everything: QueryPredicate<Self.Value> {
        assertUnimplemented()
    }
    
    func eraseToQueryPredicate() -> QueryPredicate<Self.Value> {
        assertUnimplemented()
    }
}

protocol QueryInternalizable {
    func makeInternal() -> OpaquePointer?
    func performNativeEntityQuery(for scene: MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]?
}
