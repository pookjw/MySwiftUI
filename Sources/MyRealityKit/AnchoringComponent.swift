public import ARKit
public import GameController

@available(visionOS 26.0, *)
@available(macOS, unavailable)
@available(iOS, unavailable)
@available(tvOS, unavailable)
extension AnchoringComponent.AccessoryAnchoringSource {
    public var underlyingAccessory: Accessory? {
        get {
            assertUnimplemented()
        }
    }
    
    public init(device: any GCDevice) async throws {
        assertUnimplemented()
    }
    
    public init(accessory: Accessory) throws {
        assertUnimplemented()
    }
}
