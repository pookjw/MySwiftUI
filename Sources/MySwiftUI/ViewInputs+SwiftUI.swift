internal import MySwiftUICore

protocol PlatformItemListFlags {
    static var flags: PlatformItemListFlagsSet {
        get
    }
}

struct PlatformItemListFlagsSet : OptionSet {
    private(set) var rawValue: UInt32
    
    static var unknown4: PlatformItemListFlagsSet {
        return PlatformItemListFlagsSet(rawValue: 1 << 4)
    }
}

extension PlatformItemListFlagsSet {
    // type descriptor는 존재하지 않음
    enum EditOperation {
        case unknown0
        case unknown1
    }
}

struct PlatformItemListFlagsInput : ViewInput {
    static var defaultValue: PlatformItemListFlagsSet {
        return PlatformItemListFlagsSet(rawValue: .max)
    }
}
