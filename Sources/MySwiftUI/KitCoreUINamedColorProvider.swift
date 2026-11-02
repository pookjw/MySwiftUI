internal import MySwiftUICore
internal import CoreUI
internal import CoreGraphics

struct KitCoreUINamedColorProvider : CoreUINamedColorProvider {
    static func effectiveCGColor(cuiColor: CUINamedColor, in environment: EnvironmentValues) -> CGColor? {
        assertUnimplemented()
    }
    
    // TODO
}
