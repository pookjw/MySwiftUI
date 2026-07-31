// 65F9A3124753291160F9C93A735AF52F
internal import Foundation

final class __REAssetManager {
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
    
    private(set) lazy var syncLoadsShouldInitiateResourceSharing: Bool = {
        assertUnimplemented()
    }()
    
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
        assertUnimplemented()
    }
    
    func __getDependencies(asset: __REAsset) -> [__REAsset] {
        assertUnimplemented()
    }
}
