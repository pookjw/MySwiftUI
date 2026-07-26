internal import MyRealityFoundation

struct RealityViewComponent : HiddenComponent {
    weak var model: _RealityViewModel?

    package static var __coreComponentType: __ComponentTypeRef {
        assertUnimplemented()
    }
}
