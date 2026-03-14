internal import os.log

extension OSLog {
    @safe static nonisolated(unsafe) let stopwatchSupport = OSLog(subsystem: "com.apple.StopwatchSupport", category: "StopwatchSupport")
}
