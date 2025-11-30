#warning("TODO")
package import os.log
private import Foundation
package import CoreGraphics

package func changedBodyProperties<T>(of type: T.Type) -> [String] {
    fatalError("TODO")
}

package func logChangedBodyProperties<T>(of type: T.Type) {
    let todo = changedBodyProperties(of: type)
    fatalError("TODO")
}

package func log(_: [(_Benchmark, [Double])]) {
    fatalError("TODO")
}

package enum Log {
    package static func externalWarning(_ message: String) {
        unsafe Log.unlocatedIssuesLog.fault("\(message)")
    }
    
    package static func internalWarning(_ message: @autoclosure @escaping () -> String) {
        Log.internalWarning(message(), file: #fileID, line: #line)
    }
    
    package static func internalError(_ message: @autoclosure @escaping () -> String) {
        Log.internalError(message(), file: #fileID, line: #line)
    }
    
    package static func eventDebug(_ message: String) {
        Log.events.log(level: .default, "\(message)")
    }
    
    package static fileprivate(set) nonisolated(unsafe) var runtimeIssuesLog = OSLog(subsystem: "com.apple.runtime-issues", category: "SwiftUI")
    
    package static func log(_: @autoclosure () -> String) {
        // nop
    }
    
    package static var subsystem: String {
        return "com.apple.SwiftUI"
    }
    
    package static func log(_: @autoclosure () -> String, unless: @autoclosure () -> Bool, file: StaticString, line: UInt) {
        // nop
    }
    
    package static func log(_: @autoclosure () -> String, unless: @autoclosure () -> Bool, file: StaticString) {
        // nop
    }
    
    package static func log(_: @autoclosure () -> String, unless: @autoclosure () -> Bool) {
        // nop
    }
    
    package static func internalWarning(_ message: @autoclosure @escaping () -> String, file: StaticString, line: UInt) {
        print("\(message()) - \(file):\(line) - please file a bug report.")
    }
    
    package static func internalError(_ message: @autoclosure @escaping () -> String, file: StaticString, line: UInt) {
        unsafe os_log(.fault, log: Log.internalErrorsLog, "%s - %s:%s", message(), file.description, line.description)
        print("\(message()) - \(file):\(line) - please file a bug report.")
    }
    
    package static nonisolated(unsafe) var propertyChangeLog = Logger(subsystem: Log.subsystem, category: "Changed Body Properties")
    package static nonisolated(unsafe) var unlocatedIssuesLog = Logger(subsystem: Log.subsystem, category: "Invalid Configuration")
    package static nonisolated(unsafe) var internalErrorsLog = OSLog(subsystem: Log.subsystem, category: "SwiftUI")
    package static nonisolated(unsafe) var eventDebuggingLog = OSLog(subsystem: "com.apple.diagnostics.events", category: "SwiftUI")
    package static nonisolated(unsafe) var archiving = Logger(subsystem: Log.subsystem, category: "Archiving")
    package static let archivedToggle = Logger(subsystem: Log.subsystem, category: "ArchivedToggle")
    package static let archivedButton = Logger(subsystem: Log.subsystem, category: "ArchivedButton")
    package static let archivedPlaybackButton = Logger(subsystem: Log.subsystem, category: "ArchivedPlaybackButton")
    package static let events = Logger(subsystem: Log.subsystem, category: "Events")
    package static let metadataExtraction = Logger(subsystem: Log.subsystem, category: "MetadataExtraction")
    package static let unitTests = Logger(subsystem: Log.subsystem, category: "UnitTests")
    package static let timelineScheduleSequences = Logger(subsystem: Log.subsystem, category: "TimelineSchedule Sequences")
    package static let scenes: Logger? = {
        let key = "com.apple.SwiftUI.EnableSceneLogging"
        let flag: Bool
        if UserDefaults.standard.object(forKey: key) != nil {
            flag = UserDefaults.standard.bool(forKey: key)
        } else {
            flag = true
        }
        
        if flag {
            return Logger(subsystem: Log.subsystem, category: "Scenes")
        } else {
            return nil
        }
    }()
    package static let immersiveSpace = Logger(subsystem: Log.subsystem, category: "ImmersiveSpace")
}

extension Log {
    package static let focus: Logger? = {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableFocusLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Focus")
    }()
    
    package static var navigation: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableNavigationLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Navigation")
    }
    
    package static var listSelection: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableListSelectionLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "ListSelection")
    }
    
    package static var listDiffing: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableListDiffingLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "listDiffing")
    }
    
    package static var listPerf: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableListPerfLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "listPerf")
    }
    
    package static var listMisc: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableListMiscLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "listMisc")
    }
    
    package static var table: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableTableLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "table")
    }
    
    package static var presentation: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnablePresentationLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Presentation")
    }
    
    package static var tabView: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableTabViewLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "TabView")
    }
    
    package static var urlHandling: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableURLHandlingLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "URLHandling")
    }
    
    package static var splitViewVisibility: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableSplitViewVisibilityLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "SplitViewVisibility")
    }
    
    package static var dragAndDrop: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableDragAndDropLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "DragAndDrop")
    }
    
    package static var documents: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableDocumentsLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "DocumentBasedApps")
    }
    
    package static var resize: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableResizeLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Resize")
    }
    
    package static var attachments: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableAttachmentLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Attachments")
    }
    
    package static var toolbar: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.EnableToolbarLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Toolbar")
    }
    
    package static var lazyStack: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.LazyStackLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "LazyStack")
    }
    
    package static var lazyLayoutReuse: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.LazyLayoutReuseLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "LazyLayoutReuse")
    }
    
    package static var lazyLayoutPrefetch: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.LazyLayoutPrefetchLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "LazyLayoutPrefetch")
    }
    
    package static var graphReuse: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.GraphReuseLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "GraphReuse")
    }
    
    package static var scroll: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.ScrollLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Scroll")
    }
    
    package static var printing: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.PrintingLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "Printing")
    }
    
    package static var remoteScenes: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.RemoteScenesLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "RemoteScenes")
    }
    
    package static var textEditor: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.TextEditorLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "TextEditor")
    }
    
    package static var textField: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.TextFieldLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "TextField")
    }
    
    package static var openScene: Logger? {
        guard UserDefaults.standard.bool(forKey: "com.apple.SwiftUI.OpenSceneLogging") else {
            return nil
        }
        return Logger(subsystem: Log.subsystem, category: "OpenScene")
    }
}

extension OSLog {
    package static nonisolated(unsafe) var runtimeIssuesLog: OSLog {
        get {
            return unsafe Log.runtimeIssuesLog
        }
        set {
            unsafe Log.runtimeIssuesLog = newValue
        }
    }
}

package struct LoggableRect: CustomStringConvertible {
    private var rect: CGRect
    
    package init(_ rect: CGRect) {
        self.rect = rect
    }
    
    package var description: String {
        fatalError("TODO")
    }
}

extension CGRect {
    package var loggable: LoggableRect {
        return LoggableRect(self)
    }
}
