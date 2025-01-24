import Testing
import QuartzCore
@testable import MySwiftUICore

struct MySwiftUICoreTests {
    @Test func test() {
        _test()
    }
}

private func _test() {
    print(MemoryLayout<DisplayList.Item.Value>.size)
    print(MemoryLayout<DisplayList.Content>.size)
    print(MemoryLayout<(DisplayList.Effect, DisplayList)>.size)
    print(MemoryLayout<[(StrongHash, DisplayList)]>.size)
    print(MemoryLayout<CGRect>.stride) // 0x20 (32)
    print(MemoryLayout<DisplayList.Version>.stride) // 0x8 (8)
    print(MemoryLayout<DisplayList.Item.Value>.stride) // 0x10 (16)
//    print(MemoryLayout<_DisplayList_Identity>.stride) // 0x4 (4)
}
