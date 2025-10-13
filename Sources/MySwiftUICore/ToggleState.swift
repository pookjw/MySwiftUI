#warning("TODO")

package enum ToggleState: UInt, Codable, CaseIterable, Hashable, StronglyHashable, CustomDebugStringConvertible {
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
    
    package var debugDescription: String {
        fatalError("TODO")
    }
    
    package static func stateFor<A, B>(item: A, in: B) where A: Equatable, B: Collection, B.Element == (Binding<A>) -> ToggleState {
        fatalError("TODO")
    }
    
    func hash(into hasher: inout StrongHasher) {
        fatalError("TODO")
    }
}
