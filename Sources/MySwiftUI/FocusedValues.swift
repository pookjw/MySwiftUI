internal import MySwiftUICore

public struct FocusedValues {
    var plist = PropertyList() // 0x0
    var storageOptions: FocusedValues.StorageOptions = [] // 0x8
    var navigationDepth: Int = -1 // 0x10
    var version = DisplayList.Version() // 0x18
    
    init() {}
}

extension FocusedValues {
    struct StorageOptions : OptionSet {
        let rawValue: UInt8
    }
}
