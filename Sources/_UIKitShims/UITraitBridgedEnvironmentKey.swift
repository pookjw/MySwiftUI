public import MySwiftUICore
public import UIKit

@available(iOS 17.0, tvOS 17.0, *)
@_originallyDefinedIn(module: "MySwiftUI", iOS 26.0)
@_originallyDefinedIn(module: "MySwiftUI", tvOS 26.0)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol UITraitBridgedEnvironmentKey: EnvironmentKey {
    static func read(from traitCollection: UITraitCollection) -> Self.Value
    static func write(to mutableTraits: inout any UIMutableTraits, value: Self.Value)
}
