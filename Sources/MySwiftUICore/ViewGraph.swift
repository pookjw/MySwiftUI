#warning("TODO AttributeGraph")

package final class ViewGraph {
    package init<C>(
        rootViewType: C.Type = C.self,
        requestedOutputs: Outputs = .defaults
    ) where C: View {
        fatalError("TODO")
    }
}

extension ViewGraph {
    package struct Outputs: OptionSet, Equatable {
        package static var displayList: Outputs { Outputs(rawValue: 1 << 0) }
        package static var platformItemList: Outputs { Outputs(rawValue: 1 << 1) }
        package static var viewResponder: Outputs { Outputs(rawValue: 1 << 2) }
        package static var layout: Outputs { Outputs(rawValue: 1 << 4) }
        package static var focus: Outputs { Outputs(rawValue: 1 << 5) }
        
        package static var all: Outputs { Outputs(rawValue: 0xFF) }
        
        // 0x37 = 00000000 00000000 00000000 00110111
        package static let defaults: Outputs = [.displayList, .platformItemList, .layout, .focus]
        
        package let rawValue: UInt8
        
        package init(rawValue: UInt8) {
            self.rawValue = rawValue
        }
    }
}
