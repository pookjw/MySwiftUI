import Foundation
import CoreText
import _MySwiftUICShims

package struct ProtobufDecoder {
    private var data: Data
    private var ptr: UnsafeRawPointer
    private var end: UnsafeRawPointer
    private var packedField: ProtobufFormat.Field
    private var packedEnd: UnsafeRawPointer
    private var stack: [UnsafeRawPointer]
    private var userInfo: [CodingUserInfoKey: Any]
    
    package init(_ data: Data) {
        fatalError("TODO")
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
}
