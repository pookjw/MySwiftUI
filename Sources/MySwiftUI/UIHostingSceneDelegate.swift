public import UIKit

@available(iOS 26.0, tvOS 26.0, visionOS 26.0, *)
@available(macOS, unavailable)
@available(watchOS, unavailable)
public protocol UIHostingSceneDelegate : UISceneDelegate {
    associatedtype RootScene : Scene
    @SceneBuilder static var rootScene: Self.RootScene { get }
}
