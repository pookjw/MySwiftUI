internal import Testing
@testable private import MySwiftUICore

struct WeakUncheckedSendableTests {
    @Test
    func test() async {
        @_nonSendable class NonSendableContext {}
        
        let context = NonSendableContext()
        let box = WeakUncheckedSendable(context)
        
        let task = Task { @Sendable in
            return (box.value == nil)
        }
        
        _ = consume context
        let result = await task.value
        #expect(result)
    }
}
