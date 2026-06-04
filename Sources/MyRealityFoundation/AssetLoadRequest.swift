@_hasMissingDesignatedInitializers @available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
@preconcurrency final public class __AssetLoadRequest {
    public enum ResourceSharingSchedulingRequirement : Equatable {
        case none
        case initiateNow
        case initiateNowAndWaitForPeers(blockECSUpdateSends: Bool = false)
        
        public static func == (a: __AssetLoadRequest.ResourceSharingSchedulingRequirement, b: __AssetLoadRequest.ResourceSharingSchedulingRequirement) -> Bool {
            assertUnimplemented()
        }
    }
    
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
        assertUnimplemented()
    }
    
    final public func add(asset: __AssetRef) {
        assertUnimplemented()
    }
    
    final public func add(asset: __REAsset) {
        assertUnimplemented()
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
        assertUnimplemented()
    }
    
    final public func waitForCompletion() {
        assertUnimplemented()
    }
    
    final public func waitForCompletionFromNonEngineQueue() {
        assertUnimplemented()
    }
}
