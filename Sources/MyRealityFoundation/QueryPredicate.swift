private import CoreRE

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@safe public struct QueryPredicate<Value> : Sendable {
    private let evaluateBlock: @MainActor (Value) -> Bool // 0x0
    let makeInternalBlock: @MainActor () -> OpaquePointer? // 0x10
    let enumerateBlock: @MainActor (QueryEnumerator) -> () // 0x20
    private let performNativeEntityQueryBlock: (@MainActor (MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]?)? // 0x30
    
    @MainActor func enumerate(using enumerator: QueryEnumerator) {
        self.enumerateBlock(enumerator)
    }
    
    @MainActor func performNativeEntityQuery(for scene: MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]? {
        guard let performNativeEntityQueryBlock else {
            return nil
        }
        
        return performNativeEntityQueryBlock(scene)
    }
    
    @MainActor func evaluate(value: Value) -> Bool {
        return self.evaluateBlock(value)
    }
    
    @MainActor init<T : QueryPredicateProtocol>(_ predicate: T) where Value == T.Value {
        self.evaluateBlock = { value in
            // $s17RealityFoundation14QueryPredicateVyACyxGqd__c5ValueQyd__RszAA0cD8ProtocolRd__lufcSbxcqd__cfu_Sbxcfu0_TA
            return predicate.evaluate(value: value)
        }
        
        self.enumerateBlock = { enumerator in
            // $s17RealityFoundation14QueryPredicateVyACyxGqd__c5ValueQyd__RszAA0cD8ProtocolRd__lufcyAA0C10Enumerator_pcqd__cfu1_yAaH_pcfu2_TA
            predicate.enumerate(using: enumerator)
        }
        
        if let casted = predicate as? QueryInternalizable {
            // <+192>
            self.makeInternalBlock = {
                // $s17RealityFoundation14QueryPredicateVyACyxGqd__c5ValueQyd__RszAA0cD8ProtocolRd__lufcs13OpaquePointerVSgycAA0C14Internalizable_pcfu3_AJycfu4_TA
                return unsafe casted.makeInternal()
            }
            
            self.performNativeEntityQueryBlock = { scene in
                // $s17RealityFoundation14QueryPredicateVyACyxGqd__c5ValueQyd__RszAA0cD8ProtocolRd__lufcSay0A3Kit6EntityCGSgAH5SceneCcAA0C14Internalizable_pcfu5_AlNcfu6_TA
                return casted.performNativeEntityQuery(for: scene)
            }
        } else {
            // <+336>
            self.makeInternalBlock = unsafe unsafeBitCast(
                makeCustomPredicate(predicate: predicate),
                to: (@MainActor () -> OpaquePointer?).self
            )
            
            self.performNativeEntityQueryBlock = nil
        }
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
            return unsafe unsafeBitCast(CoreRE::Predicate.hasEntity, to: OpaquePointer.self)
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
    @MainActor @preconcurrency func enumerate<T>(_ predicate: QueryPredicate<T>)
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

protocol QueryPredicateProtocol : QueryEvaluable where Result == Bool {
}

extension QueryPredicateProtocol {
    static var everything: QueryPredicate<Self.Value> {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency func eraseToQueryPredicate() -> QueryPredicate<Self.Value> {
        return QueryPredicate<Self.Value>(self)
    }
}

protocol QueryInternalizable {
    func makeInternal() -> OpaquePointer?
    func performNativeEntityQuery(for scene: MyRealityFoundation::Scene) -> [MyRealityFoundation::Entity]?
}

func makeCustomPredicate<T : QueryPredicateProtocol>(predicate: T) -> (() -> OpaquePointer?) {
    assertUnimplemented()
}
