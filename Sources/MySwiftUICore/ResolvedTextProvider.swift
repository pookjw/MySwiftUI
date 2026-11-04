package import UIKit

package protocol ResolvedTextProvider {
    static func defaultLinkColor(for environment: EnvironmentValues) -> Color
    static func updateWidgetTextAttachment(_ attachment: NSTextAttachment, namedImage: Image.NamedResolved)
}
