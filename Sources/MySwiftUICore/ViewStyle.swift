// F00DE100DEB1EA63E29A46C946A53E51
#warning("TODO")
private import _MySwiftUIShims

package enum ViewStyleRegistry {
    package static func registerOverrides(_: ViewStyleOverrides, for: ViewStyleRegistry.InterfaceIdiom) {
        fatalError("TODO")
    }
    
    package static func overrides(for idiom: ViewStyleRegistry.InterfaceIdiom) -> ViewStyleOverrides {
        return unsafe registries[idiom.idiom] ?? fallbackOverrides
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
        print("TODO: SWSApplyVisualStyles에서 registerDefaultButtonBehaviorStyleType 같은 걸로 미리 Style 넣어줘야함")
        
        let defaultStyleModifierProtocolDescriptor = _defaultStyleModifierProtocolDescriptor()
        registeredStyles
            .forEach { key, value in
                guard unsafe swift_conformsToProtocol(value, defaultStyleModifierProtocolDescriptor) != nil else {
                    return
                }
                
                unsafe unsafeBitCast(value, to: (any DefaultStyleModifier.Type).self).registerDefaultStyle(in: &inputs)
            }
        
        let styleOverrideModifierProtocolDescriptor = _styleOverrideModifierProtocolDescriptor()
        registeredStyleOverrides
            .forEach { key, value in
                guard unsafe swift_conformsToProtocol(value, styleOverrideModifierProtocolDescriptor) != nil else {
                    return
                }
                
                unsafe unsafeBitCast(value, to: (any StyleOverrideModifier.Type).self).injectStyleOverride(in: &inputs)
            }
        
        registeredStyleWriterOverrides
            .forEach { key, value in
                guard unsafe swift_conformsToProtocol(value, _styleWriterOverrideModifierProtocolDescriptor()) != nil else {
                    return
                }
                
                unsafe unsafeBitCast(value, to: (any StyleWriterOverrideModifier.Type).self).injectStyleOverride(in: &inputs)
            }
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

protocol DefaultStyleModifier: StyleModifier, AnyDefaultStyle {
    // TODO
}

extension DefaultStyleModifier {
    static nonisolated func registerDefaultStyle(in: inout _ViewInputs) {
        fatalError("TODO")
    }
}

protocol StyleOverrideModifier: DefaultStyleModifier {
    static nonisolated func injectStyleOverride(in: inout _ViewInputs)
}

extension StyleOverrideModifier {
    static nonisolated func injectStyleOverride(in: inout _ViewInputs) {
        fatalError("TODO")
    }
}

protocol StyleWriterOverrideModifier: AnyDefaultStyle {
    associatedtype OriginalStyle
    associatedtype StyleOverride
    
    static func injectStyleOverride(in: inout _ViewInputs)
    // TODO
}

extension StyleWriterOverrideModifier {
    static nonisolated func injectStyleOverride<T: ViewInputPredicate>(in: inout _ViewInputs, requiring: T.Type) {
        fatalError("TODO")
    }
}
