#warning("TODO")
internal import UIKit
internal import MySwiftUICore

class TooltipBridge: NSObject {
    weak var host: ViewRendererHost? = nil
    var hasTooltipSeed: VersionSeed = .empty
    var tooltipInteraction: UIToolTipInteraction? = nil
    
    // inlined from $s7SwiftUI14_UIHostingViewC04rootD0ACyxGx_tcfcTf4gn_n
    // 원래 없음
    @inlinable
    func addPreferences(to viewGraph: ViewGraph) {
        viewGraph.addPreference(HasTooltipKey.self)
    }
}

extension TooltipBridge: UIToolTipInteractionDelegate {
    @objc(toolTipInteraction:configurationAtPoint:) func _toolTipInteraction(_ interaction: UIToolTipInteraction, configurationAt point: CGPoint) -> UIToolTipConfiguration? {
        fatalError("TODO")
    }
}
