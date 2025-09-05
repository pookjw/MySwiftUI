#warning("TODO")

struct ViewGraphFeatureBuffer {
    private var contents: UnsafeHeterogeneousBuffer
    
    init(contents: UnsafeHeterogeneousBuffer) {
        self.contents = contents
    }
    
    mutating func append<T: ViewGraphFeature>(feature: T) {
        contents.append(feature, vtable: _VTable.self)
    }
}

extension ViewGraphFeatureBuffer {
    fileprivate class VTable: _UnsafeHeterogeneousBuffer_VTable {
        
    }
    
    fileprivate class _VTable: VTable {
        override class var type: any Any.Type {
            fatalError("TODO")
        }
        
        override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        static func modifyViewInputs(elt: _UnsafeHeterogeneousBuffer_Element, inputs: _ViewInputs, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        static func modifyViewOutputs(elt: _UnsafeHeterogeneousBuffer_Element, outputs: _ViewOutputs, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        static func uninstantiate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        static func needsUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool {
            fatalError("TODO")
        }
        
        static func allowsAsyncUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool? {
            fatalError("TODO")
        }
        
        static func update(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
    }
}
