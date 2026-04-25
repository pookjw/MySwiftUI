// 72FB21917F353796516DFC9915156779
public import CoreGraphics
private import AttributeGraph

@frozen public struct _OffsetEffect : GeometryEffect, Equatable, ProtobufEncodableMessage, ProtobufDecodableMessage {
    public var offset: CGSize
    
    @inlinable nonisolated public init(offset: CGSize) {
        self.offset = offset
    }
    
    public func effectValue(size: CGSize) -> ProjectionTransform {
        assertUnimplemented()
    }
    
    public var animatableData: CGSize.MSUI_AnimatableData {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    nonisolated public static func _makeView(
        modifier: _GraphValue<_OffsetEffect>,
        inputs: _ViewInputs,
        body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs
    ) -> _ViewOutputs {
        var inputs = inputs
        
        let layoutDirection = inputs.base.cachedEnvironment.value.attribute(id: .layoutDirection) { environmentValues in
            return environmentValues.layoutDirection
        }
        
        let position = OffsetPosition(
            effect: modifier.value,
            position: inputs.position,
            layoutDirection: layoutDirection
        )
        inputs.position = Attribute(position)
        
        return body(_Graph(), inputs)
    }
    
    public static func == (a: _OffsetEffect, b: _OffsetEffect) -> Bool {
        assertUnimplemented()
    }
    
    
    public typealias AnimatableData = CGSize.MSUI_AnimatableData
    public typealias Body = Swift.Never
}


extension View {
    @inlinable nonisolated public func offset(_ offset: CGSize) -> some View {
        return modifier(_OffsetEffect(offset: offset))
    }
    
    @inlinable nonisolated public func offset(x: CGFloat = 0, y: CGFloat = 0) -> some View {
        return offset(CGSize(width: x, height: y))
    }
}

extension _OffsetEffect : Sendable {}
extension _OffsetEffect : BitwiseCopyable {}

fileprivate struct OffsetPosition : Rule, AsyncAttribute {
    @Attribute private(set) var effect: _OffsetEffect
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var layoutDirection: LayoutDirection
    
    var value: CGPoint {
        var d8: CGFloat
        let d9: CGFloat
        do {
            let offset = effect.offset
            d8 = offset.width
            d9 = offset.height
        }
        
        d8 = (layoutDirection == .leftToRight) ? d8 : -d8
        
        let d0: CGFloat
        let d1: CGFloat
        do {
            let position = self.position
            d0 = position.x
            d1 = position.y
        }
        
        return CGPoint(
            x: d8 + d0,
            y: d9 + d1
        )
    }
}
