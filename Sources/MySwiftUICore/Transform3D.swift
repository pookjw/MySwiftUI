// 5B7E2729CAC46452827ED6045679F039
internal import Spatial

struct Transform3D {
    private(set) var scale: Size3D
    private(set) var rotation: Rotation3D
    private(set) var translation: Size3D

    init(scale: Size3D, rotation: Rotation3D, translation: Size3D) {
        assertUnimplemented()
    }
}
