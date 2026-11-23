// 641995D812913A47B866B20B88782376
internal import Foundation
package import Spatial
package import CoreGraphics
internal import AttributeGraph

package struct StyledTextContentView : UnaryView, PrimitiveView, ShapeStyledLeafView {
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
        assertUnimplemented()
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
