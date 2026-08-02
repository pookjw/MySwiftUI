internal import CoreRE

@safe final class BuiltInComponentRegistry {
    private var componentInfoByType: [ObjectIdentifier : ComponentInfo] = [:]
    private var componentInfoByREComponentClass: [OpaquePointer : ComponentInfo] = unsafe [:]
    
    func register(_ info: ComponentInfo) {
        self.componentInfoByType[ObjectIdentifier(info.type)] = info
        
        if let reComponentClass = unsafe info.reComponentClass {
            unsafe self.componentInfoByREComponentClass[reComponentClass] = info
        }
    }
    
    var allComponentInfo: [ComponentInfo] {
        return Array(self.componentInfoByType.values)
    }
    
    func componentInfo(for type: (any MyRealityFoundation::Component.Type)) -> ComponentInfo? {
        return self.componentInfoByType[ObjectIdentifier(type)]
    }
    
    func componentInfo(forClassOpaquePointer componentClass: OpaquePointer) -> ComponentInfo? {
        return unsafe self.componentInfoByREComponentClass[componentClass]
    }
    
    func componentInfo(ofComponentsAccessableAs access: ComponentInfo.Access) -> [ComponentInfo] {
        return self
            .componentInfoByType
            .values
            .filter { $0.access == access }
    }
}

@safe @_spi(Internal) public struct ComponentInfo : CustomStringConvertible {
    public let bundleIdentifier: String // 0x0
    public let type: any MyRealityFoundation::Component.Type // 0x10
    
    public var reComponentType: Any? {
        guard let _reComponentType else {
            return nil
        }
        
        return _reComponentType
    }
    
    public var reComponentClass: OpaquePointer? {
        return unsafe unsafeBitCast(self._reComponentClass, to: OpaquePointer?.self)
    }
    
    private let _reComponentType: CoreRE::ComponentType? // 0x20
    private let _reComponentClass: CoreRE::Component.ClassPtr? // 0x28
    public let access: ComponentInfo.Access // 0x30
    public let availability: ComponentInfo.Availability // 0x38
    
    public init(
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
    
    @inline(always) // 원래 없음
    init(
        bundleIdentifier: String,
        type: any MyRealityFoundation::Component.Type,
        reComponentType: CoreRE::ComponentType?,
        reComponentClass: CoreRE::Component.ClassPtr?,
        access: ComponentInfo.Access,
        availability: ComponentInfo.Availability
    ) {
        self.bundleIdentifier = bundleIdentifier
        self.type = type
        self._reComponentType = reComponentType
        self._reComponentClass = reComponentClass
        self.access = access
        self.availability = availability
    }
    
    public var description: String {
        var result = "ComponentInfo"
        result.append("(type: \(_typeName(self.type, qualified: false)), access: \(self.access), \(self.availability))")
        return result
    }
}

extension ComponentInfo {
    public enum Access : Hashable, Sendable {
        case `internal`
        case spi
        case api
    }
    
    public struct Availability : CustomStringConvertible, Sendable {
        public let introduced: [ComponentInfo.SupportedPlatform]
        public let deprecated: [ComponentInfo.SupportedPlatform]?
        public let obsoleted: [ComponentInfo.SupportedPlatform]?
        
        public init(
            introduced: [ComponentInfo.SupportedPlatform],
            deprecated: [ComponentInfo.SupportedPlatform]?,
            obsoleted: [ComponentInfo.SupportedPlatform]?
        ) {
            self.introduced = introduced
            self.deprecated = deprecated
            self.obsoleted = obsoleted
        }
        
        public var description: String {
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
    
    public struct Platform : Equatable, CustomStringConvertible, Sendable {
        public let name: String
        public let oldestSupportedVersion: ComponentInfo.PlatformVersion
        
        public static let macOS = ComponentInfo.Platform(
            name: "macos",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("10.15")
        )
        
        public static let macCatalyst = ComponentInfo.Platform(
            name: "maccatalyst",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("13.0")
        )
        
        public static let iOS = ComponentInfo.Platform(
            name: "ios",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("13.0")
        )
        
        public static let xrOS = ComponentInfo.Platform(
            name: "xros",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("1.0")
        )
        
        public static let tvOS = ComponentInfo.Platform(
            name: "tvos",
            oldestSupportedVersion: ComponentInfo.PlatformVersion("26.0")
        )
        
        public var description: String {
            return self.name
        }
    }
    
    public struct SupportedPlatform : Equatable, CustomStringConvertible, Sendable {
        public static func macOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .macOS,
                version: version
            )
        }
        
        public static func macCatalyst(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .macCatalyst,
                version: version
            )
        }
        
        public static func iOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .iOS,
                version: version
            )
        }
        
        public static func visionOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .xrOS,
                version: version
            )
        }
        
        public static func tvOS(_ version: ComponentInfo.PlatformVersion) -> ComponentInfo.SupportedPlatform {
            return ComponentInfo.SupportedPlatform(
                platform: .tvOS,
                version: version
            )
        }
        
        public let platform: ComponentInfo.Platform
        public let version: ComponentInfo.PlatformVersion
        
        public init(platform: ComponentInfo.Platform, version: ComponentInfo.PlatformVersion) {
            self.platform = platform
            self.version = version
        }
        
        public var description: String {
            return "\(self.platform) \(self.version)"
        }
    }
    
    public struct PlatformVersion : Comparable, ExpressibleByStringLiteral, CustomStringConvertible, Sendable {
        private let version: ComponentInfo.Version
        
        public init(stringLiteral value: String) {
            self.init(value)
        }
        
        public init(_ value: String) {
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
        
        public var versionString: String {
            var result = "\(self.major).\(self.minor)"
            
            if self.patch != 0 {
                result.append(".\(self.patch)")
            }
            
            return result
        }
        
        public var major: Int {
            return self.version.major
        }
        
        public var minor: Int {
            return self.version.minor
        }
        
        public var patch: Int {
            return self.version.patch
        }
        
        public var description: String {
            return self.version.description
        }
        
        public static func < (lhs: ComponentInfo.PlatformVersion, rhs: ComponentInfo.PlatformVersion) -> Bool {
            return lhs.version < rhs.version
        }
        
        public static let unknown = ComponentInfo.PlatformVersion("0.0.0")
    }
    
    public struct Version : Comparable, CustomStringConvertible, Sendable {
        public static func < (lhs: ComponentInfo.Version, rhs: ComponentInfo.Version) -> Bool {
            let lhsArray = [lhs.major, lhs.minor, lhs.patch]
            let rhsArray = [rhs.major, rhs.minor, rhs.patch]
            
            if lhsArray == rhsArray {
                return false
            }
            
            return lhsArray.lexicographicallyPrecedes(rhsArray)
        }
        
        public var description: String {
            return "\(self.major).\(self.minor).\(self.patch)"
        }
        
        public let major: Int
        public let minor: Int
        public let patch: Int
        
        public init(_ major: Int, _ minor: Int, _ patch: Int) {
            self.major = major
            self.minor = minor
            self.patch = patch
        }
    }
}
