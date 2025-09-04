#warning("TODO")
private import _MySwiftUIShims
internal import os.signpost

let _signpostLog = OSLog(subsystem: "com.apple.SwiftUI", category: "PlatformViewUpdate")

struct Signpost {
    private let style: Style
    private let level: Level
    
    @inlinable
    func traceInterval<T>(object: AnyObject?, _ message: StaticString, _ args: @autoclosure () -> [CVarArg], closure: () -> T) -> T {
        guard isEnabled else {
            return closure()
        }
        
        let signpostID: OSSignpostID
        if let object {
            signpostID = OSSignpostID(log: _signpostLog, object: object)
        } else {
            signpostID = .exclusive
        }
        
        let args = args()
        
        switch style {
        case .kdebug(let kClass, _):
            let debugid = style.debugID(.begin)
            kdebugTrace(kClass: kClass, debugid: debugid, signpostID: signpostID, type: .begin, args: args)
            let result = closure()
            kdebug_trace(style.debugID(.end), signpostID.rawValue, 0, 0, 0)
            return result
        case .os_log(let name):
            os_signpost(.begin, log: _signpostLog, name: name, signpostID: signpostID, message, args)
            let result = closure()
            os_signpost(.end, log: _signpostLog, name: name, signpostID: signpostID)
            return result
        }
    }
    
    @inlinable
    func traceEvent(type: OSSignpostType, object: AnyObject?, _ message: StaticString, args: @autoclosure () -> [CVarArg]) {
        guard isEnabled else {
            return
        }
        
        let signpostID: OSSignpostID
        if let object {
            signpostID = OSSignpostID(log: _signpostLog, object: object)
        } else {
            signpostID = .exclusive
        }
        
        let args = args()
        
        switch style {
        case .kdebug(let kClass, _):
            let debugid = style.debugID(.begin)
            kdebugTrace(kClass: kClass, debugid: debugid, signpostID: signpostID, type: .begin, args: args)
        case .os_log(let name):
            os_signpost(type, log: _signpostLog, name: name, signpostID: signpostID, message, args)
        }
    }
    
    @inlinable
    func traceEvent(type: OSSignpostType, args: @autoclosure () -> [CVarArg]) {
        fatalError("TODO")
    }
    
    var published: Signpost {
        fatalError("TODO")
    }
    
    @inlinable
    var isEnabled: Bool {
        switch level {
        case .disabled, .verbose:
            return false
        case .internal:
            return _MySwiftUIIsAppleInternalBuild()
        case .published:
            switch style {
            case .kdebug:
                return kdebug_is_enabled(style.debugID(.event))
            case .os_log(let staticString):
                guard kdebug_is_enabled(style.debugID(.event)) else {
                    return false
                }
                
                return _signpostLog.signpostsEnabled
            }
        }
    }
    
    static var render: Signpost {
        fatalError("TODO")
    }
    
    static var renderUpdate: Signpost {
        fatalError("TODO")
    }
    
    static var postUpdateActions: Signpost {
        fatalError("TODO")
    }
    
    static var renderDisplayList: Signpost {
        fatalError("TODO")
    }
    
    static var bodyInvoke: Signpost {
        fatalError("TODO")
    }
    
    static var linkCreate: Signpost {
        fatalError("TODO")
    }
    
    static var linkUpdate: Signpost {
        fatalError("TODO")
    }
    
    static var linkDestroy: Signpost {
        fatalError("TODO")
    }
    
    static var viewHost: Signpost { Signpost(style: .kdebug(164, 0), level: .published) } 
    
    static var platformView: Signpost {
        fatalError("TODO")
    }
    
    static var platformUpdate: Signpost {
        fatalError("TODO")
    }
    
    static var animationState: Signpost {
        fatalError("TODO")
    }
    
    static var eventHandling: Signpost {
        fatalError("TODO")
    }
    
    static var prefetchMakeView: Signpost {
        fatalError("TODO")
    }
    
    static var prefetchOutputs: Signpost {
        fatalError("TODO")
    }
    
    static var prefetchNotifyRender: Signpost {
        fatalError("TODO")
    }
    
    static let moduleName: String = Tracing.libraryName(defining: Signpost.self)
}

extension Signpost {
    fileprivate enum Level {
        case disabled
        case verbose
        case `internal`
        case published
    }
    
