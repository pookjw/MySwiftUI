public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public struct __Archiving {
    public static func archivePackage(source: URL, destination: URL, envelopeVersion: __AssetBundleEnvelopeVersion, compressionLevel: Int? = nil, progress: Progress? = nil) throws {
        assertUnimplemented()
    }
    
    @available(*, deprecated, message: "will be removed")
    public static func unarchivePackage(source: URL, destination: URL) throws {
        assertUnimplemented()
    }
    
    public static func unarchivePackage(source: URL, destination: URL, withReport report: __REArchivalStats? = nil) throws {
        assertUnimplemented()
    }
    
    public enum ArchivingError : Error {
        case couldNotUnarchive
        case couldNotArchive
        
        public static func == (a: __Archiving.ArchivingError, b: __Archiving.ArchivingError) -> Bool {
            assertUnimplemented()
        }
        
        public func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        public var hashValue: Int {
            get {
                assertUnimplemented()
            }
        }
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __Archiving.ArchivingError : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __Archiving.ArchivingError : Hashable {}
