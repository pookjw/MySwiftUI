// 3C93C430CC5ED2F702DA0C4F8C84B538
internal import CoreText

struct CodablePlatformFont : Codable, Hashable {
    var base: CTFont
    
    func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
}
