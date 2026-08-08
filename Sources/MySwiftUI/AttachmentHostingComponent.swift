@_spi(Internal) internal import MySwiftUICore
internal import RealityKit
internal import AttributeGraph

struct AttachmentHostingComponent : Component {
    let inputs: _ViewInputs
    let bridge: PreferenceBridge // 0x14 (field)
    let attachmentBridge: AttachmentPreferenceBridge // 0x18 (field)
    let subgraph: Subgraph // 0x1c (field)
    let graphHost: GraphHost // 0x20 (field)
    let id: _DisplayList_Identity // 0x24 (field)
}
