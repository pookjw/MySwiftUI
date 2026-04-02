private import MySwiftUICore
private import os.log

@available(iOS 17.0, macOS 13.0, visionOS 1.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
public struct WindowResizability : Sendable {
    private var role: WindowResizability.Role
    
    public static var automatic: WindowResizability {
        get {
            return WindowResizability(role: .automatic)
        }
        set {
            unsafe os_log(.fault, log: OSLog.runtimeIssuesLog, "Mutation of WindowResizability is unsupported.\nThis will become an error in the future.")
        }
        _modify {
            var value = WindowResizability(role: .automatic)
            yield &value
        }
    }
    
    public static var contentSize: WindowResizability {
        get {
            return WindowResizability(role: .contentSize)
        }
        set {
            unsafe os_log(.fault, log: OSLog.runtimeIssuesLog, "Mutation of WindowResizability is unsupported.\nThis will become an error in the future.")
        }
        _modify {
            var value = WindowResizability(role: .contentSize)
            yield &value
        }
    }
    
    public static var contentMinSize: WindowResizability {
        get {
            return WindowResizability(role: .contentMinSize)
        }
        set {
            unsafe os_log(.fault, log: OSLog.runtimeIssuesLog, "Mutation of WindowResizability is unsupported.\nThis will become an error in the future.")
        }
        _modify {
            var value = WindowResizability(role: .contentMinSize)
            yield &value
        }
    }
}

@available(iOS 17.0, macOS 13.0, visionOS 1.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
extension Scene {
    nonisolated public func windowResizability(_ resizability: WindowResizability) -> some Scene {
        assertUnimplemented()
    }
}

extension WindowResizability {
    enum Role : Hashable {
        case automatic
        case contentSize
        case contentMinSize
        case full
        
        @inline(always)
        var sizingOptions: UIHostingControllerSizingOptions {
            switch self {
            case .automatic:
                return []
            case .contentSize:
                return [.unknown2, .unknown3]
            case .contentMinSize:
                return [.unknown2]
            case .full:
                return []
            }
        }
    }
}
