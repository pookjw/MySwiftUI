// 3890C65F12EA82A4BC5FBD33046B67FA
internal import AttributeGraph
internal import CoreGraphics

final class _ShapeStyle_InterpolatorGroup : DisplayList.InterpolatorGroup {
    private var layers: [_ShapeStyle_InterpolatorGroup.Layer]
    private var contentsScale: Float
    private var rasterizationOptions: RasterizationOptions
    private var serial: UInt32
    private var cursor: Int32
    
    override func reset() {
        assertUnimplemented()
    }
    
    override func nextUpdate(after time: Time) -> Time {
        assertUnimplemented()
    }
    
    override var features: DisplayList.Features {
        assertUnimplemented()
    }
    
    override var properties: DisplayList.Properties {
        assertUnimplemented()
    }
    
    override func update(contentSeed: DisplayList.Seed, transition: ContentTransition, animation: Animation?, listener: AnimationListener?, contentsScale: Float, rasterizationOptions: RasterizationOptions, supportsVFD: Bool) {
        assertUnimplemented()
    }
    
    override func rewriteInterpolation(serial: UInt32, list: inout DisplayList, time: Attribute<Time>, frame: CGRect, contentOrigin: CGPoint, contentOffset: CGSize, version: DisplayList.Version) -> Bool {
        assertUnimplemented()
    }
    
    override init() {
        assertUnimplemented()
    }
}

extension _ShapeStyle_InterpolatorGroup {
    fileprivate struct Layer {
        // TODO
    }
}
