// 99F7483FD5E72B0CC96AAE11DAE05002

struct TupleContent<each V> : View where repeat each V : View {
    private var content: (repeat each V)
    
    var body: Never {
        assertUnimplemented()
    }
}