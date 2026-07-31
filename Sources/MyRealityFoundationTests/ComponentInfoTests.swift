private import _RealityFoundationPrivate
@testable @_spi(Internal) private import MyRealityFoundation
internal import Testing
private import RealityKit

struct ComponentInfoTests {
    @Test func test_init() {
        let original = unsafe _RealityFoundationPrivate::ComponentInfo(
            bundleIdentifier: "Test",
            type: NativeComponent.self,
            reComponentClass: nil,
            access: .api,
            availability: _RealityFoundationPrivate::ComponentInfo.Availability(
                introduced: [],
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        let impl = unsafe MyRealityFoundation::ComponentInfo(
            bundleIdentifier: "Test",
            type: ImplComponent.self,
            reComponentClass: nil,
            access: .api,
            availability: MyRealityFoundation::ComponentInfo.Availability(
                introduced: [],
                deprecated: nil,
                obsoleted: nil
            )
        )
        
        #expect(compare(original, impl))
    }
}

extension ComponentInfoTests {
    struct AvailabilityTests {
        // TODO
    }
}

fileprivate struct NativeComponent : RealityKit::Component {
}

fileprivate struct ImplComponent : MyRealityFoundation::Component {
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo,
    _ impl: MyRealityFoundation::ComponentInfo
) -> Bool {
    return (original.bundleIdentifier == impl.bundleIdentifier) &&
    (original.reComponentClass == impl.reComponentClass) &&
    compare(original.access, impl.access) &&
    compare(original.availability, impl.availability)
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.Access,
    _ impl: MyRealityFoundation::ComponentInfo.Access
) -> Bool {
    switch (original, impl) {
    case (.`internal`, .`internal`):
        return true
    case (.spi, .spi):
        return true
    case (.api, .api):
        return true
    default:
        return false
    }
}

fileprivate func compare(
    _ original: _RealityFoundationPrivate::ComponentInfo.Availability,
    _ impl: MyRealityFoundation::ComponentInfo.Availability
) -> Bool {
    fatalError("TODO")
}
