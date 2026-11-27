// 2F4F6F37FC99B226E8F8E01317E236EE
extension Font {
    struct StyleDefinition : Codable {
        var style: Font.TextStyle
        var design: Font.Design?
        var weight: Font.Weight?
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
    }
    
    struct PrivateStyleDefinition : Codable {
        private var style: String
        private var design: String?
        @ProxyCodable private var weight: Font.Weight?
        
        fileprivate enum CodingKeys : String, CodingKey {
            case style
            case design
            case weight
        }
    }
}
