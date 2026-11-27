public import CoreGraphics
internal import AttributeGraph

enum GestureDebug {
    fileprivate indirect enum ChildrenBox {
        case value(ArrayWith2Inline<GestureDebug.Data>)
    }

    enum Kind : Hashable {
        case empty
        case gesture
        case combiner
        case modifier
        case primitive
    }

    struct Data {
        var kind: GestureDebug.Kind
        var type: Any.Type
        private(set) var children: ArrayWith2Inline<GestureDebug.Data> {
            get {
                assertUnimplemented()
            }
            set {
                assertUnimplemented()
            }
        }
        var phase: GesturePhase<()>
        var attribute: AnyOptionalAttribute
        var resetSeed: UInt32
        var frame: CGRect
        private(set) var properties: ArrayWith2Inline<(String, String)>
        private var childrenBox: GestureDebug.ChildrenBox

        init() {
            assertUnimplemented()
        }

        init(kind: GestureDebug.Kind, type: Any.Type, children: ArrayWith2Inline<GestureDebug.Data>, phase: GesturePhase<()>, attribute: AnyAttribute?, resetSeed: UInt32, frame: CGRect, properties: ArrayWith2Inline<(String, String)>) {
            assertUnimplemented()
        }

        func printTree() {
            assertUnimplemented()
        }
        
        fileprivate struct Indent {
            // TODO
        }

        fileprivate func printSubtree(parent: GestureDebug.Data?, indent: Indent) {
            assertUnimplemented()
        }
        
        fileprivate func frameDescription(relativeTo parent: GestureDebug.Data?) -> String {
            assertUnimplemented()
        }

        static var defaultValue: GestureDebug.Data {
            assertUnimplemented()
        }
    }
}

extension _GestureOutputs {
    func wrapDebugOutputs<Wrapped>(_ type: Wrapped.Type, properties: Attribute<ArrayWith2Inline<(String, String)>>?, inputs: _GestureInputs) {
        assertUnimplemented()
    }
    
    func wrapDebugOutputs<Wrapped, A, B>(_ type: Wrapped.Type, kind: GestureDebug.Kind, properties: Attribute<ArrayWith2Inline<(String, String)>>?, inputs: _GestureInputs, combiningOutputs: (_GestureOutputs<A>, _GestureOutputs<B>)) {
        assertUnimplemented()
    }
    
    fileprivate func reallyWrap<Wrapped>(_ type: Wrapped.Type, kind: GestureDebug.Kind, properties: Attribute<ArrayWith2Inline<(String, String)>>?, inputs: _GestureInputs, data: (Attribute<GestureDebug.Data>?, Attribute<GestureDebug.Data>?)) {
        assertUnimplemented()
    }
}

func printGestures(data: @autoclosure () -> GestureDebug.Data?, host: AnyObject?) {
    assertUnimplemented()
}
