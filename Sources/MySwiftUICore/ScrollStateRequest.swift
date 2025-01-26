import AttributeGraph
import CoreGraphics

package protocol ScrollStateRequest {
    var id: ObjectIdentifier { get }
    var kind: ScrollStateRequestKind { get }
    var transaction: Transaction { get }
    func updateScrollable(_ scrollable: AttributeGraph.Attribute<Scrollable>)
    var hasUpdate: Bool { get }
    func update() -> Bool
}

package enum ScrollStateRequestKind: CustomStringConvertible {
    case updateValue
    case scrollTo
    
    package var description: String {
        switch self {
        case .updateValue:
            "updateValue"
        case .scrollTo:
            "scrollTo"
        }
    }
}

package struct ScrollToScrollStateRequest: ScrollStateRequest {
    package var binding: Binding<ScrollPosition>
    package var UnitPoint: UnitPoint?
    package var id: ObjectIdentifier
    package var value: ScrollPosition
    package var baseTransaction: Transaction
    @AttributeGraph.Attribute package var scrollable: Scrollable?
    package let kind: ScrollStateRequestKind
    package let transaction: Transaction
    package let hasUpdate: Bool
    
    package init(binding: Binding<ScrollPosition>, UnitPoint: UnitPoint? = nil, id: ObjectIdentifier, value: ScrollPosition, baseTransaction: Transaction, scrollable: Scrollable? = nil, kind: ScrollStateRequestKind, transaction: Transaction, hasUpdate: Bool) {
        self.binding = binding
        self.UnitPoint = UnitPoint
        self.id = id
        self.value = value
        self.baseTransaction = baseTransaction
        _scrollable = AttributeGraph.Attribute(value: scrollable)
        self.kind = kind
        self.transaction = transaction
        self.hasUpdate = hasUpdate
    }
    
    package func updateScrollable(_ scrollable: Attribute<any Scrollable>) {
        fatalError("TODO")
    }
    
    package func update() -> Bool {
        fatalError("TODO")
    }
}
