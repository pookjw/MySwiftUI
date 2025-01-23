import CommonCrypto

package struct StrongHasher {
    private var state: CC_SHA1state_st
    
    package init() {
        var context = CC_SHA1_CTX()
        assert(CC_SHA1_Init(&context) == 0)
        state = context
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
        
        // 이거 아닌 것 같음
        withUnsafeTemporaryAllocation(of: UInt8.self, capacity: 20) { pointer in
            assert(CC_SHA1_Final(pointer.baseAddress, &state) == 0)
            
            // TODO
        }
        
        return .init()
    }
}
