private import MySwiftUICore

package struct RealityLinkButtonStyle : PrimitiveButtonStyle {
    init() {}
    
    package func makeBody(configuration: PrimitiveButtonStyleConfiguration) -> some View {
        assertUnimplemented()
    }
}

extension PrimitiveButtonStyle where Self == RealityLinkButtonStyle {
    package static var realityLink: RealityLinkButtonStyle {
        assertUnimplemented()
    }
}
