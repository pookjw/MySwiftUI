public import QuartzCore

@_spi(Internal)
public class CAHostingLayer<Content> : CALayer where Content : View {
    public init(rootView: Content, environment: EnvironmentValues = .init()) {
        assertUnimplemented()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        assertUnimplemented()
    }
    
    public override var bounds: CGRect {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    override dynamic public func layoutSublayers() {
        assertUnimplemented()
    }
    
    public override var contentsScale: CGFloat {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public override init(layer: Any) {
        assertUnimplemented()
    }
    
    public var rootView: Content {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
