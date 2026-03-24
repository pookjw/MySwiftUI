// F00DE100DEB1EA63E29A46C946A53E51
private import _MySwiftUIShims
private import _SwiftPrivate

package enum ViewStyleRegistry: Sendable {
    package static func registerOverrides(_ overrides: ViewStyleOverrides, for idiom: ViewStyleRegistry.InterfaceIdiom) {
        if let existing = unsafe registries[idiom.idiom] {
            existing.merge(with: overrides)
            unsafe registries[idiom.idiom]
        } else {
            unsafe registries[idiom.idiom] = overrides
        }
    }
    
    package static func overrides(for idiom: ViewStyleRegistry.InterfaceIdiom) -> ViewStyleOverrides {
        return unsafe registries[idiom.idiom] ?? fallbackOverrides
    }
    
    static nonisolated(unsafe) var registries: [AnyInterfaceIdiom: ViewStyleOverrides] = [:]
    static nonisolated(unsafe) var fallbackOverrides = ViewStyleOverrides()
}

extension ViewStyleRegistry {
    package struct InterfaceIdiom: Sendable {
        package let idiom: AnyInterfaceIdiom
        
        package init(idiom: AnyInterfaceIdiom) {
            self.idiom = idiom
        }
        
        package static let carPlay = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .carPlay))
        package static let clarityUI = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .clarityUI))
        package static let complication = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .complication))
        package static let mac = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .mac))
        package static let macCatalyst = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .macCatalyst))
        package static let phone = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .phone))
        package static let pad = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .pad))
        package static let tv = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .tv))
        package static let touchBar = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .touchBar))
        package static let watch = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .watch))
        @safe package static nonisolated(unsafe) var vision = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .vision))
        @safe package static nonisolated(unsafe) var reality = ViewStyleRegistry.InterfaceIdiom(idiom: AnyInterfaceIdiom(idiom: .vision))
    }
}

package struct ViewStyleOverrides: Sendable {
    package var registeredStyles: [ObjectIdentifier: Any.Type] = [:]
    package var registeredStyleOverrides: [ObjectIdentifier: Any.Type] = [:]
    package var registeredStyleWriterOverrides: [ObjectIdentifier: Any.Type] = [:]
    
    package init() {}
    
    func registerStyleOverride<T, U: StyleModifier>(_: U.Type, style: T.Type) where U.Style: AnyDefaultStyle {
        assertUnimplemented()
    }
    
    package func register(in inputs: inout _ViewInputs) {
        let defaultStyleModifierProtocolDescriptor = unsafe _defaultStyleModifierProtocolDescriptor()
        registeredStyles
            .forEach { key, value in
                guard unsafe swift_conformsToProtocol(value, defaultStyleModifierProtocolDescriptor) != nil else {
                    return
                }
                
                unsafe unsafeBitCast(value, to: (any DefaultStyleModifier.Type).self).registerDefaultStyle(in: &inputs)
            }
        
        let styleOverrideModifierProtocolDescriptor = unsafe _styleOverrideModifierProtocolDescriptor()
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
        assertUnimplemented()
    }
    
    func registerStyleOverride(_: Any.Type?, in: inout _ViewInputs) {
        assertUnimplemented()
    }
    
    func registerStyleWriterOverride(_: Any.Type?, in: inout _ViewInputs) {
        assertUnimplemented()
    }
    
    fileprivate func merge(with: ViewStyleOverrides) {
        assertUnimplemented()
    }
    
    package mutating func registerStyleOverride<T, U: StyleModifier>(_: T.Type, style: U.Type) where U.Style: AnyDefaultStyle {
        registeredStyleOverrides[ObjectIdentifier(U.self)] = T.self
    }
}

package protocol AnyDefaultStyle {
    init()
}

protocol DefaultStyleModifier: StyleModifier, AnyDefaultStyle {
    associatedtype Style : AnyDefaultStyle
}

extension DefaultStyleModifier {
    static nonisolated func registerDefaultStyle(in: inout _ViewInputs) {
        assertUnimplemented()
    }
}

protocol StyleOverrideModifier: DefaultStyleModifier {
    static nonisolated func injectStyleOverride(in: inout _ViewInputs)
}

extension StyleOverrideModifier {
    static nonisolated func injectStyleOverride(in: inout _ViewInputs) {
        assertUnimplemented()
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
        assertUnimplemented()
    }
}

protocol DefaultStyleModifierTypeVisitor {
    // TODO
}

fileprivate struct RegisterDefaultStyleVisitor {
    // TODO
}
