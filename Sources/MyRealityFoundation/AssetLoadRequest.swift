private import CoreRE
private import Foundation

@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency @safe final public class __AssetLoadRequest {
    public enum ResourceSharingSchedulingRequirement : Equatable {
        case none // 2
        case initiateNow // 3
        case initiateNowAndWaitForPeers(blockECSUpdateSends: Bool = false) // 0 (false), 1 (true)
    }
    
    private let coreAssetRequest: OpaquePointer
    
    convenience public init(serviceLocator: __ServiceLocator) {
        assertUnimplemented()
    }
    
    convenience public init(assetService: any __REAssetService) {
        assertUnimplemented()
    }
    
    @available(*, deprecated, renamed: "init(assetService:resourceSharingScheduling:)", message: "Use enum-based API instead")
    convenience public init(assetService: any __REAssetService, shouldWaitForPeers: Bool) {
        assertUnimplemented()
    }
    
    @available(*, deprecated, renamed: "init(assetService:resourceSharingScheduling:)", message: "Use enum-based API instead")
    convenience public init(assetService: any __REAssetService, shouldLoadOnPeers: Bool, shouldWaitForPeers: Bool) throws {
        assertUnimplemented()
    }
    
    convenience public init(assetService: any __REAssetService, resourceSharingScheduling scheduling: __AssetLoadRequest.ResourceSharingSchedulingRequirement) throws {
        /*
         assetService -> x0 -> x19
         scheduling -> x1 -> w26
         */
        let w24 = (scheduling != .none)
        
        let reAssetRequest = unsafe unsafeBitCast(
            assetService.__handle,
            to: CoreRE::AssetManager.self
        )
            .createAssetRequest()
        
        unsafe self.init(
            core: unsafeBitCast(reAssetRequest, to: OpaquePointer.self)
        )
        
        // <+132>
        let w2: Bool
        switch scheduling {
        case .none, .initiateNow:
            w2 = false
        case .initiateNowAndWaitForPeers(_):
            w2 = true
        }
        
        var error: NSError? = nil
        var result = unsafe reAssetRequest
            .setLoadAndWaitForResourceSharingClients(w24, w2, &error)
        
        guard result else {
            if let error {
                throw error
            } else {
                throw REError
                    .internalError(
                        "Failed to initialize __AssetLoadRequest with scheduling settings \(scheduling).  (Failed at REAssetLoadRequestSetLoadAndWaitForResourceSharingClients)"
                    )
            }
        }
        
        let w1: Bool
        switch scheduling {
        case .none, .initiateNow:
            w1 = false
        case .initiateNowAndWaitForPeers(let blockECSUpdateSends):
            w1 = blockECSUpdateSends
        }
        
        error = nil
        
        result = unsafe reAssetRequest
            .setShouldBlockECSSendsUntilCompleted(w1, &error)
        
        guard result else {
            if let error {
                throw error
            } else {
                throw REError
                    .internalError(
                        "Failed to initialize __AssetLoadRequest with scheduling settings \(scheduling).  (Failed at REAssetLoadRequestSetShouldBlockECSSendsUntilCompleted)"
                    )
            }
        }
    }
    
    init(core: OpaquePointer) {
        unsafe self.coreAssetRequest = core
    }
    
    deinit {
        unsafe __RERelease(self.coreAssetRequest)
    }
    
    final public func add(asset: __AssetRef) {
        unsafe unsafeBitCast(self.coreAssetRequest, to: CoreRE::Asset.LoadRequest.self)
            .addAsset(unsafeBitCast(asset.core, to: CoreRE::Asset.self))
    }
    
    final public func add(asset: __REAsset) {
        self.add(asset: asset.__handle)
    }
    
    @preconcurrency @MainActor final public func add(_ entity: Entity, includeDescendants: Bool = true) {
        assertUnimplemented()
    }
    
    final public var progress: Float {
        get {
            assertUnimplemented()
        }
    }
    
    final public var error: (any Error)? {
        get {
            assertUnimplemented()
        }
    }
    
    public typealias CompletionHandler = @convention(block) (_ success: Bool) -> Void
    
    @preconcurrency final public func setCompletionHandler(_ handler: @escaping __AssetLoadRequest.CompletionHandler) {
        unsafe unsafeBitCast(self.coreAssetRequest, to: CoreRE::Asset.LoadRequest.self)
            .setCompletionHandler(handler)
    }
    
    final public func waitForCompletion() {
        assertUnimplemented()
    }
    
    final public func waitForCompletionFromNonEngineQueue() {
        assertUnimplemented()
    }
}
