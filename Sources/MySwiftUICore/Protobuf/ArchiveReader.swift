import Foundation

package final class ArchiveReader {
    package static let readerKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader").unsafelyUnwrapped
    package static let cacheKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader.cache").unsafelyUnwrapped
    package static let namedImagesKey = CodingUserInfoKey(rawValue: "com.apple.SwiftUI.ArchiveReader.namedImages").unsafelyUnwrapped
    
    private let buffer: UnsafeBufferPointer<UInt8>
    private let attachments: UInt64
    
    init(buffer: UnsafeBufferPointer<UInt8>) throws {
        
    }
    
    package var startIndex: Int { buffer.startIndex }
    package var endIndex: Int { buffer.endIndex }
    
    subscript(index: Int) -> Data {
        
    }
}
