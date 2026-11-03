internal import AttributeGraph
internal import CoreGraphics

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public protocol HoverEffectContent {
    static func _makeHoverEffectContent(effect: _GraphValue<Self>, inputs: _HoverEffectContentInputs, body: @escaping (_HoverEffectContentInputs) -> _HoverEffectContentOutputs) -> _HoverEffectContentOutputs
}

struct __MSUI_UnimplementedHoverEffectContent: HoverEffectContent {
    static func _makeHoverEffectContent(effect: _GraphValue<__MSUI_UnimplementedHoverEffectContent>, inputs: _HoverEffectContentInputs, body: @escaping (_HoverEffectContentInputs) -> _HoverEffectContentOutputs) -> _HoverEffectContentOutputs {
        assertUnimplemented()
    }
}

extension HoverEffectContent {
    func rendererEffect<T : RendererEffect>(_ effect: T) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func geometryEffect<T : GeometryEffect>(_ effect: T) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func offset(_ offset: CGSize) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func offset(x: CGFloat, y: CGFloat) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func scaleEffect(_ scale: CGSize, anchor: UnitPoint = .center) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func scaleEffect(_ s: CGFloat, anchor: UnitPoint = .center) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func scaleEffect(x: CGFloat, y: CGFloat, anchor: UnitPoint = .center) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func rotationEffect(_ angle: Angle, anchor: UnitPoint = .center) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func transformEffect(_ transform: CGAffineTransform) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
    
    func clipShape<S : Shape>(_ shape: S, style: FillStyle = FillStyle()) -> some HoverEffectContent {
        assertUnimplemented()
        return __MSUI_UnimplementedHoverEffectContent()
    }
}

@available(visionOS 2.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
public struct EmptyHoverEffectContent : HoverEffectContent {
    public static func _makeHoverEffectContent(effect: _GraphValue<Self>, inputs: _HoverEffectContentInputs, body: @escaping (_HoverEffectContentInputs) -> _HoverEffectContentOutputs) -> _HoverEffectContentOutputs {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension EmptyHoverEffectContent : Sendable {
}

struct HoverEffectContentList : Equatable {
    private var item: Item?

    init(item: Item?) {
        self.item = item
    }

    static func == (lhs: HoverEffectContentList, rhs: HoverEffectContentList) -> Bool {
        assertUnimplemented()
    }
}

extension HoverEffectContentList {
    struct Item : Equatable {
        private var identity: _DisplayList_Identity
        private var version: DisplayList.Version
        private var value: Value

        init(identity: _DisplayList_Identity, version: DisplayList.Version, value: Value) {
            self.identity = identity
            self.version = version
            self.value = value
        }

        static func == (lhs: Item, rhs: Item) -> Bool {
            assertUnimplemented()
        }

        indirect enum Value {
            case effect(Effect, HoverEffectContentList)
        }
    }

    enum Effect {
        case opacity(Float)
        case transform(CGAffineTransform)
        case resize(Path)
        case clip(Path)
        case scopedAnimation(Animation, HoverEffectContentList)
        case scopedActivationDelay(Double, HoverEffectContentList)
        case remotePropertyEffect(RemotePropertyEffectContent)
        case remoteExternalEffect(RemoteExternalEffectContent)
        case identity
    }
}

public struct _HoverEffectContentInputs {
    private var base: _CustomHoverEffectInputs
    private var isActive: Bool
    
    init(base: _CustomHoverEffectInputs, isActive: Bool) {
        self.base = base
        self.isActive = isActive
    }
}

@available(*, unavailable)
extension _HoverEffectContentInputs : Sendable {
}

public struct _HoverEffectContentOutputs {
    private var content: Attribute<HoverEffectContentList>
    
    init(content: Attribute<HoverEffectContentList>) {
        self.content = content
    }
}

extension _HoverEffectContentOutputs : Sendable {
}
