internal import MRUIKit
internal import MySwiftUICore

extension MRUIPreferenceHost {
    subscript<T: MRUIBridgedPreferenceKey>(key: T.Type) -> T.Value {
        // sp + 0x30 -> sp + 0x10
        let preference = self.aggregatedPreference(forKey: T.anyBridgedKey) as AnyObject
        if let value = preference as? T.Value {
            return value
        } else {
            return T.value(from: unsafeBitCast(preference, to: T.BridgedValue.self))
        }
    }
}
