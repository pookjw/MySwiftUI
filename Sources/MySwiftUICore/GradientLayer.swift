internal import QuartzCore

final class GradientLayer : CAGradientLayer {
    override init() {
        super.init()
    }
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

extension GradientLayer {
    fileprivate struct GradientGeometry {
        // TODO
    }
}
