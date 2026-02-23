private import Spatial

@_spi(Internal) open class PlatformViewResponderBase<T: AnyObject, U: ContentResponder>: ViewResponder {
    weak var hostView: T? = nil // 0x30
    weak var representedView: T? = nil // 0x38
    var helper = ContentResponderHelper<U>()
    var lastResult: PlatformViewResponderBase<T, U>.PlatformHitTestResult? = nil
    weak var preferredFocusableView: T? = nil
    
    public override init() {
        super.init()
    }
    
    override init(host: ViewGraphDelegate?) {
        fatalError("TODO")
    }
    
    // TODO
}

extension PlatformViewResponderBase {
    struct PlatformHitTestResult {
        private var key: UInt32
        private var globalPoint: Point3D
        private weak var hitView: T?
    }
}
