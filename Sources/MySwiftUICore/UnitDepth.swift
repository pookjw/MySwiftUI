package import CoreGraphics

package struct UnitDepth {
    var value: CGFloat
    
    package init(value: CGFloat) {
        self.value = value
    }
    
    package func `in`(_ scale: CGFloat) -> CGFloat {
        assertUnimplemented()
    }
}

extension UnitDepth : Equatable {
    package static func == (a: UnitDepth, b: UnitDepth) -> Bool {
        assertUnimplemented()
    }
}

extension UnitDepth : Hashable {
    package func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
}

extension UnitDepth : Codable {
    package func encode(to encoder: Encoder) throws {
        assertUnimplemented()
    }
    
    package init(from decoder: Decoder) throws {
        assertUnimplemented()
    }
}
