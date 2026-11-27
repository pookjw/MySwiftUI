public import Foundation
private import Dispatch
private import CoreRE

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public protocol __REAssetService {
    var mainBundle: __REAssetBundle { get }
    func loadBundle(at url: URL) throws -> __REAssetBundle
    func makeBundle() -> __REAssetBundle
    var __handle: OpaquePointer { get }
    func __getDependencies(asset: __REAsset) -> [__REAsset]
    @available(*, deprecated, message: "This value is now unused by RealityKit")
    var syncLoadsShouldWaitForResourceSharing: Bool { get }
    var asyncLoadsShouldWaitForResourceSharing: Bool { get }
    var syncLoadsShouldInitiateResourceSharing: Bool { get }
}

extension __REAssetService {
    func asset(_ name: String) -> __REAsset? {
        let handle = unsafe self.__handle
        
        let asset = name.utf8CString.withUnsafeBufferPointer { pointer in
            unsafe unsafeBitCast(handle, to: CoreRE::AssetManager.self)
                .createAssetHandle(pointer.baseAddress.unsafelyUnwrapped)
        }
        
        guard let asset else {
            return nil
        }
        
        return unsafe __REAsset(
            handle: unsafeBitCast(asset, to: OpaquePointer.self)
        )
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAssetService {
    public func assetRef(named name: String, in realityArchiveURL: URL) throws -> __REAsset {
        assertUnimplemented()
    }
    
    func getDependenciesRecursively(asset: __REAsset, result: inout [__REAsset], visited: inout Set<__REAsset>, includingSelf: Bool) {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@available(*, deprecated)
extension __REAssetService {
    public func resource<T>(ofType type: T.Type, at path: __REAssetIdentifier) -> T? {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAssetService {
    var asManager: __REAssetManager {
        assertUnimplemented()
    }
    
    func dispatchPredicate(for queueOptions: __REAssetBundle.QueueOptions) -> DispatchPredicate {
        assertUnimplemented()
    }
    
    func performOnEngineQueue<T>(with queueOptions: __REAssetBundle.QueueOptions, _ body: () throws -> T) throws -> T {
        assertUnimplemented()
    }
    
    func firstUnloadedAssetIncludingDependencies(_ asset: __REAsset) -> __REAsset? {
        assertUnimplemented()
    }
}
