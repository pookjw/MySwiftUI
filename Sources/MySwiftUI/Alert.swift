public import MySwiftUICore
internal import CoreGraphics
public import Foundation

public struct Alert {
    // TODO
}

extension Alert {
    struct Presentation : AlertControllerConvertible {
        let alert: Alert
        let onDismiss: (() -> Void)?
        let viewID: ViewIdentity
        let itemID: AnyHashable?
        let sourceRect: CGRect
    }
}

extension Alert.Presentation {
    struct Key : HostPreferenceKey {
        typealias Value = Never? // TODO
        
        static func reduce(value: inout Never?, nextValue: () -> Never?) {
            assertUnimplemented()
        }
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension View {
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    nonisolated public func alert<Item>(item: Binding<Item?>, content: (Item) -> Alert) -> some View where Item : Identifiable {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 13.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(macOS, introduced: 10.15, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(tvOS, introduced: 13.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(watchOS, introduced: 6.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "use `alert(title:isPresented:presenting::actions:) instead.")
    nonisolated public func alert(isPresented: Binding<Bool>, content: () -> Alert) -> some View {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    nonisolated public func alert<A>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where A : View {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public func alert<A>(_ titleResource: LocalizedStringResource, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where A : View {
        alert(Text(titleResource), isPresented: isPresented, actions: actions)
    }
    
    @_disfavoredOverload nonisolated public func alert<S, A>(_ title: S, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where S : StringProtocol, A : View {
        assertUnimplemented()
    }
    
    nonisolated public func alert<A>(_ title: Text, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A) -> some View where A : View {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    nonisolated public func alert<A, M>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public func alert<A, M>(_ titleResource: LocalizedStringResource, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View {
        alert(
            Text(titleResource), isPresented: isPresented, actions: actions,
            message: message)
    }
    
    @_disfavoredOverload nonisolated public func alert<S, A, M>(_ title: S, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where S : StringProtocol, A : View, M : View {
        assertUnimplemented()
    }
    
    nonisolated public func alert<A, M>(_ title: Text, isPresented: Binding<Bool>, @ViewBuilder actions: () -> A, @ViewBuilder message: () -> M) -> some View where A : View, M : View {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    nonisolated public func alert<A, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public func alert<A, T>(_ titleResource: LocalizedStringResource, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View {
        alert(
            Text(titleResource), isPresented: isPresented, presenting: data,
            actions: actions)
    }
    
    @_disfavoredOverload nonisolated public func alert<S, A, T>(_ title: S, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where S : StringProtocol, A : View {
        assertUnimplemented()
    }
    
    nonisolated public func alert<A, T>(_ title: Text, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A) -> some View where A : View {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    nonisolated public func alert<A, M, T>(_ titleKey: LocalizedStringKey, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload @_alwaysEmitIntoClient nonisolated public func alert<A, M, T>(_ titleResource: LocalizedStringResource, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View {
        alert(
            Text(titleResource), isPresented: isPresented, presenting: data,
            actions: actions, message: message)
    }
    
    @_disfavoredOverload nonisolated public func alert<S, A, M, T>(_ title: S, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where S : StringProtocol, A : View, M : View {
        assertUnimplemented()
    }
    
    nonisolated public func alert<A, M, T>(_ title: Text, isPresented: Binding<Bool>, presenting data: T?, @ViewBuilder actions: (T) -> A, @ViewBuilder message: (T) -> M) -> some View where A : View, M : View {
        assertUnimplemented()
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
extension View {
    nonisolated public func alert<E, A>(isPresented: Binding<Bool>, error: E?, @ViewBuilder actions: () -> A) -> some View where E : LocalizedError, A : View {
        assertUnimplemented()
    }
    
    nonisolated public func alert<E, A, M>(isPresented: Binding<Bool>, error: E?, @ViewBuilder actions: (E) -> A, @ViewBuilder message: (E) -> M) -> some View where E : LocalizedError, A : View, M : View {
        assertUnimplemented()
    }
}
