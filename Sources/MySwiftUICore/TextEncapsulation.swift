// 3CCB4DBB323B4F65E75C0FA5480180C6
private import CoreGraphics

extension Text {
    struct Encapsulation : Hashable, CodableByProxy {
        private var scale: Text.Encapsulation.Scale?
        private var shape: Text.Encapsulation.Shape?
        private var style: Text.Encapsulation.Style?
        private var lineWeight: CGFloat?
        private var color: Color?
        private var minimumWidth: CGFloat?
        private var platterSize: Text.Encapsulation.PlatterSize?
        
        static func == (lhs: Text.Encapsulation, rhs: Text.Encapsulation) -> Bool {
            assertUnimplemented()
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: Decoder) throws -> Text.Encapsulation {
            assertUnimplemented()
        }
        
        var codingProxy: CodingProxy {
            assertUnimplemented()
        }
        
        static func unwrap(codingProxy: CodingProxy) -> Text.Encapsulation {
            assertUnimplemented()
        }
    }
}

extension Text.Encapsulation {
    struct CodingProxy : CodableProxy {
        // TODO
        
        var base: Text.Encapsulation {
            assertUnimplemented()
        }
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
}
