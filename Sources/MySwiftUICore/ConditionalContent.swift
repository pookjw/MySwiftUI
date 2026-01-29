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
        self.storage = storage
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
                    storage: .either(Self.Storage.self, f: falseDescriptor, t: trueDescriptor),
                    count: falseDescriptor.count + trueDescriptor.count
                )
            }
            
            let descriptor = block()
            T.insertConditionalType(key: ObjectIdentifier(Self.self), value: descriptor)
            return ConditionalMetadata(descriptor)
        }
    }
}

extension _ConditionalContent: DynamicView where TrueContent: View, FalseContent: View {
    typealias Metadata = ConditionalMetadata<ViewDescriptor>
    typealias ID = UniqueID
    
    static nonisolated var canTransition: Bool {
        return true
    }
    
    nonisolated func childInfo(metadata: ConditionalMetadata<ViewDescriptor>) -> (any Any.Type, UniqueID?) {
        return unsafe withUnsafePointer(to: self) { pointer in
            return unsafe metadata.childInfo(ptr: pointer, emptyType: EmptyView.self)
        }
    }
    
    func makeChildView(metadata: ConditionalMetadata<ViewDescriptor>, view: Attribute<Self>, inputs: _ViewInputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    func makeChildViewList(metadata: ConditionalMetadata<ViewDescriptor>, view: Attribute<Self>, inputs: _ViewListInputs) -> _ViewListOutputs {
        // sp + 0x30
        let copy_1 = metadata
        // view -> sp + 0x50
        // inputs -> sp + 0x58
        
        return unsafe withUnsafePointer(to: self) { pointer in
            // $s7SwiftUI19_ConditionalContentVA2A4ViewRzAaDR_rlE09makeChildE4List8metadata4view6inputsAA01_eH7OutputsVAA0C8MetadataVyAA0E10DescriptorVG_14AttributeGraph0O0VyACyxq_GGAA01_eH6InputsVtFAJSPyASGXEfU_TA
            return unsafe copy_1.makeViewList(ptr: pointer, view: view, inputs: inputs)
        }
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
    
    func childInfo<U>(ptr: UnsafePointer<U>, emptyType: Any.Type) -> (Any.Type, UniqueID?) {
        var type: (any Any.Type)?
        var index = 0
        unsafe desc.project(at: UnsafeRawPointer(ptr), baseIndex: index) { _index, conformance, pointer in
            // $s7SwiftUI19ConditionalMetadataV9childInfo3ptr9emptyTypeypXp_AA8UniqueIDVSgtSPyqd__G_ypXptlFySi_AA0I11ConformanceVyxGSgSVSgtXEfU_TA
            index = _index
            if let conformance {
                type = conformance.type
            } else {
                type = nil
            }
        }
        
        return (type ?? emptyType, ids[index])
    }
}

extension ConditionalMetadata where T == ViewDescriptor {
    func makeViewList<U: View>(ptr: UnsafePointer<U>, view: Attribute<U>, inputs: _ViewListInputs) -> _ViewListOutputs {
        /*
         ptr = x22
         view = x24
         inputs = x21
         U = x19
         return pointer = x23
         */
        var makeList = unsafe Self.MakeList<U>(desc: desc, view: view, index: 0, ptr: nil, inputs: inputs, outputs: nil)
        unsafe desc.project(at: ptr, baseIndex: 0) { index, conformance, pointer in
            // $s7SwiftUI19ConditionalMetadataVA2A14ViewDescriptorVRszrlE04makeE4List3ptr4view6inputsAA01_eH7OutputsVSPyqd__G_14AttributeGraph0M0Vyqd__GAA01_eH6InputsVtlFySi_AA15TypeConformanceVyAEGSgSVSgtXEfU_TA
            guard
                let conformance,
                let pointer = unsafe pointer
            else {
                return
            }
            
            makeList.index = index
            unsafe makeList.ptr = unsafe pointer
            unsafe conformance.visitType(visitor: &makeList)
        }
        
        if let outputs = makeList.outputs {
            return outputs
        } else {
            return _ViewListOutputs.emptyViewList(inputs: inputs)
        }
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
        let nominalDescriptor = unsafe TypeID(type).nominalDescriptor
        
        if unsafe (nominalDescriptor == conditionalTypeDescriptor) {
            // <+88>
            let base = UnsafeRawPointer(bitPattern: Int(bitPattern: ObjectIdentifier(type)))!
                .advanced(by: 0x10)
            let x23 = base
                .assumingMemoryBound(to: Any.Type.self)
                .pointee
            let x21 = base
                .advanced(by: 0x8)
                .assumingMemoryBound(to: Any.Type.self)
                .pointee
            // sp + 0x28 -> x25/x26/x24
            let first = ConditionalTypeDescriptor(x21)
            // sp + 0x38 -> x27/x28/x22
            let second = ConditionalTypeDescriptor(x23)
            
            self.storage = .either(type, f: first, t: second)
            self.count = first.count + second.count
        } else if unsafe (nominalDescriptor == optionalTypeDescriptor) {
            // <+352>
            let descriptor = ConditionalTypeDescriptor.descriptor(type: type)
            self.storage = .optional(type, descriptor)
            self.count = descriptor.count + 1
        } else {
            // <+464>
            self.storage = .atom(T.conformance(of: type)!)
            self.count = 1
        }
    }
    
    // 원래 없음
    @inline(__always)
    fileprivate init(storage: ConditionalTypeDescriptor<T>.Storage, count: Int) {
        self.storage = storage
        self.count = count
    }
    
    fileprivate func project(at pointer: UnsafeRawPointer, baseIndex: Int, _ body: (Int, TypeConformance<T>?, UnsafeRawPointer?) -> Void) {
        /*
         pointer -> x21
         baseIndex -> x22
         body -> x19
         */
        switch storage {
        case .atom(let comformance):
            unsafe body(baseIndex, comformance, pointer)
        case .optional(let type, let descriptor):
            let typeID = TypeID(type)
            let tag = unsafe typeID.getEnumTag(pointer)
            if tag == 1 {
                body(baseIndex, nil, nil)
            } else {
                // <+300>
                unsafe typeID.projectEnum(at: pointer, tag: Int(tag)) { pointer in
                    unsafe descriptor.project(at: pointer, baseIndex: baseIndex + 1, body)
                }
            }
        case .either(let type, let falseDescriptor, let trueDescriptor):
            // <+180>
            let typeID = TypeID(type)
            let tag = unsafe typeID.getEnumTag(pointer)
            unsafe typeID.projectEnum(at: pointer, tag: Int(tag)) { pointer in
                if tag == 1 {
                    unsafe falseDescriptor.project(at: pointer, baseIndex: baseIndex, body)
                } else {
                    unsafe trueDescriptor.project(at: pointer, baseIndex: baseIndex + falseDescriptor.count, body)
                }
            }
        }
    }
}

extension ConditionalTypeDescriptor {
    fileprivate enum Storage: Sendable {
        case atom(TypeConformance<T>)
        indirect case optional(Any.Type, ConditionalTypeDescriptor<T>)
        indirect case either(Any.Type, f: ConditionalTypeDescriptor<T>, t: ConditionalTypeDescriptor<T>)
    }
}

fileprivate nonisolated(unsafe) let conditionalTypeDescriptor: UnsafeRawPointer = unsafe TypeID(_ConditionalContent<Void, Void>.self).nominalDescriptor
fileprivate nonisolated(unsafe) let optionalTypeDescriptor: UnsafeRawPointer = unsafe TypeID(Void?.self).nominalDescriptor

extension ConditionalMetadata where T == ViewDescriptor {
    fileprivate struct MakeList<U>: ViewTypeVisitor {
        private(set) var desc: ConditionalTypeDescriptor<ViewDescriptor>
        private(set) var view: Attribute<U>
        var index: Int
        var ptr: UnsafeRawPointer?
        private(set) var inputs: _ViewListInputs
        var outputs: _ViewListOutputs?
        
        mutating func visit<Content: View>(type: Content.Type) {
            // $s7SwiftUI19ConditionalMetadataVA2A14ViewDescriptorVRszrlE8MakeList33_2319071E64CA2FA820BFB26F46C6ECC6LLV5visit4typeyqd0__m_tAA0E0Rd0__lF
            inputs.base.pushStableType(type)
            let rule = UnwrapConditional<T, U, Content>(source: view, desc: desc, index: index)
            let attribute = Attribute(rule)
            attribute.value = unsafe ptr!.assumingMemoryBound(to: Content.self).pointee
            outputs = Content.makeDebuggableViewList(view: _GraphValue(attribute), inputs: inputs)
        }
    }
}

fileprivate struct UnwrapConditional<T: ConditionalProtocolDescriptor, Source, Content: View>: StatefulRule, AsyncAttribute {
    @Attribute private(set) var source: Source
    let desc: ConditionalTypeDescriptor<T>
    let index: Int
    
    typealias Value = Content
    
    func updateValue() {
        withUnsafePointer(to: source) { pointer1 in
            desc.project(at: pointer1, baseIndex: 0) { index, conformance, pointer2 in
                guard self.index == index else {
                    return
                }
                
                value = pointer2!
                    .assumingMemoryBound(to: Content.self)
                    .pointee
            }
        }
    }
}

extension Optional {
    static func makeConditionalMetadata<T: ConditionalProtocolDescriptor>(_ type: T.Type) -> ConditionalMetadata<T> {
        // sp + 0x8
        if let descriptor = type.fetchConditionalType(key: ObjectIdentifier(Self.self)) {
            // <+156>
            return ConditionalMetadata(descriptor)
        } else {
            // <+92>
            let block: () -> ConditionalTypeDescriptor<T> = {
                // $sSq7SwiftUIE23makeConditionalMetadatayAA0dE0Vyqd__Gqd__mAA0D18ProtocolDescriptorRd__lFZAA0d4TypeG0Vyqd__GyXEfU_
                let descriptor = ConditionalTypeDescriptor<T>.descriptor(type: Wrapped.self)
                return ConditionalTypeDescriptor(storage: .optional(Self.self, descriptor), count: descriptor.count + 1)
            }
            
            let descriptor = block()
            T.insertConditionalType(key: ObjectIdentifier(Self.self), value: descriptor)
            return ConditionalMetadata(descriptor)
        }
    }
}
