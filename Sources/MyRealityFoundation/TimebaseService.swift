@safe final class TimebaseService {
    let timebaseServiceHandle: OpaquePointer?
    
    init(handle: OpaquePointer?) {
        unsafe self.timebaseServiceHandle = unsafe handle
    }
}
