// 49A76CA1B5E4F66260081F1C9EDD4305

extension _GraphInputs {
    package var updateCycleUseSetNeedsLayout: Bool {
        get {
            return self[UpdateCycleUseSetNeedsLayoutKey.self]
        }
        set {
            self[UpdateCycleUseSetNeedsLayoutKey.self] = newValue
        }
        _modify {
            yield &self[UpdateCycleUseSetNeedsLayoutKey.self]
        }
    }
    
    fileprivate struct UpdateCycleUseSetNeedsLayoutKey: GraphInput {
        static var defaultValue: Bool {
            // SDK 확인이 있음
            fatalError("TODO")
        }
    }
}