    private func kdebugTrace(kClass: UInt8, debugid: UInt32, signpostID: OSSignpostID, type: OSSignpostType, args: [CVarArg]) {
        args.withUnsafeBufferPointer { (pointer: UnsafeBufferPointer<any CVarArg>) in
            let base = pointer
                .baseAddress
                .unsafelyUnwrapped
            
            var remaining = pointer.count
            
            repeat {
                if kClass == DBG_MISC {
                    let arg2 = base
                        .advanced(by: pointer.count &- remaining)
                        .pointee
                        .kdebugValue(debugid)
                    
                    let arg3: (arg: UInt64, destroy: Bool)
                    if (pointer.count &- remaining &+ 1) < pointer.count {
                        arg3 = base
                            .advanced(by: pointer.count &- remaining &+ 1)
                            .pointee
                            .kdebugValue(debugid)
                    } else {
                        arg3 = (0, false)
                    }
                    
                    let arg4: (arg: UInt64, destroy: Bool)
                    if (pointer.count &- remaining &+ 2) < pointer.count {
                        arg4 = base
                            .advanced(by: pointer.count &- remaining &+ 2)
                            .pointee
                            .kdebugValue(debugid)
                    } else {
                        arg4 = (0, false)
                    }
                    
                    kdebug_trace(debugid, signpostID.rawValue, arg2.arg, arg3.arg, arg4.arg)
                    
                    if arg2.destroy {
                        kdebug_trace_string(debugid, arg2.arg, nil)
                    }
                    
                    if arg3.destroy {
                        kdebug_trace_string(debugid, arg3.arg, nil)
                    }
                    
                    if arg4.destroy {
                        kdebug_trace_string(debugid, arg4.arg, nil)
                    }
                    
                    remaining -= 3
                } else {
                    let arg1 = base
                        .advanced(by: pointer.count &- remaining)
                        .pointee
                        .kdebugValue(debugid)
                    
                    let arg2: (arg: UInt64, destroy: Bool)
                    if (pointer.count &- remaining &+ 1) < pointer.count {
                        arg2 = base
                            .advanced(by: pointer.count &- remaining &+ 1)
                            .pointee
                            .kdebugValue(debugid)
                    } else {
                        arg2 = (0, false)
                    }
                    
                    let arg3: (arg: UInt64, destroy: Bool)
                    if (pointer.count &- remaining &+ 2) < pointer.count {
                        arg3 = base
                            .advanced(by: pointer.count &- remaining &+ 2)
                            .pointee
                            .kdebugValue(debugid)
                    } else {
                        arg3 = (0, false)
                    }
                    
                    let arg4: (arg: UInt64, destroy: Bool)
                    if (pointer.count &- remaining &+ 3) < pointer.count {
                        arg4 = base
                            .advanced(by: pointer.count &- remaining &+ 3)
                            .pointee
                            .kdebugValue(debugid)
                    } else {
                        arg4 = (0, false)
                    }
                    
                    kdebug_trace(debugid, arg1.arg, arg2.arg, arg3.arg, arg4.arg)
                    
                    if arg1.destroy {
                        kdebug_trace_string(debugid, arg1.arg, nil)
                    }
                    
                    if arg2.destroy {
                        kdebug_trace_string(debugid, arg2.arg, nil)
                    }
                    
                    if arg3.destroy {
                        kdebug_trace_string(debugid, arg3.arg, nil)
                    }
                    
                    if arg4.destroy {
                        kdebug_trace_string(debugid, arg4.arg, nil)
                    }
                    
                    remaining -= 4
                }
            } while remaining > 0
        }
        
        kdebug_trace(debugid, signpostID.rawValue, 0, 0, 0)
    }
}

extension Signpost {
    fileprivate enum Style {
        case kdebug(UInt8, UInt16)
        case os_log(StaticString)
        
        func debugID(_ event: OSSignpostType) -> UInt32 {
            switch self {
            case .kdebug(let value1, let value2):
                let klass = UInt32(value1)
                let sub = UInt32(value2 & 0x00ff)
                let codeHi = UInt32(value2 >> 8)
                let raw = UInt32(event.rawValue)
                let codeLo = ((raw & KDBG_CODE_MASK) >> KDBG_CODE_OFFSET) & 0x3f
                let code14 = (codeHi << 6) | codeLo
                let debugid = KDBG_EVENTID(class: klass, subClass: sub, code: code14) & KDBG_EVENTID_MASK
                return debugid
            case .os_log:
                return KDBG_CLASS_ENCODE(class: DBG_MISC, subClass: DBG_MISC_INSTRUMENTS) | (UInt32(event.rawValue) & KDBG_CODE_MASK)
            }
        }
    }
}


fileprivate let KDBG_CLASS_OFFSET: UInt32 = 24
fileprivate let KDBG_SUBCLASS_OFFSET: UInt32 = 16
fileprivate let KDBG_CODE_OFFSET: UInt32 = 2
fileprivate let DBG_MISC: UInt32 = 20
fileprivate let DBG_MISC_INSTRUMENTS: UInt32 = 0x11
fileprivate let KDBG_CODE_MASK: UInt32 = 0x0000fffc
fileprivate let KDBG_EVENTID_MASK: UInt32 = 0xfffffffc

@_transparent
fileprivate func KDBG_EVENTID(class: UInt32, subClass: UInt32, code: UInt32) -> UInt32 {
    return ((`class` & 0xff) << KDBG_CLASS_OFFSET) |
    ((subClass & 0xff) << KDBG_SUBCLASS_OFFSET) |
    ((code & 0x3fff) << KDBG_CODE_OFFSET)
}

@_transparent
fileprivate func KDBG_CODE(class: UInt32, subClass: UInt32, code: UInt32) -> UInt32 {
    return KDBG_EVENTID(class: `class`, subClass: subClass, code: code)
}

@_transparent
fileprivate func KDBG_CLASS_ENCODE(class: UInt32, subClass: UInt32) -> UInt32 {
    return KDBG_EVENTID(class: `class`, subClass: subClass, code: 0)
}

@_transparent
fileprivate func MISCDBG_CODE(subClass: UInt32, code: UInt32) -> UInt32 {
    return KDBG_EVENTID(class: DBG_MISC, subClass: subClass, code: code)
}

extension CVarArg {
    fileprivate func kdebugValue(_ debueId: UInt32) -> (arg: UInt64, destroy: Bool) {
        if let string = self as? String {
            if string == Signpost.moduleName {
                return (0, false)
            } else {
                return string.withCString { pointer in
                    return (kdebug_trace_string(debueId, 0, pointer), true)
                }
            }
        } else {
            let encoding = _cVarArgEncoding
            if encoding.count == 1 {
                return (UInt64(encoding[0]), false)
            } else {
                let string = String(describing: self)
                
                if string == Signpost.moduleName {
                    return (0, false)
                } else {
                    return string.withCString { pointer in
                        return (kdebug_trace_string(debueId, 0, pointer), true)
                    }
                }
            }
        }
    }
}
