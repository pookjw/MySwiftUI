private import _DarwinFoundation2
private import _DarwinFoundation3
private import Darwin.sys.sysctl
private import os.log

@safe nonisolated(unsafe) let isDebuggerAttached: Bool = {
    // $s7SwiftUI18isDebuggerAttachedSbvpfiSbyXEfU_
    // sp + 0x10
    var info = kinfo_proc()
    var names: [Int32] = [
        CTL_KERN,
        KERN_PROC,
        KERN_PROC_PID,
        getpid()
    ]
    var size = MemoryLayout.size(ofValue: info)
    let result = sysctl(&names, 4, &info, &size, nil, 0)
    
    guard result == 0 else {
        os_log(.default, "sysctl(3) failed: %{errno}d", errno)
        return false
    }
    
    return (info.kp_proc.p_flag & P_TRACED) != 0
}()
