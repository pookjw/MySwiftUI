public import MySwiftUICore

@available(macOS 11.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public protocol WindowStyle {
    associatedtype _Body : View
}

@available(macOS 11.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func windowStyle<S>(_ style: S) -> some Scene where S : WindowStyle {
        return transformSceneList { sceneList in
            // $s7SwiftUI5ScenePAAE11windowStyleyQrqd__AA06WindowE0Rd__lFyAA0C4ListVzcfU_TA
            for index in sceneList.items.indices {
                var proxy = _SceneItemProxy(value: sceneList.items[index].value)
                proxy.applyAttributesToConfig(VolumeConfigurationAttributes())
                sceneList.items[index].value = proxy.value
            }
        }
    }
}

@available(macOS 11.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension View {
    nonisolated public func presentedWindowStyle<S>(_ style: S) -> some View where S : WindowStyle {
        assertUnimplemented()
    }
}

@available(macOS 11.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WindowStyle where Self == DefaultWindowStyle {
    @_alwaysEmitIntoClient
    public static var automatic: DefaultWindowStyle {
        .init()
    }
}

@available(macOS 11.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct DefaultWindowStyle : WindowStyle {
    public typealias _Body = Never

    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension DefaultWindowStyle : Sendable {}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension WindowStyle where Self == VolumetricWindowStyle {
    public static var volumetric: VolumetricWindowStyle {
        return VolumetricWindowStyle()
    }
}

@available(visionOS 1.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct VolumetricWindowStyle : WindowStyle {
    public typealias _Body = Never

    public init() {
    }
}

@available(*, unavailable)
extension VolumetricWindowStyle : Sendable {}

@available(macOS 11.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension WindowStyle where Self == HiddenTitleBarWindowStyle {
    @_alwaysEmitIntoClient
    public static var hiddenTitleBar: HiddenTitleBarWindowStyle {
        .init()
    }
}

@available(macOS 11.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct HiddenTitleBarWindowStyle : WindowStyle {
    public typealias _Body = Never

    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension HiddenTitleBarWindowStyle : Sendable {}

@available(macOS 15.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension WindowStyle where Self == PlainWindowStyle {
    @_alwaysEmitIntoClient
    public static var plain: PlainWindowStyle {
        .init()
    }
}

@available(macOS 15.0, visionOS 1.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct PlainWindowStyle : WindowStyle {
    public typealias _Body = Never

    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension PlainWindowStyle : Sendable {}

@available(macOS 11.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
extension WindowStyle where Self == TitleBarWindowStyle {
    @_alwaysEmitIntoClient
    public static var titleBar: TitleBarWindowStyle {
        .init()
    }
}

@available(macOS 11.0, *)
@available(iOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
public struct TitleBarWindowStyle : WindowStyle {
    public typealias _Body = Never

    public init() {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension TitleBarWindowStyle : Sendable {}
