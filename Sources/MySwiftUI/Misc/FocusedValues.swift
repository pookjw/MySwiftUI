internal import MySwiftUICore

public struct FocusedValues {
    var plist = PropertyList()
    var storageOptions: FocusedValues.StorageOptions = []
    var navigationDepth: Int = 0
    var version = DisplayList.Version()
    
    init() {}
}

extension FocusedValues {
    struct StorageOptions: OptionSet {
        let rawValue: UInt8
    }
}
