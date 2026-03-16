public import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public struct PlainButtonStyle : PrimitiveButtonStyle {
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func makeBody(configuration: PlainButtonStyle.Configuration) -> some View {
        assertUnimplemented()
    }
  
//  @available(iOS 13.0, tvOS 13.0, watchOS 6.0, macOS 10.15, *)
//  public typealias Body = @_opaqueReturnTypeOf("$s7SwiftUI16PlainButtonStyleV8makeBody13configurationQrAA09PrimitivedE13ConfigurationV_tF", 0) __
}

@available(*, unavailable)
extension PlainButtonStyle : Sendable {
}
