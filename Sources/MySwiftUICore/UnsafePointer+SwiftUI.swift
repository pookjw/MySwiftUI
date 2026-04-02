extension UnsafePointer {
    static var null: UnsafePointer<Pointee> {
        return unsafe UnsafePointer(
            bitPattern: (Int(bitPattern: .max) - Int(UInt8.max)) | -Int(UInt8(clamping: MemoryLayout<Pointee>.alignment))
        ).unsafelyUnwrapped
    }
    
    subscript() -> Pointee {
        unsafeAddress {
            return unsafe self
        }
    }
}

extension UnsafeMutablePointer {
    static var null: UnsafeMutablePointer<Pointee> {
        return unsafe UnsafeMutablePointer(
            bitPattern: (Int(bitPattern: .max) - Int(UInt8.max)) | -Int(UInt8(clamping: MemoryLayout<Pointee>.alignment))
        ).unsafelyUnwrapped
    }
    
    package subscript() -> Pointee {
        unsafeAddress {
            return unsafe UnsafePointer(self)
        }
        nonmutating unsafeMutableAddress {
            return unsafe self
        }
    }
}
