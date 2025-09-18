#warning("TODO")
@_spi(Internal) internal import MySwiftUICore
internal import AttributeGraph

// TODO: final인지 검증
class AppGraph: GraphHost {
    static nonisolated(unsafe) var shared: AppGraph? = nil
    
    // TODO: Attributes
    @Attribute private(set) var focusedValues: FocusedValues
    
    init() {
        fatalError("TODO")
    }
}
