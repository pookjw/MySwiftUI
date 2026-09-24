internal import CoreText

class AnyFontModifier : @unchecked Sendable {
    func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
        // noop
    }
    
    func modify(traits: inout Font.ResolvedTraits) {
        // noop
    }
    
    func isEqual(to other: AnyFontModifier) -> Bool {
        return false
    }
    
    func hash(into hasher: inout Hasher) {
        // noop
    }
    
    var typeID: ObjectIdentifier {
        preconditionFailure() // abtract
    }
    
    var hashValue: Int {
        var hasher = Hasher()
        self.hash(into: &hasher)
        return hasher.finalize()
    }
    
    init() {}
}
