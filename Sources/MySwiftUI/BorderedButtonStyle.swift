public import MySwiftUICore

@available(iOS 15.0, macOS 10.15, tvOS 13.0, watchOS 7.0, *)
public struct BorderedButtonStyle : PrimitiveButtonStyle {
    public init() {
        assertUnimplemented()
    }
    
    @available(iOS, unavailable)
    @available(macOS, unavailable)
    @available(tvOS, unavailable)
    @available(watchOS, introduced: 7.0, deprecated: 100000.0, message: "Use ``View/tint(_)`` instead.")
    @available(visionOS, unavailable)
    public init(tint: Color) {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func makeBody(configuration: BorderedButtonStyle.Configuration) -> some View {
        assertUnimplemented()
    }
    
    //  @available(iOS 15.0, tvOS 13.0, watchOS 7.0, macOS 10.15, *)
    //  public typealias Body = @_opaqueReturnTypeOf("$s7SwiftUI19BorderedButtonStyleV8makeBody13configurationQrAA09PrimitivedE13ConfigurationV_tF", 0) __
}

@available(*, unavailable)
extension BorderedButtonStyle : Sendable {
}

extension BorderedButtonStyle : ButtonStyleConvertible {
    package var buttonStyleRepresentation: BorderedButtonStyle_Phone {
        assertUnimplemented()
    }
}

package struct BorderedButtonStyle_Phone : ButtonStyle {
    package func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}
