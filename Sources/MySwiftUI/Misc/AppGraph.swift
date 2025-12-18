@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph

// TODO: final인지 검증
class AppGraph: GraphHost {
    static nonisolated(unsafe) var shared: AppGraph? = nil
    
    // TODO: Attributes
    @Attribute private(set) var focusedValues: FocusedValues
    @Attribute private(set) var focusStore: FocusStore
    
    init() {
        fatalError("TODO")
    }
    
    final func graphDidChange() {
        fatalError("TODO")
    }
    
    // 원래 없음
    @inlinable
    @discardableResult
    final func updateFocusedValues(_ value: FocusedValues) -> Bool {
        return self._focusedValues.setValue(value)
    }
    
    // 원래 없음
    @inlinable
    @discardableResult
    final func updateFocusStore(_ store: FocusStore) -> Bool {
        return self._focusStore.setValue(store)
    }
}
