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
    private let attachments: UInt64
    
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
        var x9 = x8 - 0x4
        
        if x9 < UInt(bitPattern: x0) {
            throw Error.invalidSize
        }
        
        x9 = UnsafePointer<UInt>(bitPattern: x9)
            .unsafelyUnwrapped
            .pointee
        
        if x9 != 0xD1561A71 {
            throw Error.invalidMagic
        }
        
        var x10 = x8
        let x11 = UnsafePointer<UInt>(bitPattern: x10 - 0x8)
            .unsafelyUnwrapped
            .pointee
        
        var x12 = x11 &<< 0x4
        var x9_2 = Int(x12)
        x12 = x10 - x12
        
        if x12 < UInt(bitPattern: x0) {
            throw Error.invalidCount
        }
        
        x10 = x12 - UInt(bitPattern: x0)
        
        fatalError("TODO")
    }
}

extension ArchiveReader: RandomAccessCollection {
    package var startIndex: Int { buffer.startIndex }
    package var endIndex: Int { buffer.endIndex }
    
    package subscript(index: Int) -> Data {
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
