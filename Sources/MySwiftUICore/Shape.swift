public import CoreGraphics
public import Spatial
internal import AttributeGraph

public protocol Shape : Sendable, Animatable, View, _RemoveGlobalActorIsolation {
    nonisolated func path(in rect: CGRect) -> Path
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    nonisolated static var role: ShapeRole { get }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated var layoutDirectionBehavior: LayoutDirectionBehavior { get }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize
}

extension Shape {
    nonisolated public func path(in rect: CGRect) -> Path {
        assertUnimplemented()
    }
    
    @available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
    nonisolated public static var role: ShapeRole {
        return .fill
    }
    
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    nonisolated public var layoutDirectionBehavior: LayoutDirectionBehavior {
        assertUnimplemented()
    }
    
    @available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
    nonisolated public func sizeThatFits(_ proposal: ProposedViewSize) -> CGSize {
        assertUnimplemented()
    }
    
    public var body: _ShapeView<Self, ForegroundStyle> {
        _ShapeView(
            shape: self,
            style: ForegroundStyle(),
            fillStyle: FillStyle(eoFill: false, antialiased: true)
        )
    }
}

@frozen public struct _ShapeView<Content : Shape, Style : ShapeStyle>: UnaryView, @preconcurrency ShapeStyledLeafView, PrimitiveView, @preconcurrency LeafViewLayout {
    typealias ShapeUpdateData = Void
    
    public var shape: Content
    public var style: Style
    public var fillStyle: FillStyle
    
    @inlinable public init(shape: Content, style: Style, fillStyle: FillStyle = FillStyle()) {
        self.shape = shape
        self.style = style
        self.fillStyle = fillStyle
    }
    
    public nonisolated static func _makeView(view: _GraphValue<_ShapeView<Content, Style>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         x29 = sp + 0x200
         x19 = sp
         x24 = x19 + 0x80
         */
        /*
         view -> x0 -> w22
         inputs -> x1 -> x28
         */
        // x24 + 0xc0 (sp + 0x140)
        let copy_1 = inputs
        
        let styles: Attribute<_ShapeStyle_Pack>
        if copy_1.preferences.contains(DisplayList.Key.self) || copy_1.preferences.contains(ViewRespondersKey.self) {
            // <+156>
            if Style.self == ForegroundStyle.self {
                // <+224>
                let copy_2 = inputs
                
                // inlined
                styles = copy_1.resolvedShapeStyles(
                    for: copy_2,
                    role: Content.role,
                    mode: nil
                )
                
                // <+760>
            } else {
                // <+180>
                // x19 + 0x80 (sp + 0x80)
                let copy_3 = inputs
                
                let resolver = ShapeStyleResolver(
                    style: OptionalAttribute(view[\.style].value),
                    mode: OptionalAttribute(),
                    environment: copy_1.environment,
                    role: Content.role,
                    substrate: copy_3.materialSubstrate,
                    animationsDisabled: copy_1.base.options.contains(.animationsDisabled),
                    helper: AnimatableAttributeHelper<_ShapeStyle_Pack>(
                        phase: copy_1.viewPhase,
                        time: copy_1.time,
                        transaction: copy_1.transaction
                    )
                )
                
                styles = Attribute(resolver)
                styles.flags = [.unknown0]
                // <+760>
            }
        } else {
            // <+340>
            return _ViewOutputs()
        }
        
        // <+760>
        if MemoryLayout<Content.AnimatableData>.size == 0 {
            // <+1336>
            // x19 + 0x80
            let copy_2 = inputs
            
            var outputs = Self.makeLeafView(
                view: view,
                inputs: copy_2,
                styles: styles,
                interpolatorGroup: nil,
                data: ()
            )
            
            if isLinkedOnOrAfter(.v4) {
                // <+1776>
                // x19 + 0x80
                let copy_3 = inputs
                Self.makeLeafLayout(&outputs, view: view, inputs: copy_3)
            }
            
            // <+1840>
            return outputs
        } else {
            // x19 + 0xf8 (sp + 0xf8)
            let copy_2 = inputs.base
            let animatable = Content.makeAnimatable(value: view[{ .of(&$0.shape) }], inputs: copy_2)
            let fillStyle = view[\.fillStyle]
            let shape = _GraphValue(AnimatedShape<Content>.Init(shape: animatable, fillStyle: fillStyle.value))
            
            // x19 + 0x80
            let copy_3 = copy_1
            
            // x28 (x19 + 0x28)
            var outputs = AnimatedShape<Content>
                .makeLeafView(
                    view: shape,
                    inputs: copy_3,
                    styles: styles,
                    interpolatorGroup: nil,
                    data: ()
                )
            
            if isLinkedOnOrAfter(.v4) {
                // x19 + 0x80
                let copy_4 = copy_1
                AnimatedShape<Content>.makeLeafLayout(&outputs, view: shape, inputs: copy_4)
            }
            
            // <+1620>
            // x19 + 0x80
            let copy_5 = copy_1
            
            outputs.makeContentPathPreferenceWriter(
                inputs: copy_5,
                contentResponder: view.value, // $s7SwiftUI10_ShapeViewV05_makeD04view6inputsAA01_D7OutputsVAA11_GraphValueVyACyxq_GG_AA01_D6InputsVtFZ09AttributeI00L0VyAKGyXEfu0_TA
                kinds: OptionalAttribute()
            )
            
            return outputs
        }
    }
    
