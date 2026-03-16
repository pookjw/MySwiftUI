internal import Foundation
internal import MySwiftUICore

class AnyFallbackDelegateBox {
    init() {}
    
    var delegate: NSObject? {
        fatalError() // abstract
    }
    
    func addDelegate(to environmentValues: inout EnvironmentValues) {
        fatalError() // abstract
    }
}

final class FallbackDelegateBox<T>: AnyFallbackDelegateBox {
    private var storage: FallbackDelegateBox<T>.DelegateStorage
    
    init(_ value: T?) {
        assertUnimplemented()
    }
}

extension FallbackDelegateBox {
    enum DelegateStorage {
        case type(T.Type)
        case instance(T)
    }
}

final class ObservableObjectFallbackDelegateBox<T>: AnyFallbackDelegateBox {
    private var typedDelegate: T
    
    override init() {
        assertUnimplemented()
    }
}

final class ObservableFallbackDelegateBox<T>: AnyFallbackDelegateBox {
    private var typedDelegate: T
    
    override init() {
        assertUnimplemented()
    }
}

final class ObjectFallbackDelegateBox<T>: AnyFallbackDelegateBox {
    private var typedDelegate: T
    
    init(_ value: T) {
        assertUnimplemented()
    }
}

final class UnsafeObservableObjectFallbackDelegateBox<T>: AnyFallbackDelegateBox {
    private var typedDelegate: T
    
    init(_ value: T) {
        assertUnimplemented()
    }
}
