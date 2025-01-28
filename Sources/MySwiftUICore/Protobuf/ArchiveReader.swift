import Foundation

/*
 TODO:
 FileArchiveReader
 DataArchiveReader
 ArchiveWriter
 FileArchiveWriter
 DataArchiveWrite
 */

package final class ArchiveReader {
    package static let readerKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader").unsafelyUnwrapped
    package static let cacheKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader.cache").unsafelyUnwrapped
    package static let namedImagesKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader.namedImages").unsafelyUnwrapped
    
    private let buffer: UnsafeBufferPointer<UInt8>
    private let attachments: (offset: UInt, size: UInt)
    
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
        attachments = (offset: x12, size: x11)
        
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
}

extension ArchiveReader: RandomAccessCollection {
    package var startIndex: Int { 0 }
    package var endIndex: Int { Int(attachments.size) }
    
    package subscript(index: Int) -> Data {
        var x22 = UInt(index)
        let x23 = UInt(bitPattern: buffer.baseAddress)
        assert(x23 != 0)
        var x8 = attachments.offset
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

fileprivate enum Error: Swift.Error {
    case ioError(Int)
    case unableToOpen
    case invalidSize
    case invalidMagic
    case invalidCount
    case invalidAttachment
    case readFailed
}
