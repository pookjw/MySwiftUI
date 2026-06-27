// 1D2E545AD18945D4BEC1B62ADC77D45F
private import AttributeGraph

extension _VariadicView.Tree where Root : DepthAlignmentWritable, Content : View {
    static func makePlatformSubstitutableView(view: _GraphValue<_VariadicView.Tree<Root, Content>>, inputs: _ViewInputs) -> _ViewOutputs {
        /*
         view -> x0 -> w23
         inputs -> x1 -> x26
         */
        if let writer = Content.self as? AnyDepthAlignmentWriter.Type {
            return writer.makeDepthAlignedView(view: view, inputs: inputs)
        } else {
            return Self.makeDebuggableView(view: view, inputs: inputs)
        }
    }
}

protocol DepthAlignmentWritable : _VariadicView_UnaryViewRoot {
    associatedtype DepthAligned : _VariadicView_UnaryViewRoot
    func withDepthAlignment(_ alignment: DepthAlignment) -> DepthAligned
}

fileprivate protocol AnyDepthAlignmentWriter {
    static func makeDepthAlignedView<T : DepthAlignmentWritable, U : View>(view: _GraphValue<_VariadicView.Tree<T, U>>, inputs: _ViewInputs) -> _ViewOutputs
}
