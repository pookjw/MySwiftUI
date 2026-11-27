struct ClippingExceptionComponent : Component {
    init() {
        assertUnimplemented()
    }

    @MainActor @preconcurrency static func __fromCore(_ coreComponent: __ComponentRef) -> ClippingExceptionComponent {
        assertUnimplemented()
    }

    @MainActor @preconcurrency func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }

    static var componentName: String {
        get {
            assertUnimplemented()
        }
    }

    static func __load(from ref: UnsafeRawPointer) {
        assertUnimplemented()
    }

    static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int, deinitialize: Bool) {
        assertUnimplemented()
    }

    static func __store(attribute: any MyRealityFoundation::Component, to ref: UnsafeMutableRawPointer, offset: Int) {
        assertUnimplemented()
    }

    static var __coreComponentType: __ComponentTypeRef {
        assertUnimplemented()
    }

    static func __load(from ref: UnsafeRawPointer, offset: Int) -> any MyRealityFoundation::Component {
        assertUnimplemented()
    }

    static var coreComponentType: CoreComponentType {
        return CoreComponentType(originType: .custom)
    }
}
