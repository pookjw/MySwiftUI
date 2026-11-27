
package enum ToggleState : UInt, Codable, CaseIterable, Hashable, StronglyHashable, CustomDebugStringConvertible, PubliclyEncodable {
    case on
    case off
    case mixed
    
    package init(_ value: Bool) {
        self = (value ? .on : .off)
    }
    
    package mutating func toggle() {
        switch self {
        case .on:
            self = .off
        default:
            self = .on
        }
    }
    
    struct PublicEncoding : Encodable {
        private var state: ToggleState

        func encode(to encoder: Encoder) throws {
            assertUnimplemented()
        }

        enum Keys : String, CodingKey, Hashable, CustomStringConvertible, CustomDebugStringConvertible {
            case on
            case off
            case mixed

            var description: String {
                assertUnimplemented()
            }
            
            var debugDescription: String {
                assertUnimplemented()
            }
        }
        
        fileprivate struct EmptyPayload : Codable {
        }
    }
    
    var publicEncoding: PublicEncoding {
        assertUnimplemented()
    }
    
    package var debugDescription: String {
        assertUnimplemented()
    }
    
    package static func stateFor<A, B>(item: A, in: B) where A : Equatable, B : Collection, B.Element == (Binding<A>) -> ToggleState {
        assertUnimplemented()
    }
    
    func hash(into hasher: inout StrongHasher) {
        assertUnimplemented()
    }
}
