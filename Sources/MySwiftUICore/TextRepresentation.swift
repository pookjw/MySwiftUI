// 03CAEBF34B5290A85C0CA97765182271
package import AttributeGraph
private import Foundation

extension _ViewInputs {
    package var requestedTextRepresentation: (any PlatformTextRepresentable.Type)? {
        get {
            return self[_GraphInputs.TextRepresentationKey.self]
        }
        set {
            self[_GraphInputs.TextRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    package var requestedTextRepresentation: (any PlatformTextRepresentable.Type)? {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

extension _GraphInputs {
    fileprivate struct TextRepresentationKey: ViewInput {
        static var defaultValue: (any PlatformTextRepresentable.Type)? {
            return nil
        }
    }
}

package protocol PlatformTextRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func representationOptions(inputs: _ViewInputs) -> PlatformTextRepresentationOptions
    static func makeRepresentation(inputs: _ViewInputs, context: Attribute<PlatformTextRepresentableContext>, outputs: inout _ViewOutputs)
}

package struct PlatformTextRepresentationOptions: OptionSet {
    static var includeStyledText: PlatformTextRepresentationOptions {
        return PlatformTextRepresentationOptions(rawValue: 1 << 0)
    }
    
    static var includeAccessibility: PlatformTextRepresentationOptions {
        return PlatformTextRepresentationOptions(rawValue: 1 << 1)
    }
    
    package let rawValue: Int
    
    package init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

package struct PlatformTextRepresentableContext {
    private var text: NSAttributedString?
}
