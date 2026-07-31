private import _RealityFoundationPrivate
@testable private import MyRealityFoundation
internal import Testing

struct ComponentInfoPlatformVersionTests {
    @Test func test_init() {
        print(_RealityFoundationPrivate::ComponentInfo.PlatformVersion("1.2.3"))
    }
}
