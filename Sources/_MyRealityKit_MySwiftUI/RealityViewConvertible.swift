internal import MySwiftUICore
internal import MyRealityFoundation
internal import UIKit
internal import Spatial

struct RealityViewConvertibleKey : PreferenceKey {
    @safe static nonisolated(unsafe) let defaultValue: [RealityViewConvertible] = []
    
    static func reduce(value: inout Value, nextValue: () -> Value) {
        assertUnimplemented()
    }
}

struct RealityViewConvertible : Equatable {
    let base: MyRealityFoundation.Entity
    let proxy: any GeometryProxy3DTestProtocol
    let role: UISceneSession.Role?
    
    static func == (lhs: RealityViewConvertible, rhs: RealityViewConvertible) -> Bool {
        assertUnimplemented()
    }
}

protocol GeometryProxy3DTestProtocol {
    var size: Size3D { get }
    func frame(in coordinateSpace: CoordinateSpace) -> Rect3D
    func transform<T : CoordinateSpaceProtocol>(in coordinateSpace: T) -> AffineTransform3D?
}

extension GeometryProxy3D : GeometryProxy3DTestProtocol {}
