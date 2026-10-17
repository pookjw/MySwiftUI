public import CoreGraphics
internal import AttributeGraph

enum GestureDebug {
    enum Kind : Equatable, Hashable {
        case empty
        case gesture
        case combiner
        case modifier
        case primitive
    }

    struct Data {
        var kind: GestureDebug.Kind
        var type: Any.Type
        var children: [GestureDebug.Data]
        var phase: GesturePhase<()>
        var attribute: AnyOptionalAttribute
        var resetSeed: UInt32
        var frame: CGRect
        var properties: [(String, String)]

        init() {
            assertUnimplemented()
        }

        init(kind: GestureDebug.Kind, type: Any.Type, children: [GestureDebug.Data], phase: GesturePhase<()>, attribute: AnyOptionalAttribute?, resetSeed: UInt32, frame: CGRect, properties: [(String, String)]) {
            assertUnimplemented()
        }

        func printTree() {
            assertUnimplemented()
        }

        static var defaultValue: GestureDebug.Data {
            assertUnimplemented()
        }
    }
}