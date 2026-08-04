@_spi(Internal) internal import MyRealityFoundation

struct RealityViewComponent : HiddenComponent {
    weak var model: _RealityViewModel?

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        if deinitialize {
            unsafe ref
                .assumingMemoryBound(to: RealityViewComponent.self)
                .deinitialize(count: 1)
        }
        
        unsafe ref
            .assumingMemoryBound(to: RealityViewComponent.self)
            .initialize(to: attribute as! RealityViewComponent)
    }

    @_spi(Internal) public static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    @_spi(Internal) public static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }
}
