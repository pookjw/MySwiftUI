internal import Foundation

package struct StyledTextContentView {
    private(set) var text: ResolvedStyledText
    private(set) var renderer: TextRendererBoxBase?
    private(set) var needsDrawingGroup: Bool
    
    // TODO
}

class ResolvedStyledText {
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
    var description: String {
        assertUnimplemented()
    }
}

enum ResolvedTextSuffix {
    // TODO
}
