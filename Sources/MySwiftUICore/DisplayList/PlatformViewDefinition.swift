// TODO: SwiftUI.UIViewPlatformViewDefinition
// SwiftUI(Core).CAHostingLayerPlatformDefinition
package class PlatformViewDefinition {
    package static func setAllowsWindowActivationEvents(_ flag: Bool?, for object: Swift.AnyObject) {
        fatalError("TODO")
    }
    
    package static func setHitTestsAsOpaque(_ flag: Bool, for object: AnyObject) {
        fatalError("TODO")
    }
}

extension PlatformViewDefinition {
    package enum ViewKind: Hashable {
        case inherited
        case color
        case image
        case shape
        case shadow
        case backdrop
        case chamelonColor
        case drawing
        case compositing
        case geometry
        case projection
        case affine3D
        case mask
        case platformView
        case platformGroup
        case platformLayer
        case platformEffect
        
        package var isContainer: Bool {
            /*
             ldrb   w8, [x20]
             (중략)
             mov    w10, #0x5f01
             movk   w10, #0x1, lsl #16
             -> w10의 앞 4바이트를 유지하고 0x1 << 16과 합침 = 0x15f01
             lsr    w8, w10, w8
             -> w10을 w8 만큼 오른쪽으로 shift
             -> w0 = 0x000015f01 = 00000000 00000001 01011111 00000001
             -> 마지막 1 byte만 읽어옴
             */
            switch self {
            case .inherited, .compositing, .geometry, .projection, .affine3D, .mask, .platformGroup, .platformEffect:
                return true
            case .color, .image, .shape, .shadow, .backdrop, .chamelonColor, .drawing, .platformView, .platformLayer:
                return false
            }
        }
    }
}
