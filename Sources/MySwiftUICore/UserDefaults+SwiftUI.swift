internal import Foundation

extension UserDefaults {
    @safe static nonisolated(unsafe) let swiftUI = UserDefaults(suiteName: "com.apple.SwiftUI")
    @safe static nonisolated(unsafe) let uiKit = UserDefaults(suiteName: "com.apple.UIKit")
}
