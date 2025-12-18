// F3A89CF4357225EF49A7DD673FDFEE02
private import AttributeGraph

public struct _DynamicPropertyBuffer {
    private var contents: UnsafeHeterogeneousBuffer
    
    @inline(__always)
    init<T>(fields: DynamicPropertyCache.Fields, container: _GraphValue<T>, inputs: inout _GraphInputs) {
        contents = UnsafeHeterogeneousBuffer()
        addFields(fields, container: container, inputs: &inputs, baseOffset: 0)
    }
    
    @inline(__always)
    init() {
        contents = UnsafeHeterogeneousBuffer()
    }
    
    @inline(__always)
    init<T>(fields: DynamicPropertyCache.Fields, container: _GraphValue<T>, inputs: inout _GraphInputs, baseOffset: Int) {
        contents = UnsafeHeterogeneousBuffer()
        addFields(fields, container: container, inputs: &inputs, baseOffset: baseOffset)
    }
    
    func traceMountedProperties<T>(to value: _GraphValue<T>, fields: DynamicPropertyCache.Fields) {
        /*
         value = x22
         fields = x24
         T = x25
         */
        guard Signpost.linkCreate.isEnabled else {
            return
        }
        
        let typeName = String(describing: T.self)
        let libraryName = Tracing.libraryName(defining: T.self)
        let counter = value.value.identifier.graph.counter(options: .unknown2)
        
        guard case .product(let fields) = fields.layout else {
            return
        }
        
        for unsafe (index, element) in unsafe contents.enumerated() {
            guard index != fields.count else {
                return
            }
            
            let field = fields[index]
            
            unsafe Signpost.linkCreate.traceEvent(
                type: .event,
                object: nil,
                "Attached: %{public}@ [ %p ] to %{public}@ (in %{public}@) at offset +%d [%d] (%p)",
                args: [
                    _typeName(field.type, qualified: false),
                    UInt(bitPattern: element.address),
                    typeName,
                    libraryName,
                    field.offset,
                    value.value.identifier.rawValue,
                    counter
                ]
            )
        }
    }
    
    mutating func append<T: DynamicPropertyBox>(_ box: T, fieldOffset: Int) {
        let index = contents.append(box, vtable: BoxVTable<T>.self)
        var flags = unsafe contents[index].flags
        flags &= 0x80000000
        flags |= UInt32(fieldOffset)
        unsafe contents[index].flags = flags
    }
    
    func reset() {
        for unsafe element in unsafe contents {
            unsafe element.vtable(as: BoxVTableBase.self).reset(elt: element)
        }
    }
    
    func update(container: UnsafeMutableRawPointer, phase: _GraphInputs.Phase) -> Bool {
        var result = false
        for unsafe element in unsafe contents {
            let _result = unsafe element
                .vtable(as: BoxVTableBase.self)
                .update(
                    elt: element,
                    property: container.advanced(by: Int(element.flags & 0x7fffffff)),
                    phase: phase
                )
            
            let w8 = unsafe element.flags
            let w9 = (_result ? 0x80000000 : 0) | (w8 & 0x7fffffff)
            unsafe element.flags = w9
            
            result = result || _result
        }
        
        return result
    }
    
    mutating func destroy() {
        // contents = x19
        if Signpost.linkDestroy.isEnabled {
            for unsafe element in unsafe contents {
                unsafe Signpost.linkDestroy.traceEvent(type: .event, object: nil, "Detached: [ %p ]", args: [UInt(bitPattern: element.address)])
            }
        }
        
        contents.destroy()
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        for unsafe element in unsafe contents {
            if
                let state = unsafe element
                    .vtable(as: BoxVTableBase.self)
                    .getState(elt: element, type: T.self) 
            {
                return state
            }
        }
        
        return nil
    }
    
