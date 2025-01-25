import CommonCrypto

package struct StrongHasher {
    private var state: CC_SHA1state_st
    
    package init() {
        state = withUnsafeTemporaryAllocation(of: CC_SHA1_CTX.self, capacity: 1) { pointer in
            assert(CC_SHA1_Init(pointer.baseAddress) == 1)
            return pointer.baseAddress.unsafelyUnwrapped.pointee
        }
    }
    
    package mutating func combine<H>(_ value: H) where H: StronglyHashable {
        value.hash(into: &self)
    }
    
    package mutating func finialize() -> StrongHash {
        /*
         https://developer.apple.com/library/archive/documentation/System/Conceptual/ManPages_iPhoneOS/man3/CC_SHA1_Final.3cc.html
         
         CC_SHA1_Final() places the message digest in md, which must have space
              for CC_SHA1_DIGEST_LENGTH == 20 bytes of output, and erases the
              CC_SHA1_CTX.
         */
        
        return withUnsafeTemporaryAllocation(of: StrongHash.self, capacity: 1) { pointer in
            assert(MemoryLayout<StrongHash>.size == MemoryLayout<(UInt32, UInt32, UInt32, UInt32, UInt32)>.size)
            assert(CC_SHA1_Final(pointer.baseAddress, &state) == 1)
            return pointer.baseAddress.unsafelyUnwrapped.pointee
        }
    }
    
    package mutating func combineBytes(_ bytes: UnsafeRawPointer, count: Int) {
        withUnsafeMutablePointer(to: &state) { pointer in
            assert(CC_SHA1_Update(pointer, bytes, CC_LONG(count)) == 1)
        }
    }
    
    package mutating func combineBitPattern<T>(_ value: T) {
        withUnsafePointer(to: value) { pointer in
            combineBytes(pointer, count: MemoryLayout<T>.size)
        }
    }
}
