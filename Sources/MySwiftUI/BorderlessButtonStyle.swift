// 8946ABD13E6925C5D5FDD316D4A45F59)
public import MySwiftUICore

@available(iOS 13.0, macOS 10.15, tvOS 17.0, watchOS 8.0, *)
public struct BorderlessButtonStyle : PrimitiveButtonStyle {
    public init() {
        assertUnimplemented()
    }
    
    @MainActor @preconcurrency public func makeBody(configuration: BorderlessButtonStyle.Configuration) -> some View {
        assertUnimplemented()
    }
    
    //  @available(iOS 13.0, tvOS 17.0, watchOS 8.0, macOS 10.15, *)
    //  public typealias Body = @_opaqueReturnTypeOf("$s7SwiftUI21BorderlessButtonStyleV8makeBody13configurationQrAA09PrimitivedE13ConfigurationV_tF", 0) __
}

@available(*, unavailable)
extension BorderlessButtonStyle : Sendable {
}

extension BorderlessButtonStyle : ButtonStyleConvertible {
    package var buttonStyleRepresentation: some ButtonStyle {
        return BorderlessButtonStyleBase()
    }
}

fileprivate struct BorderlessButtonStyleBase : ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        assertUnimplemented()
    }
}
