internal import Foundation

package struct StyledTextContentView {
    private(set) var text: ResolvedStyledText
    private(set) var renderer: TextRendererBoxBase?
    private(set) var needsDrawingGroup: Bool
    
    var needsStyledRendering: Bool {
        assertUnimplemented()
    }
    
    // TODO
}

final class ResolvedStyledText {
    let storage: NSAttributedString?
    let archiveOptions: ArchivedViewInput.Value
    
    // TODO
    
    init() {
        assertUnimplemented()
    }
}

class TextRendererBoxBase {
    let environment: EnvironmentValues
    
    init() {
        assertUnimplemented()
    }
}
