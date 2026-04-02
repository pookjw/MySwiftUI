internal import _UIKitPrivate
internal import UIKit
internal import MySwiftUICore

extension UIColorMaterialRenderingMode {
    init(_materialColorRenderingMode: MaterialColorRenderingMode?) {
        guard let mode = _materialColorRenderingMode else {
            self = .automatic
            return
        }
        
        switch mode {
        case .automatic:
            self = .automatic
        case .adaptiveSystemColors:
            self = .adaptiveSystemColors
        case .adaptiveAllColors:
            self = .adaptiveAllColors
        default:
            self = .automatic
        }
    }
}
