// 65F9A3124753291160F9C93A735AF52F
internal import Foundation

@safe final class __REAssetManager {
    private(set) lazy var mainBundle: __REAssetBundle = {
        assertUnimplemented()
    }()
    
    private(set) lazy var syncLoadsShouldWaitForResourceSharing: Bool = {
        assertUnimplemented()
    }()
    
    private let handle: OpaquePointer
    
    private(set) lazy var asyncLoadsShouldWaitForResourceSharing: Bool = {
        assertUnimplemented()
    }()
    
    lazy var syncLoadsShouldInitiateResourceSharing = (UserDefaults.standard.object(forKey: "com.apple.re.syncLoadsShouldInitiateResourceSharing") as? Bool) ?? true
    
    init(handle: OpaquePointer) {
        unsafe self.handle = handle
    }
}

extension __REAssetManager : __REAssetService {
    func loadBundle(at url: URL) throws -> __REAssetBundle {
        assertUnimplemented()
    }
    
    func makeBundle() -> __REAssetBundle {
        assertUnimplemented()
    }
    
    var __handle: OpaquePointer {
        return self.handle
    }
    
    func __getDependencies(asset: __REAsset) -> [__REAsset] {
        assertUnimplemented()
    }
}
