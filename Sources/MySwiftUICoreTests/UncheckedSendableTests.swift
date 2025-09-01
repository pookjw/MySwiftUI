internal import Testing
@testable private import MySwiftUICore

struct UncheckedSendableTests {
    @Test
    func test() async {
        @_nonSendable class NonSendableContext {
            var number = 0
        }
        
        let box = UncheckedSendable(NonSendableContext())
        
        await Task { @Sendable in
            box.value.number += 1
        }.value
        
        #expect(box.value.number == 1)
    }
}