    public typealias Body = Never
    
    package func sizeThatFits(in proposedSize: _ProposedSize) -> CGSize {
        return self.shape.sizeThatFits(ProposedViewSize(width: proposedSize.width, height: proposedSize.height))
    }
    
    @_spi(Internal) public func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    @_spi(Internal) public func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
    
    static var animatesSize: Bool {
        assertUnimplemented()
    }
    
    func mustUpdate(data: Self.ShapeUpdateData, position: Attribute<CGPoint>, environment: Attribute<EnvironmentValues>) -> Bool {
        assertUnimplemented()
    }
    
    func shape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    static var hasBackground: Bool {
        assertUnimplemented()
    }
    
    func backgroundShape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    func isClear(styles: _ShapeStyle_Pack) -> Bool {
        assertUnimplemented()
    }
    
    func finalPlacement(oldIndex: Int, oldPlacedSubviews: [_LazyLayout_PlacedSubview], newPlacedSubviews: [_LazyLayout_PlacedSubview], wasRemovedFromSubviews: Bool, context: AnyRuleContext) -> _Placement {
        assertUnimplemented()
    }
}

@available(*, unavailable)
extension _ShapeView : Sendable {
}

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
extension _ShapeView : ShapeView {
}

public protocol ShapeView<Content> : View, _RemoveGlobalActorIsolation {
    associatedtype Content : Shape
    
    var shape: Self.Content {
        get
    }
}

struct ShapeStyleResolver<T : ShapeStyle> : StatefulRule, AsyncAttribute, ObservedAttribute {
    @OptionalAttribute private var style: T? // 0x0
    @OptionalAttribute private var mode: _ShapeStyle_ResolverMode? // 0x4
    @Attribute private var environment: EnvironmentValues // 0x8
    private var role: ShapeRole // 0xc
    private var substrate: Material.Substrate? // 0xd
    private var animationsDisabled: Bool // 0xe
    private var helper: AnimatableAttributeHelper<_ShapeStyle_Pack> // 0x10
    private let tracker = PropertyList.Tracker() // 0x40
    
    typealias Value = _ShapeStyle_Pack
    
    init(
        style: OptionalAttribute<T> = OptionalAttribute(),
        mode: OptionalAttribute<_ShapeStyle_ResolverMode> = OptionalAttribute(),
        environment: Attribute<EnvironmentValues>,
        role: ShapeRole,
        substrate: Material.Substrate?,
        animationsDisabled: Bool,
        helper: AnimatableAttributeHelper<_ShapeStyle_Pack>
    ) {
        self._style = style
        self._mode = mode
        self._environment = environment
        self.role = role
        self.substrate = substrate
        self.animationsDisabled = animationsDisabled
        self.helper = helper
    }
    
