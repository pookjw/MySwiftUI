#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class TooltipBridge: NSObject {
    weak var host: ViewRendererHost? = nil
    var hasTooltipSeed: VersionSeed = .empty
    var tooltipInteraction: UIToolTipInteraction? = nil
}

extension TooltipBridge: UIToolTipInteractionDelegate {
    @objc(toolTipInteraction:configurationAtPoint:) func _toolTipInteraction(_ interaction: UIToolTipInteraction, configurationAt point: CGPoint) -> UIToolTipConfiguration? {
        fatalError("TODO")
    }
}
