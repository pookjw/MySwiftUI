@_spi(Internal) public enum SeparatedState : Int {
    case none
    case tracked
    case separated
}

package protocol _DisplayList_SeparatedItemModifier : Hashable {
    var ids: AnyHashable { get }
    func apply(to list: inout DisplayList, parent: DisplayList)
}

extension _DisplayList_SeparatedItemModifier {
    var ids: AnyHashable {
        assertUnimplemented()
    }
}

package struct SeparationProperties {
    private var state: SeparatedState // 0x0
    private var options: SeparatedOptionValues // 0x8
    private var isContainer: Bool // 0x10
    private var hasGroundingShadow: Bool // 0x11
    private var wantsDropShadow: Bool // 0x12
    
    init(
        state: SeparatedState = .separated,
        options: SeparatedOptionValues = SeparatedOptionValues(),
        isContainer: Bool = true,
        hasGroundingShadow: Bool = false,
        wantsDropShadow: Bool = false
    ) {
        self.state = state
        self.options = options
        self.isContainer = isContainer
        self.hasGroundingShadow = hasGroundingShadow
        self.wantsDropShadow = wantsDropShadow
    }
}

extension SeparatedState : Equatable, Hashable, Comparable {
    public static func < (lhs: SeparatedState, rhs: SeparatedState) -> Bool {
        return lhs.rawValue < rhs.rawValue
    }
}
