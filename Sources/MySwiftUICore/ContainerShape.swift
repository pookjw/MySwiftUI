// E7F652304F78E63E0DE3A54ABB60E18A
internal import AttributeGraph
internal import CoreGraphics

struct ContainerShapeTransform : Rule, AsyncAttribute {
    @Attribute private var transform: ViewTransform
    @Attribute private var position: CGPoint
    @Attribute private var size: CGSize
    private var id: CoordinateSpace.ID
    
    init(transform: Attribute<ViewTransform>, position: Attribute<CGPoint>, size: Attribute<CGSize>, id: CoordinateSpace.ID) {
        self._transform = transform
        self._position = position
        self._size = size
        self.id = id
    }
    
    var value: ViewTransform {
        assertUnimplemented()
    }
}

protocol AnyContainerShapeType {
    static func path(in rect: CGRect, proxy: GeometryProxy, shape: AnyWeakAttribute, context: ContainerShapeContext) -> Path
    static func corners(in rect: CGRect, proxy: GeometryProxy, shape: AnyWeakAttribute, context: ContainerShapeContext, corners: RoundedRectangularShapeCorners, uniformity: ConcentricRectangle.Uniformity) -> RectangleCornerRadii?
    static func corners(in rect: CGSize?, shape: AnyWeakAttribute, context: ContainerShapeContext) -> RectangleCornerRadii?
}

struct ContainerShapeData {
    private(set) var type: (any AnyContainerShapeType.Type)
    private(set) var shape: AnyWeakAttribute
    private(set) var context: ContainerShapeContext
    private(set) var isSystemShape: Bool
    
    init(type: (any AnyContainerShapeType.Type), shape: AnyWeakAttribute, context: ContainerShapeContext, isSystemShape: Bool) {
        self.type = type
        self.shape = shape
        self.context = context
        self.isSystemShape = isSystemShape
    }
}

struct ContainerShapeContext {
    private var id: CoordinateSpace.ID
    @WeakAttribute private var position: CGPoint?
    @WeakAttribute private var size: ViewSize?
    @WeakAttribute private var childTransform: ViewTransform?
    
    init(id: CoordinateSpace.ID, position: WeakAttribute<CGPoint>, size: WeakAttribute<ViewSize>, childTransform: WeakAttribute<ViewTransform>) {
        self.id = id
        self._position = position
        self._size = size
        self._childTransform = childTransform
    }
}

struct ContainerCornerShapeType<T> : AnyContainerShapeType {
    static func path(in rect: CGRect, proxy: GeometryProxy, shape: AnyWeakAttribute, context: ContainerShapeContext) -> Path {
        assertUnimplemented()
    }
    
    static func corners(in rect: CGRect, proxy: GeometryProxy, shape: AnyWeakAttribute, context: ContainerShapeContext, corners: RoundedRectangularShapeCorners, uniformity: ConcentricRectangle.Uniformity) -> RectangleCornerRadii? {
        assertUnimplemented()
    }
    
    static func corners(in rect: CGSize?, shape: AnyWeakAttribute, context: ContainerShapeContext) -> RectangleCornerRadii? {
        assertUnimplemented()
    }
}

fileprivate struct DefaultContainerShapeType : AnyContainerShapeType {
    static func path(in rect: CGRect, proxy: GeometryProxy, shape: AnyWeakAttribute, context: ContainerShapeContext) -> Path {
        assertUnimplemented()
    }
    
    static func corners(in rect: CGRect, proxy: GeometryProxy, shape: AnyWeakAttribute, context: ContainerShapeContext, corners: RoundedRectangularShapeCorners, uniformity: ConcentricRectangle.Uniformity) -> RectangleCornerRadii? {
        assertUnimplemented()
    }
    
    static func corners(in rect: CGSize?, shape: AnyWeakAttribute, context: ContainerShapeContext) -> RectangleCornerRadii? {
        assertUnimplemented()
    }
}

fileprivate struct ContainerShapeEnvironment : Rule, AsyncAttribute {
    @Attribute private(set) var environment: EnvironmentValues
    private(set) var data: ContainerShapeData
    
    var value: EnvironmentValues {
        var environment = self.environment
        environment[ContainerShapeKey.self] = data
        
        return environment
    }
}

extension EnvironmentValues {
    @inline(always) // 원래 없음
    var containerShape: ContainerShapeData {
        return self[ContainerShapeKey.self]
    }
}

fileprivate struct ContainerShapeKey : EnvironmentKey {
    static var defaultValue: ContainerShapeData {
        return ContainerShapeData(
            type: DefaultContainerShapeType.self,
            shape: AnyWeakAttribute(),
            context: ContainerShapeContext(
                id: CoordinateSpace.ID(rawValue: .invalid),
                position: WeakAttribute(),
                size: WeakAttribute(),
                childTransform: WeakAttribute()
            ),
            isSystemShape: false
        )
    }
}

extension _ViewInputs {
    mutating func setContainerShape<T : RoundedRectangularShape>(_ shape: Attribute<T>, isSystemShape: Bool) {
        // $s7SwiftUI11_ViewInputsVAAE17setContainerShape_08isSystemG0y14AttributeGraph0J0VyxG_SbtAA018RoundedRectangularG0RzlFAA06UnevenL9RectangleV_Tg5
        /*
         self = x19
         shape = sp
         isSystemShape = sp + 0x4
         */
        // x22
        let id = CoordinateSpace.ID()
        // w25
        let transform = self.transform
        
        // x24
        let transformAttribute = Attribute(
            ContainerShapeTransform(
                transform: transform,
                position: base.cachedEnvironment.value.animatedPosition(for: self),
                size: base.cachedEnvironment.value.animatedCGSize(for: self),
                id: id
            )
        )
        self.transform = transformAttribute
        
        let environmentAttribute = Attribute(
            ContainerShapeEnvironment(
                environment: base.cachedEnvironment.value.environment, // sp + 0x20
                data: ContainerShapeData(
                    type: ContainerCornerShapeType<T>.self, // sp + 0x28
                    shape: WeakAttribute(shape).base, // sp + 0x38
                    context: ContainerShapeContext(
                        id: id, // sp + x40
                        position: WeakAttribute(base.cachedEnvironment.value.animatedPosition(for: self)), // sp + 0x40
                        size: WeakAttribute(base.cachedEnvironment.value.animatedSize(for: self)), // sp + 0x50
                        childTransform: WeakAttribute(transformAttribute) // sp + 0x58
                    ),
                    isSystemShape: isSystemShape // sp + 0x60
                )
            )
        )
        
        base.environment = environmentAttribute
    }

    mutating func setContainerShape<T : InsettableShape>(_ shape: Attribute<T>, isSystemShape: Bool) {
        assertUnimplemented()
    }
}
