// 8E1DB939D259D2398F9C69CD6CEBF23D
internal import CoreText

protocol StaticFontModifier {
    static var tag: Font.StaticModifierTag { get }
    static func modify(descriptor: inout CTFontDescriptor, in context: Font.Context)
    static func modify(traits: inout Font.ResolvedTraits)
}

extension Font {
    enum StaticModifierTag {
        // TODO
    }
}
