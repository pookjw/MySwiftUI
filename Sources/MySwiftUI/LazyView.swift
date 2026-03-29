internal import MySwiftUICore

struct LazyView<T: View>: View {
    @safe private(set) nonisolated(unsafe) var content: () -> T
    
    var body: T {
        return content()
    }
}
