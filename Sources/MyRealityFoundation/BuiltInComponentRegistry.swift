private import CoreRE

@safe final class BuiltInComponentRegistry {
    private var componentInfoByType: [ObjectIdentifier : ComponentInfo] = Dictionary()
    private var componentInfoByREComponentClass: [OpaquePointer : ComponentInfo] = unsafe Dictionary()
    
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
        var result = "ComponentInfo"
        result.append("(type: \(_typeName(self.type, qualified: false)), access: \(self.access), \(self.availability))")
        return result
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
            let introducedDescription = "introduced: \(self.introduced.description)"
            
            let deprecatedDescription: String?
            if let deprecated {
                deprecatedDescription = "deprecated: \(deprecated.description)"
            } else {
                deprecatedDescription = nil
            }
            
            let obsoletedDescription: String?
            if let obsoleted {
                obsoletedDescription = "obsoleted: \(obsoleted.description)"
            } else {
                obsoletedDescription = nil
            }
            
            var result: [String] = []
            
            result.append(introducedDescription)
            
            if let deprecatedDescription {
                result.append(deprecatedDescription)
            }
            
            if let obsoletedDescription {
                result.append(obsoletedDescription)
            }
            
            return result.joined(separator: ", ")
        }
    }
    
    struct Platform : Equatable, CustomStringConvertible {
        let name: String
        let oldestSupportedVersion: ComponentInfo.PlatformVersion
        
        static let macOS = ComponentInfo.Platform(
            name: "macos",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("10.15")
        )
        
        static let macCatalyst = ComponentInfo.Platform(
            name: "maccatalyst",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("13.0")
        )
        
        static let iOS = ComponentInfo.Platform(
            name: "ios",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("13.0")
        )
        
        static let xrOS = ComponentInfo.Platform(
            name: "xros",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("1.0")
        )
        
        static let tvOS = ComponentInfo.Platform(
            name: "tvos",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("26.0")
        )
        
        var description: String {
            return self.name
        }
    }
    
    struct SupportedPlatform : Equatable, CustomStringConvertible {
        static func macOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .macOS,
                version: version
            )
        }
        
        static func macCatalyst(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .macCatalyst,
                version: version
            )
        }
        
        static func iOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .iOS,
                version: version
            )
        }
        
        static func visionOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .xrOS,
                version: version
            )
        }
        
        static func tvOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .tvOS,
                version: version
            )
        }
        
        let platform: ComponentInfo.Platform
        let version: ComponentInfo.PlatformVersion
        
        init(platform: ComponentInfo.Platform, version: ComponentInfo.PlatformVersion) {
            self.platform = platform
            self.version = version
        }
        
        var description: String {
            return "\(self.platform) \(self.version)"
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
            
            var values: [Int] = []
            
            for value in split {
                if let converted = Int(value) {
                    values.append(converted)
                }
            }
            
            // <+560>
            if values.count == 1 {
                self.version = ComponentInfo.Version(values[0], 0, 0)
            } else if values.count == 2 {
                self.version = ComponentInfo.Version(values[0], values[1], 0)
            } else if values.count == 3 {
                self.version = ComponentInfo.Version(values[0], values[1], values[2])
            } else {
                preconditionFailure("Unexpected number of components \(values)")
            }
        }
        
        var versionString: String {
            var result = "\(self.major).\(self.minor)"
            
            if self.patch != 0 {
                result.append(".\(self.patch)")
            }
            
            return result
        }
        
        var major: Int {
            return self.version.major
        }
        
        var minor: Int {
            return self.version.minor
        }
        
        var patch: Int {
            return self.version.patch
        }
        
        var description: String {
            return self.version.description
        }
        
        static func < (lhs: ComponentInfo.PlatformVersion, rhs: ComponentInfo.PlatformVersion) -> Bool {
            return lhs.version < rhs.version
        }
        
        static let unknown = ComponentInfo.PlatformVersion("0.0.0")
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
            return "\(self.major).\(self.minor).\(self.patch)"
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
