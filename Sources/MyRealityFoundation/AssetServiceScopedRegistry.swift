private import os.lock
private import CoreRE

@safe final class AssetServiceScopedRegistry<T> : @unchecked Sendable {
    func instance(for service: any __REAssetService) -> T where T == __RealityFileURLResolver {
        /*
         self -> x20 -> x19
         service -> x0 -> x23
         */
        let handle = unsafe service.__handle
        let lock = self.lock
        lock.lock()
        
        if let existing = unsafe self.instances[handle] {
            lock.unlock()
            return existing
        }
        
        // <+148>
        lock.unlock()
        
        // x22
        let resolver = __RealityFileURLResolver(service)
        
        lock.lock()
        unsafe self.instances[handle] = resolver
        
        let assetManager = unsafe unsafeBitCast(service.__handle, to: CoreRE::AssetManager.self)
        
        assetManager.addCleanupCallback { [weak self] in
            // $s17RealityFoundation26AssetServiceScopedRegistryC8instance3forx0A3Kit09__REAssetD0_p_tFyycfU_AF02__A15FileURLResolverC_Tg5TA
            guard let self else {
                return
            }
            
            unsafe self.instances[handle] = nil
        }
        
        lock.unlock()
        return resolver
    }
    
    private let lock = OSAllocatedUnfairLock<Void>()
    private var instances: [OpaquePointer : T] = [:]
}
