private import CoreRE

@safe final class BuiltInComponentRegistry {
    private var componentInfoByType: [ObjectIdentifier : ComponentInfo] = Dictionary()
    private var componentInfoByREComponentClass: [OpaquePointer : ComponentInfo] = Dictionary()
    
    func register(_: ComponentInfo) {
        assertUnimplemented()
    }
    
    var allComponentInfo: [ComponentInfo] {
        assertUnimplemented()
    }
    
    func componentInfo(for component: (any MyRealityFoundation::Component.Type)) -> ComponentInfo? {
        assertUnimplemented()
    }
    
    func componentInfo(forClassOpaquePointer: OpaquePointer) -> ComponentInfo? {
        assertUnimplemented()
    }
    
    func componentInfo(ofComponentsAccessableAs access: ComponentInfo.Access) -> [ComponentInfo] {
        assertUnimplemented()
    }
}

@safe struct ComponentInfo : CustomStringConvertible {
    let bundleIdentifier: String // 0x0
    let type: any MyRealityFoundation::Component.Type // 0x10
    
    var reComponentType: Any? {
        guard let _reComponentType else {
            return nil
        }
        
        return _reComponentType
    }
    
    var reComponentClass: OpaquePointer? {
        return unsafe unsafeBitCast(self._reComponentClass, to: OpaquePointer?.self)
    }
    
    private let _reComponentType: CoreRE::ComponentType? // 0x20
    private let _reComponentClass: CoreRE::Component.ClassPtr? // 0x28
    let access: ComponentInfo.Access // 0x30
    let availability: ComponentInfo.Availability // 0x38
    
    init(
        bundleIdentifier: String,
        type: any MyRealityFoundation::Component.Type,
        reComponentClass: OpaquePointer?,
        access: ComponentInfo.Access,
        availability: ComponentInfo.Availability
    ) {
        self.bundleIdentifier = bundleIdentifier
        self.type = type
        unsafe self._reComponentClass = unsafeBitCast(reComponentClass, to: CoreRE::Component.ClassPtr?.self)
        self._reComponentType = nil
        self.access = access
        self.availability = availability
    }
    
    var description: String {
        assertUnimplemented()
    }
}

extension ComponentInfo {
    enum Access : Hashable {
        case `internal`
        case spi
        case api
    }
    
    struct Availability : CustomStringConvertible {
        let introduced: [ComponentInfo.SupportedPlatform]
        let deprecated: [ComponentInfo.SupportedPlatform]?
        let obsoleted: [ComponentInfo.SupportedPlatform]?
        
        init(
            introduced: [ComponentInfo.SupportedPlatform],
            deprecated: [ComponentInfo.SupportedPlatform]?,
            obsoleted: [ComponentInfo.SupportedPlatform]?
        ) {
            self.introduced = introduced
            self.deprecated = deprecated
            self.obsoleted = obsoleted
        }
        
        var description: String {
            assertUnimplemented()
        }
    }
    
    struct Platform : Equatable, CustomStringConvertible {
        private let name: String
        let oldestSupportedVersion: ComponentInfo.PlatformVersion
        
        static var macOS: ComponentInfo.Platform {
            assertUnimplemented()
        }
        
        static var macCatalyst: ComponentInfo.Platform {
            assertUnimplemented()
        }
        
        static var iOS: ComponentInfo.Platform {
            assertUnimplemented()
        }
        
        static var xrOS: ComponentInfo.Platform {
            assertUnimplemented()
        }
        
        static var tvOS: ComponentInfo.Platform {
            assertUnimplemented()
        }
        
        var description: String {
            assertUnimplemented()
        }
    }
    
    struct SupportedPlatform : Equatable, CustomStringConvertible {
        static func macOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            assertUnimplemented()
        }
        
        static func macCatalyst(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            assertUnimplemented()
        }
        
        static func iOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            assertUnimplemented()
        }
        
        static func visionOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            assertUnimplemented()
        }
        
        static func tvOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            assertUnimplemented()
        }
        
        let platform: ComponentInfo.Platform
        let version: ComponentInfo.PlatformVersion
        
        init(platform: ComponentInfo.Platform, version: ComponentInfo.PlatformVersion) {
            assertUnimplemented()
        }
        
        var description: String {
            assertUnimplemented()
        }
    }
    
    struct PlatformVersion : Comparable, ExpressibleByStringLiteral, CustomStringConvertible {
        private let version: ComponentInfo.Version
        
        init(stringLiteral value: String) {
            self.init(value)
        }
        
        init(_ value: String) {
            /*
             value -> x0/x1 -> x21/x20
             return pointer -> x8 -> x19
             */
            // x23
            let split = value.split(separator: ".")
            assertUnimplemented()
        }
        
        var versionString: String {
            assertUnimplemented()
        }
        
        var major: Int {
            assertUnimplemented()
        }
        
        var minor: Int {
            assertUnimplemented()
        }
        
        var patch: Int {
            assertUnimplemented()
        }
        
        var description: String {
            assertUnimplemented()
        }
        
        static func < (lhs: ComponentInfo.PlatformVersion, rhs: ComponentInfo.PlatformVersion) -> Bool {
            assertUnimplemented()
        }
        
        static var unknown: ComponentInfo.PlatformVersion {
            assertUnimplemented()
        }
    }
    
    struct Version : Comparable, CustomStringConvertible {
        static func < (lhs: ComponentInfo.Version, rhs: ComponentInfo.Version) -> Bool {
            let lhsArray = [lhs.major, lhs.minor, lhs.patch]
            let rhsArray = [rhs.major, rhs.minor, rhs.patch]
            
            if lhsArray == rhsArray {
                return false
            }
            
            return lhsArray.lexicographicallyPrecedes(rhsArray)
        }
        
        var description: String {
            assertUnimplemented()
        }
        
        let major: Int
        let minor: Int
        let patch: Int
        
        init(_ major: Int, _ minor: Int, _ patch: Int) {
            self.major = major
            self.minor = minor
            self.patch = patch
        }
    }
}
