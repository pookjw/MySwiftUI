// 2319071E64CA2FA820BFB26F46C6ECC6
internal import AttributeGraph

@frozen public struct _ConditionalContent<TrueContent, FalseContent> {
    @frozen public enum Storage {
        case trueContent(TrueContent)
        case falseContent(FalseContent)
    }
    
    public let storage: _ConditionalContent<TrueContent, FalseContent>.Storage
}

@available(*, unavailable)
extension _ConditionalContent.Storage: Sendable {
}
@available(*, unavailable)
extension _ConditionalContent : Sendable {
}

extension _ConditionalContent {
    @available(*, deprecated, message: "Do not use this.")
    @_alwaysEmitIntoClient public init(_storage: _ConditionalContent<TrueContent, FalseContent>.Storage) {
        self.storage = _storage
    }
    
    @_alwaysEmitIntoClient package init(__storage: _ConditionalContent<TrueContent, FalseContent>.Storage) {
        self.storage = __storage
    }
}

extension _ConditionalContent: View, PrimitiveView where TrueContent: View, FalseContent: View {
    @usableFromInline
    init(storage: _ConditionalContent<TrueContent, FalseContent>.Storage) {
        fatalError("TODO")
    }
    
    public static nonisolated func _makeView(view: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, inputs: _ViewInputs) -> _ViewOutputs {
        if isLinkedOnOrAfter(.v6) {
            return Self.makeImplicitRoot(view: view, inputs: inputs)
        } else {
            fatalError("TODO")
        }
    }
    
    public static nonisolated func _makeViewList(view: _GraphValue<_ConditionalContent<TrueContent, FalseContent>>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension _ConditionalContent: DynamicView {
    typealias Metadata = ConditionalMetadata<ViewDescriptor>
    typealias ID = UniqueID
    
    static nonisolated var canTransition: Bool {
        return true
    }
    
    nonisolated func childInfo(metadata: Self.Metadata) -> (any Any.Type, UniqueID?) {
        fatalError("TODO")
    }
    
    func makeChildView(metadata: Self.Metadata, view: Attribute<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    func makeChildViewList(metadata: Self.Metadata, view: Attribute<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        fatalError("TODO")
    }
}

struct ConditionalMetadata<T: ConditionalProtocolDescriptor> {
    
}

protocol ConditionalProtocolDescriptor: ProtocolDescriptor {
    static func fetchConditionalType(key: ObjectIdentifier) -> ConditionalTypeDescriptor<Self>?
    static func insertConditionalType(key: ObjectIdentifier, value: ConditionalTypeDescriptor<Self>)
}

struct ConditionalTypeDescriptor<T: ConditionalProtocolDescriptor> {
    private var storage: ConditionalTypeDescriptor<T>.Storage
    private var count: Int
}

extension ConditionalTypeDescriptor {
    fileprivate enum Storage {
        case atom(TypeConformance<T>)
        indirect case optional(Any.Type, ConditionalTypeDescriptor<T>)
        indirect case either(ConditionalTypeDescriptor<T>)
    }
}
