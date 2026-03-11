private import _DarwinFoundation3._stdlib

package enum ProcessEnvironment {
    package static func bool(forKey key: String, defaultValue: Bool = false) -> Bool {
        return key.utf8CString.withUnsafeBufferPointer { pointer in
            guard let value = unsafe getenv(pointer.baseAddress) else {
                return defaultValue
            }
            
            return (unsafe atoi(value) != 0)
        }
    }
}
