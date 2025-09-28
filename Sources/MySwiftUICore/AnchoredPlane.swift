#warning("TODO")

package enum AnchoredPlane: Hashable {
    case horizontal
    case vertical
}

extension EnvironmentValues {
    package var anchoredPlane: AnchoredPlane? {
        return _anchoredPlane
    }
    
    package var _anchoredPlane: AnchoredPlane? {
        get {
            return self[AnchoredPlaneKey.self]
        }
        set {
            self[AnchoredPlaneKey.self] = newValue
        }
    }
    
    fileprivate struct AnchoredPlaneKey: EnvironmentKey {
        static var defaultValue: AnchoredPlane? {
            return nil
        }
    }
}
