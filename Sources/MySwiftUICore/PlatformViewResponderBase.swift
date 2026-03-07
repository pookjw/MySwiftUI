private import Spatial

@_spi(Internal) open class PlatformViewResponderBase<T: AnyObject, U: ContentResponder>: ViewResponder {
    package weak final var hostView: T? = nil // 0x30
    package weak final var representedView: T? = nil // 0x38
    package final var helper = ContentResponderHelper<U>()
    final var lastResult: PlatformViewResponderBase<T, U>.PlatformHitTestResult? = nil
    package weak final var preferredFocusableView: T? = nil
    
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
