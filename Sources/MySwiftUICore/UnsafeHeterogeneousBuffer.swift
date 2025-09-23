private import _DarwinFoundation2._string

@unsafe struct UnsafeHeterogeneousBuffer: @unsafe Collection {
    private var buf: UnsafeMutableRawPointer?
    private var available: Int32
    private var _count: Int32
    
    init() {
        unsafe self.buf = nil
        unsafe self.available = 0
        unsafe self._count = 0
    }
    
    func destroy() {
        // x19
        let buf = unsafe buf
        let count = unsafe _count
        
        if count != 0 {
            // <+36>
            let buf = unsafe buf!
            var w22: Int32 = 0
            var w21 = count &- 1
            
            while true {
                let x8 = unsafe buf.advanced(by: Int(w22))
                
                if w21 != 0 {
                    // <+52>
                    unsafe w22 &+= x8.assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self).pointee.size
                } else {
                    w22 = 0
                }
                
                // <+60>
                let w23 = (w21 | w22)
                unsafe x8
                    .assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self)
                    .pointee
                    .vtable
                    .deinitialize(
                        elt: _UnsafeHeterogeneousBuffer_Element(
                            item: x8.assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self)
                        )
                    )
                
                w21 &-= 1
                
                if w23 == 0 {
                    break
                }
            }
        }
        
        unsafe buf?.deallocate()
    }
    
    @discardableResult
    mutating func append<T>(_ value: T, vtable: _UnsafeHeterogeneousBuffer_VTable.Type) -> UnsafeHeterogeneousBuffer.Index {
        // x0 = value = x22
        // x1 = vtable = x24
        // x2 = T type = x21
        // x26
        let bytes = (MemoryLayout<T>.size + MemoryLayout<UnsafeHeterogeneousBuffer.Item>.size)
        // x25
        let pointer = unsafe allocate(bytes: bytes)
        let item = unsafe pointer.assumingMemoryBound(to: Item.self)
        unsafe item.initialize(to: Item(vtable: vtable, size: Int32(bytes), flags: 0))
        let element = unsafe _UnsafeHeterogeneousBuffer_Element(item: item)
        unsafe element.body(as: T.self).initialize(to: value)
        
        let count = unsafe _count
        let index = unsafe UnsafeHeterogeneousBuffer.Index(index: count, offset: Int32(pointer - buf!))
        unsafe _count = (count + 1)
        return index
    }
    
    var isEmpty: Bool {
        return unsafe _count == 0
    }
    
    var startIndex: UnsafeHeterogeneousBuffer.Index {
        return Index(index: 0, offset: 0)
    }
    
    var endIndex: UnsafeHeterogeneousBuffer.Index {
        return unsafe Index(index: _count, offset: 0)
    }
    
    func index(after i: UnsafeHeterogeneousBuffer.Index) -> UnsafeHeterogeneousBuffer.Index {
        let buf = unsafe buf!
        let count = unsafe _count
        let nextIndex = (i.index &+ 1)
        
        guard count != nextIndex else {
            return UnsafeHeterogeneousBuffer.Index(index: nextIndex, offset: 0)
        }
        
        let offset = i.offset
        let size = unsafe buf
            .advanced(by: Int(offset))
            .assumingMemoryBound(to: Item.self)
            .pointee
            .size
        
        return UnsafeHeterogeneousBuffer.Index(
            index: nextIndex,
            offset: offset &+ size
        )
    }
    
    func formIndex(after i: inout UnsafeHeterogeneousBuffer.Index) {
        let buf = unsafe buf!
        let count = unsafe _count
        let index = i.index
        let offset = i.offset
        let nextIndex = index &+ 1
        
        i.index = nextIndex
        
        guard nextIndex != count else {
            i.offset = 0
            return
        }
        
        let nextBuf = unsafe buf.advanced(by: Int(offset))
        let size = unsafe nextBuf
            .assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self)
            .pointee
            .size
        
        i.offset = offset + size
    }
    
    subscript(_ index: UnsafeHeterogeneousBuffer.Index) -> _UnsafeHeterogeneousBuffer_Element {
        let buf = unsafe buf!
        return unsafe _UnsafeHeterogeneousBuffer_Element(
            item: buf
                .advanced(by: Int(index.offset))
                .assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self)
        )
    }
    
    var count: Int {
        return unsafe Int(_count)
    }
    
    private mutating func allocate(bytes: Int) -> UnsafeMutableRawPointer {
        /*
         bytes = x19
         self = x20
         */
        let w8 = unsafe available
        var w9 = unsafe _count
        
        var x21: Int
        if w9 == 0 {
            // <+88>
            x21 = 0
            // <+92>
        } else {
            // <+32>
            var x11 = unsafe buf!
            var w10: Int = 0
            x21 = 0
            unsafe x11 = x11.advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.offset(of: \.size)!)
            
            repeat {
                let x12 = Int(unsafe x11.advanced(by: w10).assumingMemoryBound(to: Int32.self).pointee)
                w10 &+= x12
                w9 &-= 1
                
                if w9 == 0 {
                    w10 = 0
                }
                
                x21 &+= x12
            } while (w9 != 0)
            
            // <+76>
        }
        
        // <+92>, <+76> - 둘이 같음
        if w8 >= bytes {
            // <+116>
        } else {
            // <+100>
            unsafe growBuffer(by: bytes, capacity: x21 + Int(w8))
        }
        
        let buf = unsafe buf!
        unsafe available -= Int32(bytes)
        return unsafe buf.advanced(by: Int(x21))
    }
    
    private mutating func growBuffer(by bytes: Int, capacity: Int) {
        let total = (bytes + capacity)
        
        var x22 = Swift.max((capacity &<< 1), 0x40)
        while x22 < total {
            x22 = (x22 &<< 2)
        }
        
        let newBuf = UnsafeMutableRawPointer.allocate(byteCount: x22, alignment: 0)
        
        if let buf = unsafe buf {
            /*
             buf = x24
             self = sp + 0x10
             newBuf = sp + 0x18
             capacity = sp + 0x8
             */
            // w8
            let count = unsafe _count
            
            if count != 0 {
                var w27: Int32 = 0
                let x25 = unsafe buf.advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.offset(of: \.size)!)
                var w26 = count - 1
                var x28 = unsafe buf
                var x23 = unsafe newBuf
                
                repeat {
                    if w26 != 0 {
                        let w8 = unsafe x25.advanced(by: Int(w27)).assumingMemoryBound(to: Int32.self).pointee
                        w27 &+= w8
                    }
                    
                    let w21 = (w26 == 0) || (w27 == 0)
                    
                    /*
                     x19 = size
                     */
                    let item = unsafe x28.assumingMemoryBound(to: Item.self).pointee
                    unsafe x23.assumingMemoryBound(to: Item.self).initialize(to: item)
                    
                    unsafe x28
                        .assumingMemoryBound(to: Item.self)
                        .pointee
                        .vtable
                        .moveInitialize(
                            elt: _UnsafeHeterogeneousBuffer_Element(item: x23.assumingMemoryBound(to: Item.self)),
                            from: _UnsafeHeterogeneousBuffer_Element(item: x28.assumingMemoryBound(to: Item.self))
                        )
                    
                    unsafe x28 = x28.advanced(by: Int(item.size))
                    unsafe x23 = x23.advanced(by: Int(item.size))
                    w26 &-= 1
                    
                    if w21 {
                        break
                    }
                } while true
            }
            
            // <+224>
            unsafe buf.deallocate()
        }
        
        unsafe self.buf = newBuf
        unsafe self.available += Int32(x22 - capacity)
    }
}

