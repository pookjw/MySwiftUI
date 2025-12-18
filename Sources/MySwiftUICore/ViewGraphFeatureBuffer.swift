
@safe struct ViewGraphFeatureBuffer: Collection, CustomDebugStringConvertible {        
    private(set) var contents: UnsafeHeterogeneousBuffer
    
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
        for unsafe element in unsafe contents {
            if unsafe element.type == type {
                return unsafe element.body(as: type)
            }
        }
        return nil
    }
    
    subscript(_ index: UnsafeHeterogeneousBuffer.Index) -> ViewGraphFeatureBuffer.Element {
        _read {
            yield unsafe ViewGraphFeatureBuffer.Element(base: contents[index])
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
    @safe struct Element: ViewGraphFeature {
        private var base: _UnsafeHeterogeneousBuffer_Element
        
        fileprivate init(base: _UnsafeHeterogeneousBuffer_Element) {
            unsafe self.base = base
        }
        
        // 아래 모두 원래 없으며 추정임
        @inlinable
        func modifyViewInputs(inputs: inout _ViewInputs, graph: ViewGraph) {
            unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).modifyViewInputs(elt: base, inputs: &inputs, graph: graph)
        }
        
        @inlinable
        func modifyViewOutputs(outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).modifyViewOutputs(elt: base, outputs: &outputs, inputs: inputs, graph: graph)
        }
        
        @inlinable
        func uninstantiate(graph: ViewGraph) {
            unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).uninstantiate(elt: base, graph: graph)
        }
        
        @inlinable
        func isHiddenForReuseDidChange(graph: ViewGraph) {
            unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).isHiddenForReuseDidChange(elt: base, graph: graph)
        }
        
        @inlinable
        func allowsAsyncUpdate(graph: ViewGraph) -> Bool? {
            return unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).allowsAsyncUpdate(elt: base, graph: graph)
        }
        
        @inlinable
        func needsUpdate(graph: ViewGraph) -> Bool {
            return unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).needsUpdate(elt: base, graph: graph)
        }
        
        @inlinable
        func update(graph: ViewGraph) {
            unsafe base.vtable(as: ViewGraphFeatureBuffer._VTable<Self>.self).update(elt: base, graph: graph)
        }
        
        @inlinable
        var flags: UInt32 {
            get {
                return unsafe base.flags
            }
            nonmutating set {
                unsafe base.flags = newValue
            }
        }
    }
}

extension ViewGraphFeatureBuffer {
    fileprivate class VTable: _UnsafeHeterogeneousBuffer_VTable {
        class func modifyViewInputs(elt: _UnsafeHeterogeneousBuffer_Element, inputs: inout _ViewInputs, graph: ViewGraph) {
            fatalError() // abstract
        }
        
        class func modifyViewOutputs(elt: _UnsafeHeterogeneousBuffer_Element, outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
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
            let new = unsafe elt.body(as: T.self)
            let old = unsafe from.body(as: T.self)
            unsafe new.initialize(to: old.move())
        }
        
        override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
            unsafe elt.body(as: T.self).deinitialize(count: 1)
        }
        
        override class func modifyViewInputs(elt: _UnsafeHeterogeneousBuffer_Element, inputs: inout _ViewInputs, graph: ViewGraph) {
            unsafe elt.body(as: T.self).pointee.modifyViewInputs(inputs: &inputs, graph: graph)
        }
        
        override class func modifyViewOutputs(elt: _UnsafeHeterogeneousBuffer_Element, outputs: inout _ViewOutputs, inputs: _ViewInputs, graph: ViewGraph) {
            unsafe elt.body(as: T.self).pointee.modifyViewOutputs(outputs: &outputs, inputs: inputs, graph: graph)
        }
        
        override class func uninstantiate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        override class func isHiddenForReuseDidChange(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            fatalError("TODO")
        }
        
        override class func needsUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool {
            return unsafe elt.body(as: T.self).pointee.needsUpdate(graph: graph)
        }
        
        override class func allowsAsyncUpdate(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) -> Bool? {
            fatalError("TODO")
        }
        
        override class func update(elt: _UnsafeHeterogeneousBuffer_Element, graph: ViewGraph) {
            unsafe elt.body(as: T.self).pointee.update(graph: graph)
        }
    }
}