    mutating func updateValue() {
        // <+404>
        let (style, styleChanged): (T?, Bool)
        if let attribute = self.$style {
            (style, styleChanged) = attribute.changedValue(options: [])
        } else {
            (style, styleChanged) = (nil, false)
        }
        
        // <+736>
        let (mode, modeChanged): (_ShapeStyle_ResolverMode, Bool)
        if let attribute = self.$mode {
            (mode, modeChanged) = attribute.changedValue(options: [])
        } else {
            mode = _ShapeStyle_ResolverMode(foregroundLevels: 1, options: [])
            modeChanged = false
        }
        
        // <+816>
        let (environment, envChanged) = self.$environment.changedValue(options: [])
        // x19 + 0x80
        var pack = _ShapeStyle_Pack()
        
        // x19 + 0x88
        var flag_1: Bool
        // w20
        var flag_2: Bool = modeChanged
        // x19 + 0x4
        var flag_3: Bool!
        let flag_4: Bool
        
        if !styleChanged && !modeChanged {
            // <+872>
            flag_1 = !self.hasValue
            
            if !flag_1 {
                // <+904>
                if envChanged {
                    // <+1008>
                    flag_2 = self.tracker.hasDifferentUsedValues(environment.plist)
                    flag_1 = flag_2
                    // <+1056>
                    flag_4 = true
                } else {
                    // <+908>
                    if self.helper.animatorState == nil {
                        // <+1120>
                        guard self.helper.checkReset() else {
                            return
                        }
                        
                        flag_1 = true
                        self.tracker.reset()
                        flag_3 = true
                        // <+1308>
                    } else {
                        // <+936>
                        flag_3 = false
                        // <+1308>
                    }
                    
                    // <+1308>
                    flag_4 = false
                }
            } else {
                // <+984>
                flag_2 = true
                // <+1056>
                flag_4 = true
            }
        } else {
            // <+956>
            flag_2 = true
            flag_1 = flag_2
            
            // <+1056>
            flag_4 = true
        }
        
        if flag_4 {
            // <+1056>
            if self.helper.animatorState == nil {
                // <+1096>
                if flag_2 {
                    // <+1100>
                    // <+1288>
                    self.tracker.reset()
                    flag_3 = true
                    // <+1308>
                } else {
                    // <+1120>
                    guard self.helper.checkReset() else {
                        return
                    }
                    
                    flag_1 = true
                    self.tracker.reset()
                    flag_3 = true
                }
            } else {
                // <+1068>
                if flag_2 {
                    // <+1288>
                    self.tracker.reset()
                    flag_3 = true
                    // <+1308>
                } else {
                    // <+1084>
                    flag_3 = false
                    // <+1308>
                }
            }
            
            // <+1308>
        } else {
            // <+1308>
        }
        
        // <+1308>
        // x24
        let foregroundLevels: UInt16
        if mode.options.contains(.foregroundPalette) {
            foregroundLevels = mode.foregroundLevels
        } else {
            if mode.foregroundLevels != 0 {
                foregroundLevels = 1
            } else {
                foregroundLevels = 0
            }
        }
        
        self.tracker.initializeValues(from: environment.plist)
        
        // <+1428>
        if foregroundLevels != 0 {
            // <+1500>
            assertUnimplemented()
        } else {
            // <+1624>
            assertUnimplemented()
        }
        
        assertUnimplemented()
    }
    
    func destroy() {
        assertUnimplemented()
    }
}

struct AnimatedShape<T : Shape> : @preconcurrency ShapeStyledLeafView, PrimitiveView, UnaryView, @preconcurrency LeafViewLayout {
    typealias ShapeUpdateData = Void
    
    func sizeThatFits(in proposedSize: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
    
    func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
        assertUnimplemented()
    }
    
    static var animatesSize: Bool {
        assertUnimplemented()
    }
    
    func mustUpdate(data: Self.ShapeUpdateData, position: Attribute<CGPoint>, environment: Attribute<EnvironmentValues>) -> Bool {
        assertUnimplemented()
    }
    
    func shape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    static var hasBackground: Bool {
        assertUnimplemented()
    }
    
    func backgroundShape(in size: CGSize) -> (shape: _ShapeStyle_RenderedShape.Shape, frame: CGRect) {
        assertUnimplemented()
    }
    
    func isClear(styles: _ShapeStyle_Pack) -> Bool {
        assertUnimplemented()
    }
    
    func finalPlacement(oldIndex: Int, oldPlacedSubviews: [_LazyLayout_PlacedSubview], newPlacedSubviews: [_LazyLayout_PlacedSubview], wasRemovedFromSubviews: Bool, context: AnyRuleContext) -> _Placement {
        assertUnimplemented()
    }
    
    private var shape: T
    private var fillStyle: FillStyle
}

extension AnimatedShape {
    struct Init : AsyncAttribute, Rule {
        @Attribute private var shape: T
        @Attribute private var fillStyle: FillStyle
        
        init(shape: Attribute<T>, fillStyle: Attribute<FillStyle>) {
            self._shape = shape
            self._fillStyle = fillStyle
        }
        
        var value: AnimatedShape<T> {
            assertUnimplemented()
        }
    }
}

extension _ViewInputs {
    func resolvedShapeStyles(for inputs: _ViewInputs, role: ShapeRole, mode: Attribute<_ShapeStyle_ResolverMode>?) -> Attribute<_ShapeStyle_Pack> {
        return self.base.cachedEnvironment.value.resolvedShapeStyles(for: inputs, role: role, mode: mode)
    }
}

struct _ShapeStyle_RenderedShape {
    // TODO
}

extension _ShapeStyle_RenderedShape {
    enum Shape {
        // TODO
    }
}
