// 25811D44B7BE5E768C1CBA33158F398B
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

extension EnvironmentValues {
    var fontModifiers: [AnyFontModifier] {
        get {
            return self[FontModifiersKey.self]
        }
        set {
            self[FontModifiersKey.self] = newValue
        }
    }
}

fileprivate struct FontModifiersKey : EnvironmentKey {
    static var defaultValue: [AnyFontModifier] {
        return []
    }
}
