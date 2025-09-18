private import _DarwinFoundation2._string

struct UnsafeHeterogeneousBuffer: @unsafe Collection {
    private var buf: UnsafeMutableRawPointer?
    private var available: Int32
    private var _count: Int32
    
    init() {
        self.buf = nil
        self.available = 0
        self._count = 0
    }
    
    func destroy() {
        // x19
        let buf = buf
        let count = _count
        
        if count != 0 {
            // <+36>
            let buf = buf!
            var w22: Int32 = 0
            var w21 = count &- 1
            
            while true {
                let x8 = buf.advanced(by: Int(w22))
                
                if w21 != 0 {
                    // <+52>
                    w22 &+= x8.assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self).pointee.size
                } else {
                    w22 = 0
                }
                
                // <+60>
                let w23 = (w21 | w22)
                x8
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
        
        buf?.deallocate()
    }
    
    @discardableResult
    mutating func append<T>(_ value: T, vtable: _UnsafeHeterogeneousBuffer_VTable.Type) -> UnsafeHeterogeneousBuffer.Index {
        // x0 = value = x22
        // x1 = vtable = x24
        // x2 = T type = x21
        // x26
        let bytes = (MemoryLayout<T>.size + MemoryLayout<UnsafeHeterogeneousBuffer.Item>.size)
        // x25
        let pointer = allocate(bytes: bytes)
        let item = pointer.assumingMemoryBound(to: Item.self)
        item.initialize(to: Item(vtable: vtable, size: Int32(bytes), flags: 0))
        let element = _UnsafeHeterogeneousBuffer_Element(item: item)
        element.body(as: T.self).initialize(to: value)
        
        let count = _count
        let index = UnsafeHeterogeneousBuffer.Index(index: count, offset: Int32(pointer - buf!))
        _count = (count + 1)
        return index
    }
    
    var isEmpty: Bool {
        return _count == 0
    }
    
    var startIndex: UnsafeHeterogeneousBuffer.Index {
        return Index(index: 0, offset: 0)
    }
    
    var endIndex: UnsafeHeterogeneousBuffer.Index {
        return Index(index: _count, offset: 0)
    }
    
    func index(after i: UnsafeHeterogeneousBuffer.Index) -> UnsafeHeterogeneousBuffer.Index {
        let buf = buf!
        let count = _count
        let nextIndex = (i.index &+ 1)
        
        guard count != nextIndex else {
            return UnsafeHeterogeneousBuffer.Index(index: nextIndex, offset: 0)
        }
        
        let offset = i.offset
        let size = buf
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
        let buf = buf!
        let count = _count
        let index = i.index
        let offset = i.offset
        let nextIndex = index &+ 1
        
        i.index = nextIndex
        
        guard nextIndex != count else {
            i.offset = 0
            return
        }
        
        let nextBuf = buf.advanced(by: Int(offset))
        let size = nextBuf
            .assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self)
            .pointee
            .size
        
        i.offset = offset + size
    }
    
    subscript(_ index: UnsafeHeterogeneousBuffer.Index) -> _UnsafeHeterogeneousBuffer_Element {
        let buf = buf!
        return _UnsafeHeterogeneousBuffer_Element(
            item: buf
                .advanced(by: Int(index.offset))
                .assumingMemoryBound(to: UnsafeHeterogeneousBuffer.Item.self)
        )
    }
    
    var count: Int {
        return Int(_count)
    }
    
    private mutating func allocate(bytes: Int) -> UnsafeMutableRawPointer {
        /*
         bytes = x19
         self = x20
         */
        let w8 = available
        var w9 = _count
        
        var x21: Int
        if w9 == 0 {
            // <+88>
            x21 = 0
            // <+92>
        } else {
            // <+32>
            var x11 = buf!
            var w10: Int = 0
            x21 = 0
            x11 = x11.advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.offset(of: \.size)!)
            
            repeat {
                let x12 = Int(x11.advanced(by: w10).assumingMemoryBound(to: Int32.self).pointee)
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
            growBuffer(by: bytes, capacity: x21 + Int(w8))
        }
        
        let buf = buf!
        available -= Int32(bytes)
        return buf.advanced(by: Int(x21))
    }
    
    private mutating func growBuffer(by bytes: Int, capacity: Int) {
        let total = (bytes + capacity)
        
        var x22 = Swift.max((capacity &<< 1), 0x40)
        while x22 < total {
            x22 = (x22 &<< 2)
        }
        
        let newBuf = UnsafeMutableRawPointer.allocate(byteCount: x22, alignment: 0)
        
        if let buf {
            /*
             buf = x24
             self = sp + 0x10
             newBuf = sp + 0x18
             capacity = sp + 0x8
             */
            // w8
            let count = _count
            
            if count != 0 {
                var w27: Int32 = 0
                let x25 = buf.advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.offset(of: \.size)!)
                var w26 = count - 1
                var x28 = buf
                var x23 = newBuf
                
                repeat {
                    if w26 != 0 {
                        let w8 = x25.advanced(by: Int(w27)).assumingMemoryBound(to: Int32.self).pointee
                        w27 &+= w8
                    }
                    
                    let w21 = (w26 == 0) || (w27 == 0)
                    
                    /*
                     x19 = size
                     */
                    let item = x28.assumingMemoryBound(to: Item.self).pointee
                    x23.assumingMemoryBound(to: Item.self).initialize(to: item)
                    
                    x28
                        .assumingMemoryBound(to: Item.self)
                        .pointee
                        .vtable
                        .moveInitialize(
                            elt: _UnsafeHeterogeneousBuffer_Element(item: x23.assumingMemoryBound(to: Item.self)),
                            from: _UnsafeHeterogeneousBuffer_Element(item: x28.assumingMemoryBound(to: Item.self))
                        )
                    
                    x28 = x28.advanced(by: Int(item.size))
                    x23 = x23.advanced(by: Int(item.size))
                    w26 &-= 1
                    
                    if w21 {
                        break
                    }
                } while true
            }
            
            // <+224>
            buf.deallocate()
        }
        
        self.buf = newBuf
        self.available += Int32(x22 - capacity)
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

struct _UnsafeHeterogeneousBuffer_Element {
    private var item: UnsafeMutablePointer<UnsafeHeterogeneousBuffer.Item>
    
    fileprivate init(item: UnsafeMutablePointer<UnsafeHeterogeneousBuffer.Item>) {
        self.item = item
    }
    
    @inlinable
    var type: Any.Type {
        return item.pointee.vtable.type
    }
    
    @inlinable
    func body<T>(as: T.Type) -> UnsafeMutablePointer<T> {
        return UnsafeMutableRawPointer(item)
            .advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.size)
            .assumingMemoryBound(to: T.self)
    }
    
    @inlinable
    func vtable<T: _UnsafeHeterogeneousBuffer_VTable>(as: T.Type) -> T.Type {
        return UnsafeRawPointer(item)
            .advanced(by: MemoryLayout<UnsafeHeterogeneousBuffer.Item>.offset(of: \.vtable)!)
            .assumingMemoryBound(to: Swift.type(of: T.self))
            .pointee
    }
    
    @inlinable
    var address: UnsafeRawPointer {
        return UnsafeRawPointer(item)
    }
    
    @inlinable
    var flags: UInt32 {
        get {
            return item.pointee.flags
        }
        nonmutating set {
            item.pointee.flags = newValue
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
