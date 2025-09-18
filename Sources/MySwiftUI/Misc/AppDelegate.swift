#warning("TODO")
internal import UIKit

// TODO: final인지 검증
class AppDelegate: UIResponder {
    static nonisolated(unsafe) var shared: AppDelegate?
    
    private(set) final var mainMenuController: UIKitMainMenuController?
}
