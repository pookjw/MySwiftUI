internal import MySwiftUICore
internal import AttributeGraph
internal import Foundation

struct ManipulationTargetGeometryPreferenceKey: HostPreferenceKey {
    static var defaultValue: [UUID : Attribute<ObjectManipulationGeometry>] {
        return [:]
    }
}
