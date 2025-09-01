internal import Testing
@testable private import MySwiftUICore

struct WeakBoxTests {
    @Test
    func test() async {
        class Context {}
        
        let context = Context()
        let box = WeakBox(context)
        
        #expect(box.base != nil)
        _ = consume context
        #expect(box.base == nil)
    }
}
