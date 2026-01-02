internal import Spatial
internal import CoreGraphics

struct ViewSize3D {
    var value: Size3D
    private var _proposal: Size3D
    
    var width: CGFloat {
        get {
            return value.width
        }
        set {
            value.width = newValue
        }
        _modify {
            var width = CGFloat(value.width)
            yield &width
            value.width = width
        }
    }
}
