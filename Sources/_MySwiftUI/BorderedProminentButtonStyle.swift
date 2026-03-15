public import MySwiftUICore

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
public struct BorderedProminentButtonStyle : PrimitiveButtonStyle {
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func makeBody(configuration: BorderedProminentButtonStyle.Configuration) -> some View {
        assertUnimplemented()
    }
    
    //  @available(iOS 15.0, tvOS 15.0, watchOS 8.0, macOS 12.0, *)
    //  public typealias Body = @_opaqueReturnTypeOf("$s7SwiftUI28BorderedProminentButtonStyleV8makeBody13configurationQrAA09PrimitiveeF13ConfigurationV_tF", 0) __
}

@available(*, unavailable)
extension BorderedProminentButtonStyle : Sendable {
}
