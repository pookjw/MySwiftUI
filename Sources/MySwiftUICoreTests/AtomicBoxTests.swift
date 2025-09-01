internal import Testing
@testable private import MySwiftUICore 
private import MySwiftUITestUtils

struct AtomicBoxTests {
    @Test
    func test() async {
        class Context: @unchecked Sendable {
            @AtomicBox var value: Int = 0
        }
        
        let context = Context()
        let count = 300
        
        let tasks = (0..<count)
            .map { _ in
                return Task {
                    await executeBlock {
                        context.value += 1
                    }
                }
            }
        
        for task in tasks {
            await task.value
        }
        
        #expect(context.value == count)
    }
}
