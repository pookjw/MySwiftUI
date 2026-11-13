// 8E1DB939D259D2398F9C69CD6CEBF23D
internal import CoreText

protocol StaticFontModifier {
    static var tag: Font.StaticModifierTag { get }
    static func modify(descriptor: inout CTFontDescriptor, in context: Font.Context)
    static func modify(traits: inout Font.ResolvedTraits)
}

final class AnyStaticFontModifier<T : StaticFontModifier> : AnyFontModifier, @unchecked Sendable {
    override func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
        assertUnimplemented()
    }

    override func modify(traits: inout Font.ResolvedTraits) {
        assertUnimplemented()
    }

    override func isEqual(to other: AnyFontModifier) -> Bool {
        assertUnimplemented()
    }

    override func hash(into hasher: inout Hasher) {
        assertUnimplemented()
    }
    
    override var typeID: ObjectIdentifier {
        assertUnimplemented()
    }
}

extension Font {
    struct BoldModifier : UndoableStaticFontModifier {
        static var tag: Font.StaticModifierTag {
            assertUnimplemented()
        }
        
        static func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
            assertUnimplemented()
        }
        
        static func modify(traits: inout Font.ResolvedTraits) {
            assertUnimplemented()
        }
        
        static var undoableTag: Font.UndoableStaticModifierTag {
            assertUnimplemented()
        }
        
        static func undo(descriptor: inout CTFontDescriptor, in context: Font.Context) {
            assertUnimplemented()
        }
        
        static func undo(traits: inout Font.ResolvedTraits) {
            assertUnimplemented()
        }
    }
    
    enum StaticModifierTag {
        // TODO
    }
    
    struct ItalicModifier: UndoableStaticFontModifier {
        static var tag: Font.StaticModifierTag {
            assertUnimplemented()
        }
        
        static func modify(descriptor: inout CTFontDescriptor, in context: Font.Context) {
            assertUnimplemented()
        }
        
        static func modify(traits: inout Font.ResolvedTraits) {
            assertUnimplemented()
        }
        
        static var undoableTag: Font.UndoableStaticModifierTag {
            assertUnimplemented()
        }
        
        static func undo(descriptor: inout CTFontDescriptor, in context: Font.Context) {
            assertUnimplemented()
        }
        
        static func undo(traits: inout Font.ResolvedTraits) {
            assertUnimplemented()
        }
    }
    
    enum UndoableStaticModifierTag {
        case bold
        case italic
        case monospaced
    }
}

extension StaticFontModifier {
    static func modify(traits: inout Font.ResolvedTraits) {
        assertUnimplemented()
    }
}

protocol UndoableStaticFontModifier : StaticFontModifier {
    static var undoableTag: Font.UndoableStaticModifierTag { get }
    static func undo(descriptor: inout CTFontDescriptor, in context: Font.Context)
    static func undo(traits: inout Font.ResolvedTraits)
}

extension UndoableStaticFontModifier {
    static var tag: Font.StaticModifierTag {
        assertUnimplemented()
    }
    
    static func undo(traits: inout Font.ResolvedTraits) {
        assertUnimplemented()
    }
}
