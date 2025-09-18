#warning("TODO")

struct ViewGraphFeatureBuffer: Collection, CustomDebugStringConvertible {        
    private var contents: UnsafeHeterogeneousBuffer
    
    init(contents: UnsafeHeterogeneousBuffer) {
        self.contents = contents
    }
    
    mutating func append<T: ViewGraphFeature>(feature: T) {
        contents.append(feature, vtable: _VTable<T>.self)
    }
    
    func index(after index: UnsafeHeterogeneousBuffer.Index) -> UnsafeHeterogeneousBuffer.Index {
        return contents.index(after: index)
    }
    
    subscript<T: ViewGraphFeature>(_ type: T.Type) -> UnsafeMutablePointer<T>? {
        for element in contents {
            if element.type == type {
                return element.body(as: type)
            }
        }
        return nil
    }
    
    subscript(_ index: UnsafeHeterogeneousBuffer.Index) -> ViewGraphFeatureBuffer.Element {
        _read {
            yield ViewGraphFeatureBuffer.Element(base: contents[index])
        }
    }
    
    var startIndex: UnsafeHeterogeneousBuffer.Index {
        return contents.startIndex
    }
    
    var endIndex: UnsafeHeterogeneousBuffer.Index {
        return contents.endIndex
    }
    
    var count: Int {
        return contents.count
    }
    
    var isEmpty: Bool {
        return contents.isEmpty
    }
    
    private var featureTypes: [Any.Type] {
        fatalError("TODO")
    }
    
    var debugDescription: String {
        fatalError("TODO")
    }
}

extension ViewGraphFeatureBuffer {
    struct Element: ViewGraphFeature {
        private var base: _UnsafeHeterogeneousBuffer_Element
        
        fileprivate init(base: _UnsafeHeterogeneousBuffer_Element) {
            self.base = base
        }
        
        // 아래 모두 원래 없으며 추정임
        @inlinable
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).modifyViewInputs(elt: base, inputs: inputs, graph: graph)
        }
        
        @inlinable
        func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).modifyViewOutputs(elt: base, outputs: outputs, inputs: inputs, graph: graph)
        }
        
        @inlinable
        func uninstantiate(graph: ViewGraph) {
            base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).uninstantiate(elt: base, graph: graph)
        }
        
        @inlinable
        func isHiddenForReuseDidChange(graph: ViewGraph) {
            base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).isHiddenForReuseDidChange(elt: base, graph: graph)
        }
        
        @inlinable
        func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
            return base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).allowsAsyncUpdate(elt: base, graph: graph)
        }
        
        @inlinable
        func needsUpdate(graph: ViewGraph) -> Bool {
            return base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).needsUpdate(elt: base, graph: graph)
        }
        
        @inlinable
        func update(graph: ViewGraph) {
            base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).update(elt: base, graph: graph)
        }
        
        @inlinable
        var flags: UInt32 {
            get {
                return base.flags
            }
            nonmutating set {
                base.flags = newValue
            }
        }
    }
}

extension ViewGraphFeatureBuffer {
    fileprivate class VTable: _UnsafeHeterogeneousBuffer_VTable {
        class func modifyViewInputs(elt: _UnsafeHeterogeneousBuffer_Element, inputs: _ViewInputs, graph: ViewGraph) {
            fatalError() // abstract
        }
        
        class func modifyViewOutputs(elt: _UnsafeHeterogeneousBuffer_Element, outputs: _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            fatalError() // abstract
        }
        
        class func uninstantiate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError() // abstract
        }
        
        class func isHiddenForReuseDidChange(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError() // abstract
        }
        
        class func needsUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool {
            fatalError() // abstract
        }
        
        class func allowsAsyncUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool? {
            fatalError() // abstract
        }
        
        class func update(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError() // abstract
        }
    }
    
    fileprivate final class _VTable<T: ViewGraphFeature>: VTable {
        override class var type: any Any.Type {
            return T.self
        }
        
        override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
            let new = elt.body(as: T.self)
            let old = from.body(as: T.self)
            new.initialize(to: old.move())
        }
        
        override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
            fatalError("TODO")
        }
        
        override class func modifyViewInputs(elt: _UnsafeHeterogeneousBuffer_Element, inputs: _ViewInputs, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        override class func modifyViewOutputs(elt: _UnsafeHeterogeneousBuffer_Element, outputs: _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        override class func uninstantiate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        override class func isHiddenForReuseDidChange(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        override class func needsUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool {
            fatalError("TODO")
        }
        
        override class func allowsAsyncUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool? {
            fatalError("TODO")
        }
        
        override class func update(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
    }
}
