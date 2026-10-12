internal import Foundation

package struct StyledTextContentView {
    private(set) var text: ResolvedStyledText
    
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
