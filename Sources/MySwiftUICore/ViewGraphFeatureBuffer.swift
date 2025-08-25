#warning("TODO")

struct ViewGraphFeatureBuffer {
    private var contents: UnsafeHeterogeneousBuffer
    
    init(contents: UnsafeHeterogeneousBuffer) {
        self.contents = contents
    }
}
