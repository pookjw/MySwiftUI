internal import Testing
@testable private import MySwiftUICore

struct MutableBoxTests {
    @Test
    func test() {
        class Context {
            @MutableBox var value: Int = 0
            var __value: MutableBox<Int> { _value }
        }
        
        let context = Context()
        
        context.value += 1
        #expect(context.value == 1)
        #expect(context.__value.wrappedValue == 1)
        
        context.__value.wrappedValue += 1
        #expect(context.value == 2)
        #expect(context.__value.wrappedValue == 2)
        
        let anotherContext = Context()
        #expect(context.__value != anotherContext.__value)
        anotherContext.value = 2
        #expect(context.__value == anotherContext.__value)
    }
}
