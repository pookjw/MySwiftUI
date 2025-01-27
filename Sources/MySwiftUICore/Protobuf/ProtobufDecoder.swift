import Foundation
import CoreText
import _MySwiftUICShims

package struct ProtobufDecoder {
    package enum DecodingError: Swift.Error {
        case failed
    }
    
    private var data: Data
    private var ptr: UnsafeRawPointer
    private var end: UnsafeRawPointer
    private var packedField: ProtobufFormat.Field
    private var packedEnd: UnsafeRawPointer
    private var stack: [UnsafeRawPointer]
    private var userInfo: [CodingUserInfoKey: Any]
    
    package init(_ data: Data) {
        let nsData = data as NSData
        let bytes = nsData.bytes
        
        self.data = data
        ptr = bytes
        end = bytes.advanced(by: data.count)
        packedField = ProtobufFormat.Field(rawValue: 0)
        packedEnd = bytes
        stack = []
        userInfo = [:]
    }
    
    package var preferredBundleLanguage: String? {
        userInfo[ArchivedViewCore.preferredBundleLanguageKey] as? String
    }
    
    package var preferredCompositionLanguag: CTCompositionLanguage {
        (userInfo[ArchivedViewCore.preferredCompositionLanguage] as? CTCompositionLanguage) ?? .unset
    }
    
    package var archiveReader: ArchiveReader? {
        userInfo[ArchiveReader.readerKey] as? ArchiveReader
    }
    
    package func value<Value>(fromBinaryPlist data: Data, type: Value.Type) throws -> Value where Value : Decodable {
        let decoder = PropertyListDecoder()
        let decoded = try decoder.decode([Value].self, from: data)
        
        guard let value = decoded.first else {
            throw DecodingError.failed
        }
        
        return value
    }
    
    package func nextField() throws -> ProtobufFormat.Field? {
        fatalError("TODO")
    }
}
