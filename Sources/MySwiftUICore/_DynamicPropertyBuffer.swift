// F3A89CF4357225EF49A7DD673FDFEE02
#warning("TODO")

public struct _DynamicPropertyBuffer {
    private var contents: UnsafeHeterogeneousBuffer
    
    init<T>(fields: DynamicPropertyCache.Fields, container: _GraphValue<T>, inputs: inout _GraphInputs) {
        contents = UnsafeHeterogeneousBuffer()
        addFields(fields, container: container, inputs: &inputs, baseOffset: 0)
    }
    
    init() {
        contents = UnsafeHeterogeneousBuffer()
    }
    
    init<T>(fields: DynamicPropertyCache.Fields, container: _GraphValue<T>, inputs: inout _GraphInputs, baseOffset: Int) {
        contents = UnsafeHeterogeneousBuffer()
        addFields(fields, container: container, inputs: &inputs, baseOffset: baseOffset)
    }
    
    func traceMountedProperties<T>(to: _GraphValue<T>, fields: DynamicPropertyCache.Fields) {
        fatalError("TODO")
    }
    
    func append<T: DynamicPropertyBox>(_ box: T, fieldOffset: Int) {
        fatalError("TODO")
    }
    
    func reset() {
        fatalError("TODO")
    }
    
    func update(container: UnsafeMutableRawPointer, phase: _GraphInputs.Phase) -> Bool {
        fatalError("TODO")
    }
    
    func destroy() {
        fatalError("TODO")
    }
    
    func getState<T>(type: T.Type) -> Binding<T>? {
        fatalError("TODO")
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
                var flags = contents[index].flags
                flags &= 0x80000000
                flags |= UInt32(baseOffset)
                contents[index].flags = flags
            }
            
            _openExistential(type, do: project)
        }
    }
    
    var isEmpty: Bool {
        fatalError("TODO")
    }
    
    var count: Int {
        fatalError("TODO")
    }
    
    func applyChanged(to: (Int) -> ()) {
        fatalError("TODO")
    }
}

@available(*, unavailable)
extension _DynamicPropertyBuffer: Sendable {}

protocol DynamicPropertyBox: DynamicProperty {
    associatedtype Property: DynamicProperty
    
    func destroy()
    func reset()
    func update(property: inout Self.Property, phase: _GraphInputs.Phase) -> Bool
    func getState<T>(type: T.Type) -> Binding<T>?
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
