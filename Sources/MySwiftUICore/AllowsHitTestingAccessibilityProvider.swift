// 0DA0B6FBFACBDA8275B06C3CD0F4D8CA
internal import CoreGraphics
private import AttributeGraph

package protocol AllowsHitTestingAccessibilityProvider {
    static func makeView(modifier: _GraphValue<_AllowsHitTestingModifier>, inputs: _ViewInputs, outputs: inout _ViewOutputs)
}

extension _GraphInputs {
    var allowsHitTestingAccessibilityProvider: (any AllowsHitTestingAccessibilityProvider.Type) {
        get {
            return self[AllowsHitTestingAccessibilityProviderKey.self]
        }
        set {
            self[AllowsHitTestingAccessibilityProviderKey.self] = newValue
        }
        _modify {
            yield &self[AllowsHitTestingAccessibilityProviderKey.self]
        }
    }
    
    fileprivate struct AllowsHitTestingAccessibilityProviderKey : GraphInput {
        @safe static nonisolated(unsafe) let defaultValue: (any AllowsHitTestingAccessibilityProvider.Type) = EmptyAllowsHitTestingAccessibilityProvider.self
    }
}

struct EmptyAllowsHitTestingAccessibilityProvider : AllowsHitTestingAccessibilityProvider {
    static func makeView(modifier: _GraphValue<_AllowsHitTestingModifier>, inputs: _ViewInputs, outputs: inout _ViewOutputs) {
        assertUnimplemented()
    }
}

@frozen public struct _AllowsHitTestingModifier : Equatable {
    public var allowsHitTesting: Bool

    @inlinable public init(allowsHitTesting: Bool) {
        self.allowsHitTesting = allowsHitTesting
    }

    nonisolated public static func _makeView(modifier: _GraphValue<Self>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        var outputs = self._makeRendererEffect(effect: modifier, inputs: inputs, body: body)
        
        if inputs.preferences.contains(ViewRespondersKey.self) {
            let responders = outputs.preferences[ViewRespondersKey.self] ?? ViewGraph.current.intern([], for: [ViewResponder].self, id: .defaultValue)
            let responder = AllowsHitTestingResponder(inputs: inputs)
            
            let filter = AllowsHitTestingFilter(modifier: modifier.value, children: responders, responder: responder)
            outputs.preferences[ViewRespondersKey.self] = Attribute(filter)
            // <+436>
        }
        
        // <+436>
        inputs.allowsHitTestingAccessibilityProvider.makeView(modifier: modifier, inputs: inputs, outputs: &outputs)
        return outputs
    }

    public static func == (a: Self, b: Self) -> Bool {
        assertUnimplemented()
    }

    public typealias Body = Never
}

extension _AllowsHitTestingModifier : ViewModifier {}
extension _AllowsHitTestingModifier : Sendable {}
extension _AllowsHitTestingModifier : BitwiseCopyable {}

extension _AllowsHitTestingModifier : _RendererEffect {
    nonisolated func effectValue(size: CGSize) -> DisplayList.Effect {
        assertUnimplemented()
    }
    
    nonisolated static var isolatesChildPosition: Bool {
        return false
    }
    
    nonisolated static var disabledForFlattenedContent: Bool {
        return false
    }
    
    nonisolated static var preservesEmptyContent: Bool {
        return false
    }
    
    nonisolated static var isScrapeable: Bool {
        return false
    }
}

extension View {
    @inlinable nonisolated public func allowsHitTesting(_ enabled: Bool) -> some View {
        return modifier(_AllowsHitTestingModifier(allowsHitTesting: enabled))
    }
}

fileprivate final class AllowsHitTestingResponder : DefaultLayoutViewResponder {
    private var allowsHitTesting: Bool = true
    
    override init(inputs: _ViewInputs) {
        super.init(inputs: inputs)
    }
    
    override func hitTestPolicy(options: ViewResponder.ContainsPointsOptions) -> ViewResponder.HitTestPolicy {
        assertUnimplemented()
    }
    
    override func extendPrintTree(string: inout String) {
        assertUnimplemented()
    }
}

fileprivate struct AllowsHitTestingFilter : StatefulRule {
    @Attribute private(set) var modifier: _AllowsHitTestingModifier
    @Attribute private(set) var children: [ViewResponder]
    let responder: AllowsHitTestingResponder
    
    typealias Value = [ViewResponder]
    
    func updateValue() {
        assertUnimplemented()
    }
}
