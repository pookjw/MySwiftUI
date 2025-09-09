#warning("TODO")
internal import os.log
internal import OSLog

func logChangedBodyProperties<T>(of: T.Type) {
    fatalError("TODO")
}

func log(_: [(_Benchmark, [Double])]) {
    fatalError("TODO")
}

package enum Log {
    static func externalWarning(_ message: String) {
        Log.unlocatedIssuesLog.fault("\(message)")
    }
    
    static func internalWarning(_ message: @autoclosure @escaping () -> String) {
        Log.internalWarning(message(), file: #fileID, line: #line)
    }
    
    static func internalError(_ message: @autoclosure @escaping () -> String) {
        Log.internalError(message(), file: #fileID, line: #line)
    }
    
    static func eventDebug(_ message: String) {
        Log.events.log(level: .default, "\(message)")
    }
    
    static fileprivate(set) nonisolated(unsafe) var runtimeIssuesLog = OSLog(subsystem: "com.apple.runtime-issues", category: "SwiftUI")
    
    static func log(_: @autoclosure () -> String) {
        // nop
    }
    
    static var subsystem: String {
        return "com.apple.SwiftUI"
    }
    
    static func log(_: @autoclosure () -> String, unless: @autoclosure () -> Bool, file: StaticString, line: UInt) {
        // nop
    }
    
    static func log(_: @autoclosure () -> String, unless: @autoclosure () -> Bool, file: StaticString) {
        // nop
    }
    
    static func log(_: @autoclosure () -> String, unless: @autoclosure () -> Bool) {
        // nop
    }
    
    static func internalWarning(_ message: @autoclosure @escaping () -> String, file: StaticString, line: UInt) {
        print("\(message()) - \(file):\(line) - please file a bug report.")
    }
    
    static func internalError(_ message: @autoclosure @escaping () -> String, file: StaticString, line: UInt) {
        os_log(.fault, log: Log.internalErrorsLog, "%s - %s:%s", message(), file.description, line.description)
        print("\(message()) - \(file):\(line) - please file a bug report.")
    }
    
    static nonisolated(unsafe) var propertyChangeLog = Logger(subsystem: Log.subsystem, category: "Changed Body Properties")
    static nonisolated(unsafe) var unlocatedIssuesLog = Logger(subsystem: Log.subsystem, category: "Invalid Configuration")
    static nonisolated(unsafe) var internalErrorsLog = OSLog(subsystem: Log.subsystem, category: "SwiftUI")
    static nonisolated(unsafe) var eventDebuggingLog = OSLog(subsystem: "com.apple.diagnostics.events", category: "SwiftUI")
    static nonisolated(unsafe) var archiving = Logger(subsystem: Log.subsystem, category: "Archiving")
    
    static var archivedToggle: Logger {
        fatalError("TODO")
    }
    
    static var archivedButton: Logger {
        fatalError("TODO")
    }
    
    static var archivedPlaybackButton: Logger {
        fatalError("TODO")
    }
    
    static var events: Logger {
        fatalError("TODO")
    }
    
    static var metadataExtraction: Logger {
        fatalError("TODO")
    }
    
    static var unitTests: Logger {
        fatalError("TODO")
    }
    
    static var timelineScheduleSequences: Logger {
        fatalError("TODO")
    }
    
    static var scenes: Logger? {
        fatalError("TODO")
    }
    
    static var immersiveSpace: Logger {
        fatalError("TODO")
    }
}

extension Log {
    static var navigation: Logger? {
        fatalError("TODO")
    }
    
    static var listSelection: Logger? {
        fatalError("TODO")
    }
    
    static var listDiffing: Logger? {
        fatalError("TODO")
    }
    
    static var listPerf: Logger? {
        fatalError("TODO")
    }
    
    static var listMisc: Logger? {
        fatalError("TODO")
    }
    
    static var table: Logger? {
        fatalError("TODO")
    }
    
    static var presentation: Logger? {
        fatalError("TODO")
    }
    
    static var tabView: Logger? {
        fatalError("TODO")
    }
    
    static var urlHandling: Logger? {
        fatalError("TODO")
    }
    
    static var splitViewVisibility: Logger? {
        fatalError("TODO")
    }
    
    static var dragAndDrop: Logger? {
        fatalError("TODO")
    }
    
    static var documents: Logger? {
        fatalError("TODO")
    }
    
    static var resize: Logger? {
        fatalError("TODO")
    }
    
    static var attachments: Logger? {
        fatalError("TODO")
    }
    
    static var toolbar: Logger? {
        fatalError("TODO")
    }
    
    static var lazyStack: Logger? {
        fatalError("TODO")
    }
    
    static var lazyLayoutReuse: Logger? {
        fatalError("TODO")
    }
    
    static var lazyLayoutPrefetch: Logger? {
        fatalError("TODO")
    }
    
    static var graphReuse: Logger? {
        fatalError("TODO")
    }
    
    static var scroll: Logger? {
        fatalError("TODO")
    }
    
    static var printing: Logger? {
        fatalError("TODO")
    }
    
    static var remoteScenes: Logger? {
        fatalError("TODO")
    }
    
    static var textEditor: Logger? {
        fatalError("TODO")
    }
    
    static var textField: Logger? {
        fatalError("TODO")
    }
    
    static var openScene: Logger? {
        fatalError("TODO")
    }
}

extension OSLog {
    static nonisolated(unsafe) var runtimeIssuesLog: OSLog {
        get {
            return Log.runtimeIssuesLog
        }
        set {
            Log.runtimeIssuesLog = newValue
        }
    }
}
