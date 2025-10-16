internal import MySwiftUICore

extension _ViewInputs {
    func addPlatformItemListKey<T: PlatformItemListFlags>(flags: T.Type, editOperation: PlatformItemListFlagsSet.EditOperation?) {
        
    }
}

protocol PlatformItemListFlags {
    static var flags: PlatformItemListFlagsSet {
        get
    }
}

struct PlatformItemListFlagsSet: OptionSet {
    var rawValue: UInt32
}

extension PlatformItemListFlagsSet {
    // type descriptor는 존재하지 않음
    enum EditOperation {
        case unknown0
        case unknown1
    }
}

struct PlatformItemListFlagsInput: ViewInput {
    static var defaultValue: PlatformItemListFlagsSet {
        return PlatformItemListFlagsSet(rawValue: .max)
    }
}
