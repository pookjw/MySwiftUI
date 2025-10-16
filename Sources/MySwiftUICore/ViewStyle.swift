// F00DE100DEB1EA63E29A46C946A53E51
#warning("TODO")

package enum ViewStyleRegistry {
    package static func registerOverrides(_: ViewStyleOverrides, for: ViewStyleRegistry.InterfaceIdiom) {
        fatalError("TODO")
    }
    
    package static func overrides(for idiom: ViewStyleRegistry.InterfaceIdiom) -> ViewStyleOverrides {
        return registries[idiom.idiom] ?? fallbackOverrides
    }
    
    static nonisolated(unsafe) var registries: [AnyInterfaceIdiom: ViewStyleOverrides] = [:]
    static nonisolated(unsafe) var fallbackOverrides = ViewStyleOverrides()
}

extension ViewStyleRegistry {
    package struct InterfaceIdiom {
        package let idiom: AnyInterfaceIdiom
        
        package init(idiom: AnyInterfaceIdiom) {
            self.idiom = idiom
        }
        
        package static nonisolated(unsafe) let carPlay = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .carPlay))
        package static nonisolated(unsafe) let clarityUI = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .clarityUI))
        package static nonisolated(unsafe) let complication = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .complication))
        package static nonisolated(unsafe) let mac = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .mac))
        package static nonisolated(unsafe) let macCatalyst = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .macCatalyst))
        package static nonisolated(unsafe) let phone = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .phone))
        package static nonisolated(unsafe) let pad = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .pad))
        package static nonisolated(unsafe) let tv = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .tv))
        package static nonisolated(unsafe) let touchBar = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .touchBar))
        package static nonisolated(unsafe) let watch = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .watch))
        package static nonisolated(unsafe) var vision = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .vision))
        package static nonisolated(unsafe) var reality = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .vision))
    }
}

package struct ViewStyleOverrides {
    private var registeredStyles: [ObjectIdentifier: Any.Type] = [:]
    private var registeredStyleOverrides: [ObjectIdentifier: Any.Type] = [:]
    private var registeredStyleWriterOverrides: [ObjectIdentifier: Any.Type] = [:]
    
    init() {}
    
    func registerStyleOverride<T, U: StyleModifier>(_: U.Type, style: T.Type) where U.Style: AnyDefaultStyle {
        fatalError("TODO")
    }
    
    package func register(in inputs: inout _ViewInputs) {
        // 뭔가를 forEach해서 static SwiftUI.DefaultStyleModifier.registerDefaultStyle(in: inout SwiftUI._ViewInputs) 호출하는 것 같음
        fatalError("TODO")
    }
    
    func registerDefaultStyle(_: Any.Type?, in: inout _ViewInputs) {
        fatalError("TODO")
    }
    
    func registerStyleOverride(_: Any.Type?, in: inout _ViewInputs) {
        fatalError("TODO")
    }
    
    func registerStyleWriterOverride(_: Any.Type?, in: inout _ViewInputs) {
        fatalError("TODO")
    }
    
    fileprivate func merge(with: ViewStyleOverrides) {
        fatalError("TODO")
    }
}

protocol StyleModifier: MultiViewModifier, PrimitiveViewModifier, View {
    associatedtype Style
    associatedtype StyleConfiguration
    associatedtype StyleBody
}

protocol AnyDefaultStyle {
    // TODO
}
