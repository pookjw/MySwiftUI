internal import MySwiftUICore

struct LazyView<T : View>: View {
    @safe nonisolated(unsafe) private(set) var content: () -> T
    
    var body: T {
        return content()
    }
}
