// DE681AB5F1A334FA14ECABDE70CB1955
private import AttributeGraph

@frozen public struct TupleView<T>: View {
    public nonisolated var value: T
    
    @inlinable public nonisolated init(_ value: T) {
        self.value = value
    }
    
    public static nonisolated func _makeView(view: _GraphValue<TupleView<T>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         return pointer -> x19
         view -> w21
         */
        // sp + 0xf0
        let copy_1 = inputs
        // sp + 0x80
        let typeDescription = ViewDescriptor.tupleDescription(TupleType(T.self))
        let count = typeDescription.contentTypes.count
        
        if count == 0 {
            // <+120>
            return _ViewOutputs()
        } else if count == 1 {
            // <+156>
            // sp + 0x88
            let copy_2 = copy_1
            var unary = MakeUnary(view: view, inputs: inputs, outputs: nil)
            typeDescription.contentTypes[0].1.visitType(visitor: &unary)
            return unary.outputs!
        } else {
            // <+368>
            // sp + 0x80
            let copy_2 = copy_1
            return makeImplicitRoot(view: view, inputs: copy_2)
        }
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<TupleView<T>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         view -> w23
         inputs -> x1
         */
        // sp + 0x98
        let tupleDescription = ViewDescriptor.tupleDescription(TupleType(T.self))
        // x25
        let options = inputs.options
        // sp + 0x10
        let copy_1 = inputs
        // view -> sp + 0x98
        // sp + 0xa0
        var copy_2 = copy_1
        
        // sp + 0x98
        var makeList = MakeList(
            view: view,
            inputs: copy_2,
            index: 0,
            offset: 0,
            wrapChildren: options.contains(.tupleViewCreatesUnaryElements),
            includeOffsets: options.contains(.requiresContentOffsets),
            outputs: []
        )
        
        if options.contains(.tupleViewCreatesUnaryElements) {
            copy_2.options.subtract(.tupleViewCreatesUnaryElements)
        }
        
        // <+168>
        for contentType in tupleDescription.contentTypes {
            // <+176>
            // sp + 0x98
            makeList.index = contentType.0
            makeList.offset = TupleType(T.self).offset(at: contentType.0, as: contentType.1.type)
            contentType.1.visitType(visitor: &makeList)
        }
        
        // <+264>
        // sp + 0x10
        let copy_3 = copy_2
        return _ViewListOutputs.concat(makeList.outputs, inputs: copy_3)
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
    
    public var body: Never {
        bodyError()
    }
}

@available(*, unavailable)
extension TupleView : Sendable {
}

extension TupleView {
    fileprivate struct MakeUnary: ViewTypeVisitor {
        private(set) var view: _GraphValue<TupleView<T>>
        private(set) var inputs: _ViewInputs
        private(set) var outputs: _ViewOutputs?
        
        mutating func visit<Content: View>(type: Content.Type) {
            fatalError("TODO")
        }
    }
    
    fileprivate struct MakeList: ViewTypeVisitor {
        private(set) var view: _GraphValue<TupleView<T>>
        private(set) var inputs: _ViewListInputs
        var index: Int
        var offset: Int
        let wrapChildren: Bool
        let includeOffsets: Bool
        private(set) var outputs: [_ViewListOutputs]
        
        mutating func visit<Content: View>(type: Content.Type) {
            // $s7SwiftUI12TupleContentVAARvzAA4ViewRzlE8MakeList33_99F7483FD5E72B0CC96AAE11DAE05002LLV5visit4typeyqd__m_tAaDRd__lF
            fatalError("TODO")
        }
    }
}
