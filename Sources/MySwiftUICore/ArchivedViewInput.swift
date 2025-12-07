struct ArchivedViewInput: ViewInput {
    static let defaultValue = ArchivedViewInput.Value(flags: [], deploymentVersion: .current)
}

extension ArchivedViewInput {
    struct Flags: OptionSet {
        static var customFontURLs: ArchivedViewInput.Flags {
            return ArchivedViewInput.Flags(rawValue: 1 << 2)
        }
        
        static var assetCatalogRefences: ArchivedViewInput.Flags {
            return ArchivedViewInput.Flags(rawValue: 1 << 3)
        }
        
        static var preciseTextLayout: ArchivedViewInput.Flags {
            return ArchivedViewInput.Flags(rawValue: 1 << 4)
        }
        
        static var intelligenceContent: ArchivedViewInput.Flags {
            return ArchivedViewInput.Flags(rawValue: 1 << 5)
        }
        
        static var isArchived: ArchivedViewInput.Flags {
            return ArchivedViewInput.Flags(rawValue: 1 << 0)
        }
        
        static var stableIDs: ArchivedViewInput.Flags {
            return ArchivedViewInput.Flags(rawValue: 1 << 1)
        }
        
        let rawValue: UInt8
    }
    
    struct Value: Equatable {
        static var isArchived: ArchivedViewInput.Value {
            return ArchivedViewInput.Value(flags: .isArchived, deploymentVersion: .current)
        }
        
        var flags: ArchivedViewInput.Flags
        var deploymentVersion: ArchivedViewInput.DeploymentVersion
        
        init(flags: ArchivedViewInput.Flags, deploymentVersion: ArchivedViewInput.DeploymentVersion) {
            self.flags = flags
            self.deploymentVersion = deploymentVersion
        }
        
        var isArchived: Bool {
            return flags.contains(.isArchived)
        }
        
        var customFontURLs: Bool {
            return flags.contains(.customFontURLs)
        }
        
        var preciseTextLayout: Bool {
            return flags.contains(.preciseTextLayout)
        }
        
        var stableIDs: Bool {
            return flags.contains(.stableIDs)
        }
        
        var assetCatalogRefences: Bool {
            return flags.contains(.assetCatalogRefences)
        }
    }
    
    struct DeploymentVersion: Hashable, Comparable, Codable {
        static func < (lhs: ArchivedViewInput.DeploymentVersion, rhs: ArchivedViewInput.DeploymentVersion) -> Bool {
            return lhs.rawValue < rhs.rawValue
        }
        
        static var v5: ArchivedViewInput.DeploymentVersion {
            return ArchivedViewInput.DeploymentVersion(rawValue: 1)
        }
        
        static var v6: ArchivedViewInput.DeploymentVersion {
            return ArchivedViewInput.DeploymentVersion(rawValue: 2)
        }
        
        static var v7: ArchivedViewInput.DeploymentVersion {
            return ArchivedViewInput.DeploymentVersion(rawValue: 3)
        }
        
        static var current: ArchivedViewInput.DeploymentVersion {
            return .v7
        }
        
        static var oldest: ArchivedViewInput.DeploymentVersion {
            return .v5
        }
        
        let rawValue: Int8
    }
}
