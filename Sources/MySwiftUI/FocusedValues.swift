internal import MySwiftUICore

public struct FocusedValues {
    var plist: PropertyList // 0x0
    var storageOptions: FocusedValues.StorageOptions // 0x8
    var navigationDepth: Int // 0x10
    var version: DisplayList.Version // 0x18
}

extension FocusedValues {
    struct StorageOptions : OptionSet {
        let rawValue: UInt8
    }
}
