internal import Spatial
private import MySwiftUICore
internal import UIKit

enum DefaultSizeBehavior {
    static func calculateDefaultSize(_: Size3D, sizingUnit: LengthUnit, hasVolumetricConfiguration: Bool) -> (Size3D, LengthUnit)? {
        assertUnimplemented()
    }
    
    static func sizeInPoints(defaultSize: Size3D, sizingUnit: LengthUnit, scene: UIScene?) -> Size3D {
        assertUnimplemented()
    }
}