extension UnsafeHeterogeneousBuffer {
    struct Index: Comparable {
        fileprivate var index: Int32
        fileprivate var offset: Int32
        
        fileprivate init(index: Int32, offset: Int32) {
            self.index = index
            self.offset = offset
        }
        
        static func < (lhs: UnsafeHeterogeneousBuffer.Index, rhs: UnsafeHeterogeneousBuffer.Index) -> Bool {
            return lhs.index < rhs.index
        }
        
        static func == (lhs: UnsafeHeterogeneousBuffer.Index, rhs: UnsafeHeterogeneousBuffer.Index) -> Bool {
            return (lhs.index == rhs.index) && (lhs.offset == rhs.offset)
        }
    }
    
    struct Item {
        let vtable: _UnsafeHeterogeneousBuffer_VTable.Type
        let size: Int32
        var flags: UInt32
    }
}

@unsafe struct _UnsafeHeterogeneousBuffer_Element {
    private var item: UnsafeMutablePointer<UnsafeHeterogeneousBuffer.Item>
    
    fileprivate init(item: UnsafeMutablePointer<UnsafeHeterogeneousBuffer.Item>) {
        unsafe self.item = item
    }
    
    @inlinable
    var type: Any.Type {
        return unsafe item.pointee.vtable.type
    }
    
    @inlinable
    func body<T>(as: T.Type) -> UnsafeMutablePointer<T> {
        return unsafe UnsafeMutableRawPointer(item)
            .advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.size)
            .assumingMemoryBound(to: T.self)
    }
    
    @inlinable
    func vtable<T: _UnsafeHeterogeneousBuffer_VTable>(as: T.Type) -> T.Type {
        return unsafe UnsafeRawPointer(item)
            .advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.offset(of: \.vtable)!)
            .assumingMemoryBound(to: Swift.type(of: T.self))
            .pointee
    }
    
    @inlinable
    var address: UnsafeRawPointer {
        return unsafe UnsafeRawPointer(item)
    }
    
    @inlinable
    var flags: UInt32 {
        get {
            return unsafe item.pointee.flags
        }
        nonmutating set {
            unsafe item.pointee.flags = newValue
        }
    }
}

class _UnsafeHeterogeneousBuffer_VTable {
    class var type: Any.Type {
        fatalError() // abstract
    }
    
    class func moveInitialize(elt: _UnsafeHeterogeneousBuffer_Element, from: _UnsafeHeterogeneousBuffer_Element) {
        fatalError() // abstract
    }
    
    class func deinitialize(elt: _UnsafeHeterogeneousBuffer_Element) {
        fatalError() // abstract
    }
}
