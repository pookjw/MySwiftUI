// AD93C9ABB9E9FED36CB57677678034F4
internal import MySwiftUICore
internal import UIKit
internal import CoreGraphics

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowProxy {
    public private(set) var id: String?
    unowned var backingScene: UIWindowScene

    public var phase: ScenePhase {
        assertUnimplemented()
    }
    
    var size: CGSize {
        assertUnimplemented()
    }
    
    var depth: CGFloat {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension WindowProxy: Sendable {}

extension WindowProxy: Hashable {}

extension EnvironmentValues {
    @inline(always)
    var activeWindows: [WindowProxy] {
        get {
            return self[EnvironmentValues.ActiveWindowsKey.self]
        }
        set {
            self[EnvironmentValues.ActiveWindowsKey.self] = newValue
        }
    }
    
    fileprivate struct ActiveWindowsKey: EnvironmentKey {
        @safe static nonisolated(unsafe) let defaultValue: [WindowProxy] = []
    }
}
