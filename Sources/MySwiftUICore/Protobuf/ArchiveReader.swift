import Foundation
import os

/*
 TODO:
 FileArchiveReader
 DataArchiveReader
 ArchiveWriter
 FileArchiveWriter
 DataArchiveWrite
 */

package class ArchiveReader: RandomAccessCollection {
    package static let readerKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader").unsafelyUnwrapped
    package static let cacheKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader.cache").unsafelyUnwrapped
    package static let namedImagesKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader.namedImages").unsafelyUnwrapped
    
    private let buffer: UnsafeBufferPointer<UInt8>
    private let attachments: (offset: UInt64, size: UInt64)
    
    fileprivate init(buffer: UnsafeBufferPointer<UInt8>) throws {
        let x0 = UnsafeRawPointer(buffer.baseAddress.unsafelyUnwrapped)
        let x1 = UInt(buffer.count)
        
        if (x1 <= 0) {
            throw Error.invalidSize
        }
        
        var x8 = x1 & 0x7
        if x8 != 0 {
            throw Error.invalidSize
        }
        
        x8 = UInt(bitPattern: x0) + x1
        var x9 = Int(x8 - 0x4)
        
        if x9 < UInt(bitPattern: x0) {
            throw Error.invalidSize
        }
        
        x9 = Int(UnsafePointer<UInt32>(bitPattern: x9)
            .unsafelyUnwrapped
            .pointee)
        
        if x9 != 0xD1561A71 {
            throw Error.invalidMagic
        }
        
        var x10 = x8
        var x11 = UInt(UnsafePointer<UInt32>(bitPattern: x10 - 0x8)
            .unsafelyUnwrapped
            .pointee)
        x10 = x10 - 0x8
        
        var x12 = x11 << 0x4
        x9 = -Int(x12)
        x12 = x10 - x12
        
        x10 = x12 &- UInt(bitPattern: x0)
        if x12 <= x10 {
            throw Error.invalidCount
        }
        
        self.buffer = buffer
        attachments = (offset: UInt64(x12), size: UInt64(x11))
        
        if x11 == 0 {
            return
        }
        
        x11 = UnsafePointer<UInt>(bitPattern: x12).unsafelyUnwrapped.pointee
        x12 = UnsafePointer<UInt>(bitPattern: x12 + 0x8).unsafelyUnwrapped.pointee
        
        x11 = x12 &+ x11
        if x11 < x12 {
            throw Error.invalidAttachment
        }
        
        
        if x10 < x11 {
            throw Error.invalidAttachment
        }
        
        while x9 != -0x10 {
            x11 = UInt(Int(x8) + x9)
            x12 = UnsafePointer<UInt>(bitPattern: x11 + 0x8).unsafelyUnwrapped.pointee
            x11 = UnsafePointer<UInt>(bitPattern: x11 + 0x10).unsafelyUnwrapped.pointee
            
            x11 = x11 &+ x12
            if x11 < x12 {
                throw Error.invalidAttachment
            }
            
            x9 = x9 + 0x10
            assert(x9 <= -0x10)
            
            if x10 >= x11 {
                continue
            }
            
            throw Error.invalidAttachment
        }
    }
    
    package final var startIndex: Int { 0 }
    package final var endIndex: Int { Int(attachments.size) }
    
    package final subscript(index: Int) -> Data {
        var x22 = UInt(index)
        let x23 = UInt(bitPattern: buffer.baseAddress)
        assert(x23 != 0)
        var x8 = UInt(attachments.offset)
        x8 = x8 + (x22 << 4)
        let x24 = UnsafePointer<UInt>(bitPattern: x8).unsafelyUnwrapped.pointee
        
        if (x24 & (1 << 0x3f)) != 0 {
            abort()
        }
        
        x22 = UnsafePointer<UInt>(bitPattern: x8 + 0x8).unsafelyUnwrapped.pointee
        
        let data = Data.init(bytesNoCopy: UnsafeMutableRawPointer(bitPattern: x23).unsafelyUnwrapped, count: Int(x22), deallocator: .none)
        return data
    }
}

