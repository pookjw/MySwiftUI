@_spi(Internal) internal import MySwiftUICore
internal import CoreGraphics
internal import UIKit

protocol HitTestingLeafPlatformView : AnyObject {
    var boundsForHitTesting: CGRect { get }
    var foreignSubviewsForHitTesting: [UIView] { get }
    var isTransparentForHitTesting: Bool { get }
    var responderForHitTesting: ViewResponder? { get }
    var usesResponderForHitTesting: Bool { get }
}
