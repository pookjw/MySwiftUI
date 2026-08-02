private import Foundation

@safe final class NamedFileAssetResolver {
    private var assets: [String : URL] = [:] // 0x10
    private let assetsLock = NSLock() // 0x18
    private(set) var callback: @convention(c) (UnsafePointer<Int8>, UnsafePointer<Int8>, UnsafeMutableRawPointer?) -> UnsafePointer<Int8>? = { _, _, _ in
        // $s17RealityFoundation22NamedFileAssetResolverC8callbackySPys4Int8VGSgAG_AGSvSgtXCvpfiAhG_AgItcfU_To
        assertUnimplemented()
    } // 0x20
    
    init() {
    }
}