    mutating func addFields<T>(_ fields: DynamicPropertyCache.Fields, container: _GraphValue<T>, inputs: inout _GraphInputs, baseOffset: Int) {
        /*
         self -> x23
         fields -> x20
         container -> w24
         inputs -> x21
         baseOffset -> x22
         T -> x19
         */
        
        switch fields.layout {
        case .product(let fields):
            // <+180>
            for field in fields {
                field.type._makeProperty(in: &self, container: container, fieldOffset: field.offset, inputs: &inputs)
            }
        case .sum(let type, let taggedFields):
            // <+60>
            let cases = taggedFields.map { taggedField -> (tag: Int, links: _DynamicPropertyBuffer) in
                let buffer = _DynamicPropertyBuffer(
                    fields: DynamicPropertyCache.Fields(.product(taggedField.fields)),
                    container: container,
                    inputs: &inputs
                )
                return (tag: taggedField.tag, links: buffer)
            }
            
            func project<U>(type: U.Type) {
                let box = EnumBox(cases: cases, active: nil)
                let table = EnumVTable<U>.self
                let index = contents.append(box, vtable: table.self)
                var flags = unsafe contents[index].flags
                flags &= 0x80000000
                flags |= UInt32(baseOffset)
                unsafe contents[index].flags = flags
            }
            
            _openExistential(type, do: project)
        }
    }
    
    var isEmpty: Bool {
        return contents.isEmpty
    }
    
    var count: Int {
        return contents.count
    }
    
    func applyChanged(to block: (Int) -> ()) {
        for unsafe element in unsafe contents {
            if unsafe element.flags & 0x80000000 != 0 {
                unsafe block(Int(element.flags & 0x7fffffff))
            }
        }
    }
}

@available(*, unavailable)
extension _DynamicPropertyBuffer: Sendable {}

protocol DynamicPropertyBox {
    associatedtype Property: DynamicProperty
    
    func destroy()
    func reset()
    func update(property: inout Self.Property, phase: _GraphInputs.Phase) -> Bool
    func getState<T>(type: T.Type) -> Binding<T>?
}

extension DynamicPropertyBox {
    func destroy(){
    }
    
    func reset() {
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        fatalError("TODO")
    }
}

fileprivate class BoxVTableBase: _UnsafeHeterogeneousBuffer_VTable {
    class func reset(elt: _UnsafeHeterogeneousBuffer_Element) {
    }
    
    class func update(elt: _UnsafeHeterogeneousBuffer_Element, property: UnsafeMutableRawPointer, phase: _GraphInputs.Phase) -> Bool {
        return false
    }
    
    class func getState<T>(elt: _UnsafeHeterogeneousBuffer_Element, type: T.Type) -> Binding<T>? {
        return nil
    }
}

fileprivate final class BoxVTable<U>: BoxVTableBase {
    override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
        fatalError("TODO")
    }
    
    override class func reset(elt: _UnsafeHeterogeneousBuffer_Element) {
        fatalError("TODO")
    }
    
    override class func update(elt: _UnsafeHeterogeneousBuffer_Element, property: UnsafeMutableRawPointer, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
    
    override class func getState<T>(elt: _UnsafeHeterogeneousBuffer_Element, type: T.Type) -> Binding<T>? {
        fatalError("TODO")
    }
}

fileprivate final class EnumVTable<T>: BoxVTableBase {
    override class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
        fatalError("TODO")
    }
    
    override class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
        fatalError("TODO")
    }
    
    override class func reset(elt: _UnsafeHeterogeneousBuffer_Element) {
        fatalError("TODO")
    }
    
    override class func update(elt: _UnsafeHeterogeneousBuffer_Element, property: UnsafeMutableRawPointer, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
}

fileprivate struct EnumBox {
    private var cases: [(tag: Int, links: _DynamicPropertyBuffer)]
    private var active: (tag: Int, index: Int)?
    
    // 원래 없음
    @inline(__always)
    init(cases: [(tag: Int, links: _DynamicPropertyBuffer)], active: (tag: Int, index: Int)?) {
        self.cases = cases
        self.active = active
    }
}
