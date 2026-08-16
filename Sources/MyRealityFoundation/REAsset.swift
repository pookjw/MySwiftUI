@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public class __REAsset : CustomDebugStringConvertible {
    let handle: OpaquePointer
    
    public static func __fromHandle(_ assetRef: __AssetRef) -> __REAsset {
        assertUnimplemented()
    }
    
    public static func __fromHandleTransfer(_ assetRef: __AssetRef) -> __REAsset {
        assertUnimplemented()
    }
    
    @inline(__always) // 원래 없음
    init(handle: OpaquePointer) {
        unsafe self.handle = handle
    }
    
    deinit {
        unsafe __RERelease(self.handle)
    }
    
    public var debugDescription: String {
        get {
            assertUnimplemented()
        }
    }
    
    public var sanitizedDescription: String {
        get {
            assertUnimplemented()
        }
    }
    
    public var __handle: __AssetRef {
        return unsafe __AssetRef(core: self.handle)
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAsset : Hashable {
    public func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    public static func == (lhs: __REAsset, rhs: __REAsset) -> Bool {
        assertUnimplemented()
    }
    
    public var hashValue: Int {
        get {
            assertUnimplemented()
        }
    }
}
