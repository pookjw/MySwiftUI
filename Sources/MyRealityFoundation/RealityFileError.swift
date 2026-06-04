@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
public enum __RealityFileError : Error, CustomDebugStringConvertible {
    case unsupportedVersion(Int)
    case archiveLoadFailed
    case headerParseFailed
    case assetMapParseFailed
    case deduplicationInformationParseFailed
    case contentsLoadFailed
    case assetBundleCreationFailed
    case invalidVersion(Int)
    @available(macOS 13.0, iOS 16.0, macCatalyst 16.0, tvOS 26.0, *)
    case invalidTargetPlatform(__REAssetBundle.ExportOptions.PlatformOS)
    case noBundleIdentifier(String)
    case generic(String)
    
    public var debugDescription: String {
        get {
            assertUnimplemented()
        }
    }
}
