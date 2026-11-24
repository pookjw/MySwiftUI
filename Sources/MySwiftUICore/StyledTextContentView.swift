// 641995D812913A47B866B20B88782376
internal import Foundation
package import Spatial
package import CoreGraphics
internal import AttributeGraph

package struct StyledTextContentView : UnaryView, PrimitiveView, @preconcurrency ShapeStyledLeafView {
    @safe nonisolated(unsafe) var text: ResolvedStyledText
    var renderer: TextRendererBoxBase?
    var needsDrawingGroup: Bool
    
    init(text: ResolvedStyledText, renderer: TextRendererBoxBase?, needsDrawingGroup: Bool = false) {
        self.text = text
        self.renderer = renderer
        self.needsDrawingGroup = needsDrawingGroup
    }
    
    package func contains(points: UnsafeBufferPointer<Point3D>, size: CGSize) -> BitVector64 {
        assertUnimplemented()
    }
    
    package func contentPath(size: CGSize) -> Path {
        assertUnimplemented()
    }
    
    package func contentPath(size: CGSize, kind: ContentShapeKinds) -> Path {
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
    
    package nonisolated static func _makeView(view: _GraphValue<StyledTextContentView>, inputs: _ViewInputs) -> _ViewOutputs {
        let modifier = LinksHoverEffectOverlayModifier.ModifierRule(text: view.value.text)
        
        return LinksHoverEffectOverlayModifier
            .makeDebuggableView(
                modifier: _GraphValue(modifier),
                inputs: inputs
            ) { _, inputs in
                // $s7SwiftUI31LinksHoverEffectOverlayModifierV9_makeView8modifier6inputs4bodyAA01_I7OutputsVAA11_GraphValueVyACG_AA01_I6InputsVAiA01_N0V_ANtctFZ03$s7a21UI21StyledTextContenti4V05_h21F04view6inputsAA01_F7m6VAA11_no6VyACG_x3_F6P22VtFZAhA01_K0V_AMtcfU0_AA0stuI0VXMtAKyASGTf1nnncn_n
                return self._makeInnerView(view: view, inputs: inputs)
            }
    }
    
    fileprivate nonisolated static func _makeInnerView(view: _GraphValue<StyledTextContentView>, inputs: _ViewInputs) -> _ViewOutputs {
        // x22 + 0x180 (sp + 0x230)
        let copy_1 = inputs
        // x22 + 0xc0 (sp + 0x170)
        var copy_2 = inputs
        // sp + 0x30
        let options_1 = copy_1.base.options
        // view -> sp + 0x34
        copy_2.base.options.subtract(.viewRequestsLayoutComputer)
        
        // <+180>
        copy_2.preferences.remove(ViewRespondersKey.self)
        // <+252>
        let pack = copy_1.base.cachedEnvironment.value.resolvedShapeStyles(
            for: copy_1,
            role: .stroke,
            mode: nil
        )
        
        var outputs: _ViewOutputs
        
        if copy_1.preferences.contains(DisplayList.Key.self) || copy_1.preferences.contains(ViewRespondersKey.self) {
            // <+376>
            if copy_1[ArchivedViewInput.self].flags.contains(.isArchived) {
                // <+708>
                let environment = Attribute(
                    StyledTextContentView.ArchivedTransitionEnvironment(
                        view: view.value,
                        environment: copy_1.environment
                    )
                )
                
                copy_2.environment = environment
                
                let effect = ContentTransitionEffect.Init(
                    environment: copy_2.environment,
                    defaultTransition: ContentTransition(
                        storage: .named(
                            ContentTransition.NamedTransition(
                                name: .text(different: true),
                                layoutDirection: nil,
                                style: nil
                            )
                        )
                    )
                )
                
                outputs = ContentTransitionEffect.makeDebuggableView(
                    modifier: _GraphValue(Attribute(effect)),
                    inputs: copy_2) { _, inputs in
                        // $s7SwiftUI15_RendererEffectPAAE05_makecD06effect6inputs4bodyAA12_ViewOutputsVAA11_GraphValueVyxG_AA01_I6InputsVAiA01_K0V_ANtctFZAA017ContentTransitionD0V_Tt3B503$s7a14UI21StyledTextni5V010_e63InnerF033_641995D812913A47B866B20B88782376LL4view6inputsAA01_F7j6VAA11_kl13VyACG_AA01_F6M21VtFZAiA01_Q0V_ANtcfU_AA0rsnI0VXMtAKyAUG09AttributeK09AttributeVyAA16_ShapeStyle_PackVGTf1nnnc_n
                        return StyledTextContentView.makeLeafView(
                            view: view,
                            inputs: inputs,
                            styles: pack,
                            interpolatorGroup: nil,
                            data: ()
                        )
                    }
                
                // <+1356>
            } else {
                // <+452>
                let group = _ShapeStyle_InterpolatorGroup()
                copy_2.containerPosition = copy_1.animatedPosition()
                
                // x22 + 0x120 (sp + 0x1d0)
                let copy_4 = copy_2
                
                outputs = StyledTextContentView.makeLeafView(
                    view: view,
                    inputs: copy_4,
                    styles: pack,
                    interpolatorGroup: group,
                    data: ()
                )
                
                outputs.interpolateDisplayList(
                    group: group,
                    content: view.value.text,
                    inputs: copy_1
                )
                
                // <+1356>
            }
            
            // <+1356>
        } else {
            // <+1296>
            outputs = StyledTextContentView.makeLeafView(
                view: view,
                inputs: copy_2,
                styles: pack,
                interpolatorGroup: nil,
                data: ()
            )
            // <+1356>
        }
        
        // <+1356>
        if options_1.contains(.viewRequestsLayoutComputer) {
            outputs.layoutComputer = Attribute(StyledTextLayoutComputer(textView: view.value))
        }
        
        // <+1440>
        if copy_1.preferences.contains(Text.LayoutKey.self) {
            let query = TextLayoutQuery(
                resolvedText: view.value.text,
                position: copy_1.position,
                size: copy_1.size.cgSize(),
                transform: copy_1.transform
            )
            
            outputs.preferences[Text.LayoutKey.self] = Attribute(query)
        }
        
        // <+1628>
        if copy_1.preferences.contains(ViewRespondersKey.self) {
            let filter = StyledTextResponderFilter(
                responder: StyledTextResponder(
                    view: view.value,
                    styles: pack,
                    inputs: copy_1
                )
            )
            
            outputs.preferences[ViewRespondersKey.self] = Attribute(filter)
        }
        
        // <+1872>
        if copy_1.preferences.contains(ContentShapePathData.self) {
            let pathData = Attribute(
                ContentResponderPathDataRule<StyledTextContentView>(
                    transform: copy_1.transform,
                    position: copy_1.position,
                    size: copy_1.size.cgSize(),
                    content: view.value,
                    kinds: OptionalAttribute()
                )
            )
            
            if copy_1.preferences.contains(ContentShapePathData.self) {
                outputs.preferences[ContentShapePathData.self] = pathData.toOptional
            }
        }
        
        // <+2248>
        return outputs
    }
}

package class ResolvedStyledText {
    final let storage: NSAttributedString?
    final let archiveOptions: ArchivedViewInput.Value
    
    func resetCache() {
        assertUnimplemented()
    }
    
    var drawingMargins: EdgeInsets {
        assertUnimplemented()
    }
    
    init(
        storage: NSAttributedString?,
        layoutProperties: TextLayoutProperties,
        layoutMargins: EdgeInsets?,
        stylePadding: EdgeInsets,
        archiveOptions: ArchivedViewInput.Value,
        isCollapsible: Bool,
        features: Text.ResolvedProperties.Features,
        suffix: ResolvedTextSuffix,
        attachments: Text.ResolvedProperties.CustomAttachments,
        styles: [_ShapeStyle_Pack.Style],
        transitions: [Text.ResolvedProperties.Transition],
        scaleFactorOverride: CGFloat?,
        links: Text.ResolvedProperties.Links
    ) {
        assertUnimplemented()
    }
    
    func lineHeightScalingAdjustment(lineHeightMultiple: CGFloat, maximumLineHeight: CGFloat, minimumLineHeight: CGFloat) -> CGFloat {
        assertUnimplemented()
    }
    
    var majorAxis: Axis {
        assertUnimplemented()
    }
    
    func drawingScale(size: CGSize) -> CGFloat {
        assertUnimplemented()
    }
    
    func spacing() -> Spacing {
        assertUnimplemented()
    }
    
    func sizeThatFits(_ size: _ProposedSize) -> CGSize {
        assertUnimplemented()
    }
    
    func size(in size: CGSize) -> CGSize {
        assertUnimplemented()
    }
    
    func frameSize(in size: CGSize) -> CGSize {
        assertUnimplemented()
    }
    
    func truncates(in size: _ProposedSize) -> Bool {
        assertUnimplemented()
    }
    
    func metrics(in size: CGSize, layoutMargins: EdgeInsets?) -> NSAttributedString.Metrics {
        assertUnimplemented()
    }
    
    func size(in size: CGSize, context: TextDrawingContext) -> CGSize {
        assertUnimplemented()
    }
    
    func explicitAlignment(_ key: AlignmentKey, at size: CGSize) -> CGFloat? {
        assertUnimplemented()
    }
    
    func linkURL(at location: CGPoint, in size: CGSize) -> URL? {
        assertUnimplemented()
    }
    
    func linksHoverEffectViewConfiguration() -> TextLinksHoverEffectViewConfiguration? {
        assertUnimplemented()
    }
    
    func draw(in: CGRect, with: CGSize, applyingMarginOffsets: Bool, containsResolvable: Bool, context: TextDrawingContext, renderer: TextRendererBoxBase?) {
        assertUnimplemented()
    }
    
    func layoutValue(in rect: CGRect, with size: CGSize, applyingMarginOffsets: Bool) -> Text.Layout? {
        assertUnimplemented()
    }
    
    final var needsDynamicRenderingInArchive: Bool {
        assertUnimplemented()
    }
    
    var needsStyledRendering: Bool {
        assertUnimplemented()
    }
    
    final func draw(
        in rect: CGRect,
        with size: CGSize,
        applyingMarginOffsets: Bool = true,
        context: TextDrawingContext = .shared,
        renderer: TextRendererBoxBase?
    ) {
        let isDynamic: Bool
        if let storage = self.storage {
            isDynamic = storage.isDynamic
        } else {
            isDynamic = false
        }
        
        self.draw(
            in: rect,
            with: size,
            applyingMarginOffsets: applyingMarginOffsets,
            containsResolvable: isDynamic,
            context: context,
            renderer: renderer
        )
    }
    
    package final var layoutProperties: TextLayoutProperties {
        assertUnimplemented()
    }
    
    package final var isDynamic: Bool {
        assertUnimplemented()
    }
    
    package final var isEmpty: Bool {
        assertUnimplemented()
    }
}

class TextRendererBoxBase {
    let environment: EnvironmentValues
    
    init() {
        assertUnimplemented()
    }
}

extension ResolvedStyledText : InterpolatableContent {
    static var defaultTransition: ContentTransition {
        assertUnimplemented()
    }
    
    final func requiresTransition(to other: ResolvedStyledText) -> Bool {
        assertUnimplemented()
    }
    
    final var appliesTransitionsForSizeChanges: Bool {
        assertUnimplemented()
    }
    
    final var addsDrawingGroup: Bool {
        assertUnimplemented()
    }
    
    final func modifyTransition(state: inout ContentTransition.State, to other: ResolvedStyledText) {
        assertUnimplemented()
    }
    
    final func defaultAnimation(to other: ResolvedStyledText) -> Animation? {
        assertUnimplemented()
    }
}

extension ResolvedStyledText : CustomStringConvertible {
    package var description: String {
        assertUnimplemented()
    }
}

enum ResolvedTextSuffix {
    // TODO
}

struct AccessibilityStyledTextContentView<T : TextAccessibilityProvider> : View {
    var text: ResolvedStyledText
    var unresolvedText: Text
    var renderer: TextRendererBoxBase?
    var needsDrawingGroup: Bool
    
    init(text: ResolvedStyledText, unresolvedText: Text, renderer: TextRendererBoxBase?, needsDrawingGroup: Bool) {
        self.text = text
        self.unresolvedText = unresolvedText
        self.renderer = renderer
        self.needsDrawingGroup = needsDrawingGroup
    }
    
    var body: some View {
        T.makeView(
            content: StyledTextContentView(
                text: self.text,
                renderer: self.renderer,
                needsDrawingGroup: self.needsDrawingGroup
            ),
            text: self.unresolvedText,
            resolved: self.text
        )
    }
}

struct EnableLinkHoverEffects : UserDefaultKeyedFeature {
    static var key: String {
        return "com.apple.SwiftUI.EnableLinkHoverEffects"
    }
    
    static var defaultValue: Bool {
        return true
    }
    
    @safe static nonisolated(unsafe) var cachedValue: Bool?
}

fileprivate struct StyledTextLayoutComputer : AsyncAttribute, StatefulRule {
    @Attribute private(set) var textView: StyledTextContentView
    
    typealias Value = LayoutComputer
    
    func updateValue() {
        assertUnimplemented()
    }
}

fileprivate struct TextLayoutQuery : AsyncAttribute, Rule {
    @Attribute private(set) var resolvedText: ResolvedStyledText
    @Attribute private(set) var position: CGPoint
    @Attribute private(set) var size: CGSize
    @Attribute private(set) var transform: ViewTransform
    
    var value: [Text.LayoutKey.AnchoredLayout] {
        assertUnimplemented()
    }
}

struct StyledTextResponderFilter : StatefulRule {
    let responder: StyledTextResponder
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        assertUnimplemented()
    }
}

