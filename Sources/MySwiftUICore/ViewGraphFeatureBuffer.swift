#warning("TODO")

struct ViewGraphFeatureBuffer {
    private var contents: UnsafeHeterogeneousBuffer
    
    init(contents: UnsafeHeterogeneousBuffer) {
        self.contents = contents
    }
    
    func append<T: ViewGraphFeature>(feature: T) {
        contents.append(feature, vtable: _VTable.self)
    }
}

extension ViewGraphFeatureBuffer {
    fileprivate class VTable: _UnsafeHeterogeneousBuffer_VTable {
        
    }
    
    fileprivate class _VTable: VTable {
        
    }
}
