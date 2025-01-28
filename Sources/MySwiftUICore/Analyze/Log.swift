import OSLog

package struct Log {
    package static let propertyChangeLog = Logger(subsystem: "com.apple.SwiftUI", category: "com.apple.SwiftUI.ScrollLogging")
    package static var archiving: Logger { propertyChangeLog }
}
