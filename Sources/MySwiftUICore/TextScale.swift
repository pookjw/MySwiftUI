// 79720809E5A651AB68A3B395B3EE1A73

extension Text {
    @available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, *)
    public struct Scale : Sendable, Hashable {
        public static let `default`: Self = { assertUnimplemented() }()
        public static let secondary: Self = { assertUnimplemented() }()
    }
}

extension Text.Scale {
    enum Storage : Hashable, Codable {
        case `default`
        case secondary
        
        init(from decoder: any Decoder) throws {
            assertUnimplemented()
        }
        
        func encode(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
    }
}