package class ArchiveWriter {
    package static let writerKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveWriter").unsafelyUnwrapped
    
    private var isFinal: Bool
    private var attachments: (offset: UInt64, size: UInt64)
    private var attachmentHashes: [StrongHash]
    private var currentOffset: UInt
    private var currentHasher: StrongHasher? // 0x28
    private var cache: [AnyHashable: Int]
    private var signposter: OSSignposter
    
    package init() {
        isFinal = false
        attachments = (0, 0)
        attachmentHashes = []
        currentOffset = 0
        currentHasher = nil
        cache = [:]
        signposter = Signpost.archiving
    }
    
    package func finalize() throws {
        guard !isFinal else {
            return
        }
        
        fatalError("TODO")
    }
    
    package final func addAttachment(
        hash: StrongHash?,
        from body: ((ArchiveWriter) throws -> ())
    ) throws -> Int {
        /*
         hash
         0x1d44bde78 <+200>:  ldr    x8, [x23]
     ->  0x1d44bde7c <+204>:  sub    x9, x29, #0x30
         0x1d44bde80 <+208>:  stur   x8, [x9, #-0x100]
         0x1d44bde84 <+212>:  ldr    x8, [x23, #0x8]
         0x1d44bde88 <+216>:  sub    x9, x29, #0x38
         0x1d44bde8c <+220>:  stur   x8, [x9, #-0x100]
         0x1d44bde90 <+224>:  ldr    w8, [x23, #0x10]
         0x1d44bde94 <+228>:  sub    x9, x29, #0x48
         0x1d44bde98 <+232>:  stur   w8, [x9, #-0x100]
         0x1d44bde9c <+236>:  ldrb   w8, [x23, #0x14]
         0x1d44bdea0 <+240>:  sub    x9, x29, #0x18
         0x1d44bdea4 <+244>:  stur   w8, [x9, #-0x100]
         
         body
         0x1d44bdde0 <+48>:   sub    x8, x29, #0x20
         0x1d44bdde4 <+52>:   stur   x1, [x8, #-0x100]
         
         self = *(self *)($x29 - 0xf8) <+256>
         x26 = error pointer
         */
        
        let state = signposter.beginInterval("addAttachment", id: .exclusive, "")
        
        if currentHasher != nil {
            if hash == nil {
                // 정말 self 할당이 맞는지 검증
                currentHasher = StrongHasher()
            }
            
            try body(self)
            
            // ?? <+944>
            if false {
                // currentHasher = nil 해줘야 하는지?
                // endInterval이 안 불리는 구조임
                return /* ??? */
            }
            
            let finalHash = currentHasher!.finialize()
            currentHasher = nil
        } else {
            let array = try Array<UInt8>(unsafeUninitializedCapacity: 16) { buffer, initializedCount in
                initializedCount = 16
                // append에서 CC_SHA1_Update가 이뤄짐
                try append(UnsafeBufferPointer<UInt8>(buffer))
            }
        }
        
        signposter.endInterval("addAttachment", state)
        
        fatalError("TODO")
    }
    
    package func append<Value>(_ buffer: UnsafeBufferPointer<Value>) throws {
        // override me
        fatalError()
    }
    
    package func append(_ data: Data) throws {
        // override me
        fatalError()
    }
}

package class DataArchiveWriter: ArchiveWriter {
    private var data: Data
    
    package override init() {
        fatalError("TODO")
    }
    
    package override func append<Value>(_ buffer: UnsafeBufferPointer<Value>) throws {
        fatalError("TODO")
    }
    
    package override func append(_ data: Data) throws {
        fatalError("TODO")
    }
}

fileprivate enum Error: Swift.Error {
    case ioError(Int)
    case unableToOpen
    case invalidSize
    case invalidMagic
    case invalidCount
    case invalidAttachment
    case readFailed
}
