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
        let metadata = Self.makeConditionalMetadata(ViewDescriptor.self)
        let listOutputs = Self.makeDynamicViewList(metadata: metadata, view: view, inputs: inputs)
        return listOutputs
    }
    
    public static nonisolated func _viewListCount(inputs: _ViewListCountInputs) -> Int? {
        fatalError("TODO")
    }
}

extension _ConditionalContent {
    static func makeConditionalMetadata<T: ConditionalProtocolDescriptor>(_ descriptor: T.Type) -> ConditionalMetadata<T> {
        if let descriptor = T.fetchConditionalType(key: ObjectIdentifier(Self.self)) {
            return ConditionalMetadata(descriptor)
        } else {
            let block: () -> ConditionalTypeDescriptor<T> = {
                let falseDescriptor = ConditionalTypeDescriptor<T>.descriptor(type: FalseContent.self)
                let trueDescriptor = ConditionalTypeDescriptor<T>.descriptor(type: TrueContent.self)
                
                return ConditionalTypeDescriptor<T>(
                    storage: .either(ConditionalTypeDescriptor<T>.Storage.self, f: falseDescriptor, t: trueDescriptor),
                    count: falseDescriptor.count + trueDescriptor.count
                )
            }
            
            let descriptor = block()
            T.insertConditionalType(key: ObjectIdentifier(Self.self), value: descriptor)
            return ConditionalMetadata(descriptor)
        }
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
    private var desc: ConditionalTypeDescriptor<T>
    private var ids: [UniqueID]
    
    init(_ descriptor: ConditionalTypeDescriptor<T>) {
        var ids: [UniqueID] = []
        ids.reserveCapacity(descriptor.count)
        for _ in 0..<descriptor.count {
            ids.append(UniqueID())
        }
        
        self.desc = descriptor
        self.ids = ids
    }
}

protocol ConditionalProtocolDescriptor: ProtocolDescriptor {
    static func fetchConditionalType(key: ObjectIdentifier) -> ConditionalTypeDescriptor<Self>?
    static func insertConditionalType(key: ObjectIdentifier, value: ConditionalTypeDescriptor<Self>)
}

struct ConditionalTypeDescriptor<T: ConditionalProtocolDescriptor>: Sendable {
    fileprivate static func descriptor(type: any Any.Type) -> ConditionalTypeDescriptor<T> {
        if let descriptor = T.fetchConditionalType(key: ObjectIdentifier(type)) {
            return descriptor
        }
        
        let descriptor = ConditionalTypeDescriptor(type)
        T.insertConditionalType(key: ObjectIdentifier(type), value: descriptor)
        return descriptor
    }
    
    private var storage: ConditionalTypeDescriptor<T>.Storage
    fileprivate private(set) var count: Int
    
    init(_ type: any Any.Type) {
        /*
         T = x20/x22(witness)
         type -> x21
         */
        let nominalDescriptor = TypeID(type).nominalDescriptor
        
        if (nominalDescriptor != conditionalTypeDescriptor), (nominalDescriptor != optionalTypeDescriptor) {
            // <+464>
            self.storage = .atom(T.conformance(of: type)!)
            self.count = 1
        } else {
            // <+352>
            let descriptor = Self.descriptor(type: type)
            self.storage = descriptor.storage
            self.count = descriptor.count + 1
        }
    }
    
    // 원래 없음
    @inline(__always)
    fileprivate init(storage: ConditionalTypeDescriptor<T>.Storage, count: Int) {
        self.storage = storage
        self.count = count
    }
}

extension ConditionalTypeDescriptor {
    fileprivate enum Storage: Sendable {
        case atom(TypeConformance<T>)
        indirect case optional(Any.Type, ConditionalTypeDescriptor<T>)
        indirect case either(Any.Type, f: ConditionalTypeDescriptor<T>, t: ConditionalTypeDescriptor<T>)
    }
}

fileprivate nonisolated(unsafe) let conditionalTypeDescriptor: UnsafeRawPointer = TypeID(_ConditionalContent<Void, Void>.self).nominalDescriptor
fileprivate nonisolated(unsafe) let optionalTypeDescriptor: UnsafeRawPointer = TypeID(Void?.self).nominalDescriptor
