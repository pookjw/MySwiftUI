public import Foundation
package import CoreGraphics

@frozen public struct Text: Equatable, Sendable {
    @usableFromInline
    @frozen package enum Storage : Equatable {
        case verbatim(String)
//        case anyTextStorage(AnyTextStorage)
        
        @usableFromInline
        package static func == (lhs: Text.Storage, rhs: Text.Storage) -> Bool {
            fatalError("TODO")
        }
    }
    
    @usableFromInline
    @frozen package enum Modifier : Equatable {
//        case color(Color?)
//        case font(Font?)
//        case italic
//        case weight(Font.Weight?)
//        case kerning(CGFloat)
//        case tracking(CGFloat)
//        case baseline(CGFloat)
//        case rounded
//        case anyTextModifier(AnyTextModifier)
        
        @usableFromInline
        package static func == (lhs: Text.Modifier, rhs: Text.Modifier) -> Bool {
            fatalError("TODO")
        }
    }
    
    @usableFromInline
    package var storage: Text.Storage
    @usableFromInline
    package var modifiers: [Text.Modifier] = [Modifier]()
    
    @inlinable public init(verbatim content: String) {
        storage = .verbatim(content)
    }
    
    @_disfavoredOverload public init<S>(_ content: S) where S : StringProtocol {
        fatalError("TODO")
    }
    
    package func resolveString(in environment: EnvironmentValues, with options: Text.ResolveOptions = [], idiom: AnyInterfaceIdiom?) -> String {
        fatalError("TODO")
    }
    
    package func assertUnstyled(_ text: String, options: Text.ResolveOptions = []) {
        fatalError("TODO")
    }
}

extension Text: View {
    public var body: Never {
        fatalError("TODO")
    }
}

@available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
extension Text {
    @available(iOS 16.0, macOS 13, tvOS 16.0, watchOS 9.0, *)
    @_disfavoredOverload public init(_ resource: LocalizedStringResource) {
        fatalError("TODO")
    }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Text {
    @_semantics("swiftui.init_with_localization") public init(_ key: LocalizedStringKey, tableName: String? = nil, bundle: Bundle? = nil, comment: StaticString? = nil) {
        fatalError("TODO")
    }
}

extension Text {
    package struct ResolveOptions: OptionSet {
        static var includeAccessibility: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 0)
        }
        
        static var foregroundKeyColor: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 1)
        }
        
        static var writeAuxiliaryMetadata: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 2)
        }
        
        static var includeTransitions: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 3)
        }
        
        static var disableLinkColor: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 4)
        }
        
        static var allowsKeyColors: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 5)
        }
        
        static var allowsTextSuffix: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 6)
        }
        
        static var includeSupportForRepeatedResolution: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 7)
        }
        
        static var ignoreMarkdown: Text.ResolveOptions {
            return Text.ResolveOptions(rawValue: 1 << 8)
        }
        
        package let rawValue: Int
        
        package init(rawValue: Int) {
            self.rawValue = rawValue
        }
    }
}
