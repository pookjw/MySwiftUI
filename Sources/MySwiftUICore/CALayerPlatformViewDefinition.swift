internal import QuartzCore
private import _QuartzCorePrivate

final class CALayerPlatformViewDefinition : PlatformViewDefinition {
    override class var system : PlatformViewDefinition.System {
        return PlatformViewDefinition.System(base: .caLayer)
    }
    
    override class func makeView(kind: PlatformViewDefinition.ViewKind, item: Any) -> AnyObject {
        assertUnimplemented()
    }
    
    override class func makeView(kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        // x19
        let layer = CALayer()
        
        if case .mask = kind {
            // <+48>
            let mask_1 = CALayer()
            layer.mask = mask_1
            
            let mask_2 = layer.mask!
            mask_2.setCoordinatedAnimationDelegate()
            mask_2.anchorPoint = .zero
            mask_2.allowsGroupOpacity = false
            mask_2.allowsGroupBlending = false
            
            layer.setCoordinatedAnimationDelegate()
            layer.anchorPoint = .zero
            layer.allowsGroupOpacity = false
            layer.allowsGroupBlending = false
        } else {
            // <+196>
            layer.setCoordinatedAnimationDelegate()
            layer.anchorPoint = .zero
            
            switch kind {
            case .inherited, .geometry, .projection, .affine3D:
                // <+252>
                layer.allowsGroupOpacity = false
                layer.allowsGroupBlending = false
            case .color, .image, .shape:
                layer.allowsEdgeAntialiasing = true
            case .sdfLayer, .sdfEffect, .shadow, .backdrop, .chameleonColor, .drawing, .compositing, .mask, .platformView, .platformGroup, .platformLayer, .platformEffect:
                break
            }
        }
        
        return layer
    }
    
    override class func makeLayerView(type: CALayer.Type, kind: PlatformViewDefinition.ViewKind) -> AnyObject {
        assertUnimplemented()
    }
    
    override class func makePlatformView(view: AnyObject, kind: PlatformViewDefinition.ViewKind) {
        assertUnimplemented()
    }
    
    override class func makeDrawingView(options: PlatformDrawableOptions) -> any PlatformDrawable {
        assertUnimplemented()
    }
    
    override class func setProjectionTransform(_ transform: ProjectionTransform, projectionView: AnyObject) {
        assertUnimplemented()
    }
    
    override class func getRBLayer(drawingView: AnyObject) -> AnyObject? {
        assertUnimplemented()
    }
    
    override class func setIgnoresEvents(_ flag: Bool, of object: AnyObject) {
        assertUnimplemented()
    }
    
    override class func setHiddenForReuse(_ flag: Bool, of object: AnyObject) {
        assertUnimplemented()
    }
}
