internal import MRUIKit
internal import MySwiftUICore

extension MRUIPreferenceHost {
    subscript<T : MRUIBridgedPreferenceKey>(key: T.Type) -> T.Value {
        // sp + 0x30 -> sp + 0x10
        guard let preference = self.aggregatedPreference(forKey: T.anyBridgedKey) else {
            return T.value(from: nil)
        }

        guard let bridgedValue = preference as? T.BridgedValue else {
            return T.defaultValue
        }

        return T.value(from: bridgedValue)
    }
}
