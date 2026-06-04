public import Foundation

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __REAnchoringType : Codable, Equatable {
    case surface(alignment: __REAnchoringType.Alignment, classification: __REAnchoringType.Classification)
    case image(url: URL, physicalWidth: Measurement<UnitLength>)
    case face(meshVertex: Int)
    case object(url: URL)
    
    public enum Name : String, CaseIterable {
        case surface
        case image
        case face
        case object
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias AllCases = [__REAnchoringType.Name]
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = String
        
        nonisolated public static var allCases: [__REAnchoringType.Name] {
            get {
                assertUnimplemented()
            }
        }
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var name: __REAnchoringType.Name {
        get {
            assertUnimplemented()
        }
    }
    
    public init(from decoder: any Decoder) throws {
        assertUnimplemented()
    }
    
    public func encode(to encoder: any Encoder) throws {
        assertUnimplemented()
    }
    
    public struct Alignment : OptionSet, Codable {
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        public let rawValue: Int
        
        @safe public static nonisolated(unsafe) let horizontal: __REAnchoringType.Alignment = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let vertical: __REAnchoringType.Alignment = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let any: __REAnchoringType.Alignment = {
            assertUnimplemented()
        }()
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias ArrayLiteralElement = __REAnchoringType.Alignment
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias Element = __REAnchoringType.Alignment
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = Int
    }
    
    public struct Classification : OptionSet, Codable {
        public init(rawValue: Int) {
            assertUnimplemented()
        }
        
        public let rawValue: Int
        
        @safe public static nonisolated(unsafe) let wall: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let floor: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let ceiling: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let table: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let seat: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @safe public static nonisolated(unsafe) let any: __REAnchoringType.Classification = {
            assertUnimplemented()
        }()
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias ArrayLiteralElement = __REAnchoringType.Classification
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias Element = __REAnchoringType.Classification
        
        @available(iOS 13.0, tvOS 26.0, macOS 10.15, macCatalyst 13.0, *)
        public typealias RawValue = Int
    }
    
    public static func == (a: __REAnchoringType, b: __REAnchoringType) -> Bool {
        assertUnimplemented()
    }
}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAnchoringType.Name : Equatable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAnchoringType.Name : Hashable {}

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension __REAnchoringType.Name : RawRepresentable {}
