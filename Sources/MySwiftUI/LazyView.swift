internal import MySwiftUICore

struct LazyView<T: View>: View {
    @safe private(set) nonisolated(unsafe) var content: () -> T
    
    var body: T {
        _ = assertUnimplemented() // 검증
        return content()
    }
}
