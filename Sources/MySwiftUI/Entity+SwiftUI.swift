internal import RealityKit
private import CoreRE

extension RealityKit::Entity.ChildCollection {
    func forEach(recursive: Bool, using block: (RealityKit::Entity) -> Void) {
        /*
         recursive -> w0 -> w22
         block -> x1/x2 -> x21/x19
         */
        // <+160>
        var iterator = self.makeIterator()
        
        while let child = iterator.next() {
            block(child)
            
            if recursive {
                child.children.forEach(recursive: true, using: block)
            }
        }
    }
}

extension OpaquePointer {
    var name: String {
        get {
            assertUnimplemented()
        }
        nonmutating set {
            newValue.withCString { pointer in
                unsafe unsafeBitCast(self, to: CoreRE::Entity.self).name = pointer
            }
        }
    }
}
