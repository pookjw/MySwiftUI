package import Spatial

extension EnvironmentValues {
    package var systemExperienceDisplacement: Pose3D {
        get {
            return self[SystemExperienceDisplacementKey.self]
        }
        set {
            self[SystemExperienceDisplacementKey.self] = newValue
        }
    }
}

fileprivate struct SystemExperienceDisplacementKey: EnvironmentKey {
    static let defaultValue = Pose3D(position: .zero, rotation: simd_quatd(ix: 0, iy: 1, iz: 0, r: 0))
}
