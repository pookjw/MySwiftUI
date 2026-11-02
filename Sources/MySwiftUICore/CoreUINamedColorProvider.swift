package import CoreGraphics
package import CoreUI

package protocol CoreUINamedColorProvider {
    static func effectiveCGColor(cuiColor: CUINamedColor, in environment: EnvironmentValues) -> CGColor?
}
