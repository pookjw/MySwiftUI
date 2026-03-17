public import MySwiftUICore
internal import AttributeGraph

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct ImmersiveContentBrightness : Equatable {
    private let value: Double?
    
    @safe public nonisolated(unsafe) static let dark = ImmersiveContentBrightness(value: 0)
    @safe public nonisolated(unsafe) static let dim = ImmersiveContentBrightness(value: 0.05)
    @safe public nonisolated(unsafe) static let bright = ImmersiveContentBrightness(value: 0.3)
    @safe public nonisolated(unsafe) static let automatic = ImmersiveContentBrightness(value: nil)
    
    @safe public nonisolated(unsafe) static func custom(_ value: Double) -> ImmersiveContentBrightness {
        var d0 = value
        var d1: CGFloat = 0
        d0 = (d0 >= 0) ? d0 : d1
        d1 = 1
        d0 = (d0 > d1) ? d1 : d0
        return ImmersiveContentBrightness(value: d0)
    }
}

@available(*, unavailable)
extension ImmersiveContentBrightness : Sendable {
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func immersiveContentBrightness(_ brightness: ImmersiveContentBrightness) -> some Scene {
        assertUnimplemented()
    }
}

struct ImmersiveContentBrightnessInput: SceneInput {
    static var defaultValue: Attribute<ImmersiveContentBrightness> {
        return Attribute(value: .automatic)
    }
}