final class StyledTextResponder : ViewResponder {
    @Attribute var view: StyledTextContentView // 0x30
    @Attribute var styles: _ShapeStyle_Pack // 0x34
    let inputs: _ViewInputs // 0x38
    let viewSubgraph: Subgraph // 0x90
    var helper = ContentResponderHelper<ShapeStyledResponderData<StyledTextContentView>>() // 0x98
    var childSubgraph: Subgraph? = nil // 0x130
    var childViewSubgraph: Subgraph? = nil // 0x138
    lazy var gestureGraph: GestureGraph = {
        // $s7SwiftUI19StyledTextResponderC12gestureGraphAA07GestureG0Cvg
        assertUnimplemented()
    }() // 0x140
    lazy var bindingBridge: any EventBindingBridge & GestureGraphDelegate = {
        // $s7SwiftUI19StyledTextResponderC13bindingBridgeAA20GestureGraphDelegate_AA012EventBindingG0CXcvgAaE_AGXcyXEfU_
        assertUnimplemented()
    }() // 0x148
    var _gestureContainer: AnyObject? = nil // 0x158
    
    init(
        view: Attribute<StyledTextContentView>,
        styles: Attribute<_ShapeStyle_Pack>,
        inputs: _ViewInputs
    ) {
        self._view = view
        self._styles = styles
        self.inputs = inputs
        self.viewSubgraph = view.subgraph
        super.init()
    }
    
