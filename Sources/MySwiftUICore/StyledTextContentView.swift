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
    
    // TODO
    
    init() {
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
    
    func draw(in: CGRect, with: CGSize, applyingMarginOffsets: Bool, containsResolvable: Bool, context: TextDrawingContext, renderer: TextRendererBoxBase?) {
        assertUnimplemented()
    } 
}

class TextRendererBoxBase {
    let environment: EnvironmentValues
    
    init() {
        assertUnimplemented()
    }
}

extension ResolvedStyledText : CustomStringConvertible {
    var description: String {
        assertUnimplemented()
    }
}
