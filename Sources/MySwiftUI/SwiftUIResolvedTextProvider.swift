internal import UIKit
internal import MySwiftUICore

struct SwiftUIResolvedTextProvider : ResolvedTextProvider {
    static func defaultLinkColor(for environment: EnvironmentValues) -> Color {
        assertUnimplemented()
    }
    
    static func updateWidgetTextAttachment(_ attachment: NSTextAttachment, namedImage: Image.NamedResolved) {
        assertUnimplemented()
    }
}
