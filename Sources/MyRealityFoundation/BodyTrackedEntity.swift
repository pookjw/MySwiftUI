internal import Foundation

@_inheritsConvenienceInitializers @_hasMissingDesignatedInitializers @available(iOS 13.0, macCatalyst 13.0, *)
@available(macOS, unavailable, introduced: 26.0)
@available(visionOS, unavailable, introduced: 1.0)
@available(tvOS, unavailable, introduced: 26.0)
@preconcurrency @MainActor public class BodyTrackedEntity : Entity, HasBodyTracking, HasModel {
    override class func classLoad(named name: String, in bundle: Bundle?, options: Entity.__LoadOptions, asyncOptions: Entity.__AsyncLoadOptions) async throws -> Entity {
        assertUnimplemented()
    }

    override class func classLoad(contentsOf url: URL, withName name: String?, options: Entity.__LoadOptions, asyncOptions: Entity.__AsyncLoadOptions) async throws -> Entity {
        assertUnimplemented()
    }

    override class func classLoad(from data: Data, named name: String?, options: Entity.__LoadOptions, asyncOptions: Entity.__AsyncLoadOptions) async throws -> Entity {
        assertUnimplemented()
    }

    @MainActor @preconcurrency override internal init(_coreEntity: __EntityRef) {
        assertUnimplemented()
    }
    
    @_spi(Internal) @MainActor @preconcurrency required public init() {
        assertUnimplemented()
    }
}