    func update() {
        assertUnimplemented()
    }
    
    override var gestureContainer: AnyObject? {
        assertUnimplemented()
    }
    
    var eventSources: [EventBindingSource] {
        assertUnimplemented()
    }
    
    var gestureType: Any.Type {
        assertUnimplemented()
    }
    
    var relatedAttribute: AnyAttribute {
        assertUnimplemented()
    }
    
    var isValid: Bool {
        assertUnimplemented()
    }
    
    func detachContainer() {
        assertUnimplemented()
    }
    
    override var features: ViewResponder.Features {
        assertUnimplemented()
    }
    
    override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        assertUnimplemented()
    }
    
    override func containsGlobalPoints(_ points: [Point3D], cacheKey: UInt32?, options: ViewResponder.ContainsPointsOptions) -> ViewResponder.ContainsPointsResult {
        assertUnimplemented()
    }
    
    override func addContentPath(to path: inout Path, kind: ContentShapeKinds, in space: CoordinateSpace, observer: (any ContentPathObserver)?) {
        assertUnimplemented()
    }
    
    func addAccessibilityGeometry(to geometry: inout AccessibilityGeometry3D, in space: CoordinateSpace) {
        assertUnimplemented()
    }
    
    override func extendPrintTree(string: inout String) {
        assertUnimplemented()
    }
    
    override func bindEvent(_ type: any EventType) -> ResponderNode? {
        assertUnimplemented()
    }
    
    override func makeGesture(inputs: _GestureInputs) -> _GestureOutputs<Void> {
        assertUnimplemented()
    }
    
    override func resetGesture() {
        assertUnimplemented()
    }
}

extension StyledTextContentView {
    fileprivate struct ArchivedTransitionEnvironment : AsyncAttribute, Rule {
        @Attribute private(set) var view: StyledTextContentView
        @Attribute private(set) var environment: EnvironmentValues
        
        var value: EnvironmentValues {
            assertUnimplemented()
        }
    }
}
