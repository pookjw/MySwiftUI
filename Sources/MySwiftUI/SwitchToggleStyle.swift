private import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 18.0, watchOS 6.0, *)
public struct SwitchToggleStyle : ToggleStyle {
    public init() {
        assertUnimplemented()
    }
    
    @available(iOS, introduced: 14.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(macOS, introduced: 11.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(tvOS, unavailable)
    @available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(visionOS, introduced: 1.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    public init(tint: Color) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func makeBody(configuration: SwitchToggleStyle.Configuration) -> some View {
        assertUnimplemented()
    }
    
//    @available(iOS 13.0, tvOS 18.0, watchOS 6.0, macOS 10.15, *)
//    public typealias Body = @_opaqueReturnTypeOf("$s7SwiftUI17SwitchToggleStyleV8makeBody13configurationQrAA0dE13ConfigurationV_tF", 0) __
}

@available(*, unavailable)
extension SwitchToggleStyle : Sendable {
}
