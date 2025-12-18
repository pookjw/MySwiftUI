// E7547C80DE3C7109A44F15E50A35C84F
internal import AttributeGraph
internal import CoreGraphics

extension _GraphInputs {
    mutating func resetScrollPosition(kind: ScrollStateInputKind) {
        switch kind {
        case .scrollView:
            self[ScrollPositionKey.self] = nil
            self[ScrollPositionAnchorKey.self] = OptionalAttribute()
        case .scrollContent:
            self[ContentScrollPositionKey.self] = nil
            self[ContentScrollPositionAnchorKey.self] = OptionalAttribute()
        }
    }
    
    func setScrollPosition(storage: ScrollPositionStorage?, kind: ScrollStateInputKind) {
        fatalError("TODO")
    }
    
    func convertScrollStateInputsToContent() {
        fatalError("TODO")
    }
    
    fileprivate struct ScrollPositionKey: GraphInput {
        static var defaultValue: ScrollPositionStorage? {
            return nil
        }
    }
    
    fileprivate struct ScrollPositionAnchorKey: GraphInput {
        static let defaultValue = OptionalAttribute<UnitPoint?>()
    }
    
    fileprivate struct ContentScrollPositionKey: GraphInput {
        static var defaultValue: ScrollPositionStorage? {
            return nil
        }
    }
    
    fileprivate struct ContentScrollPositionAnchorKey: GraphInput {
        static let defaultValue = OptionalAttribute<UnitPoint?>()
    }
}

enum ScrollStateInputKind {
    case scrollView
    case scrollContent
}

enum ScrollPositionStorage {
    case binding(Attribute<Binding<ScrollPosition>>)
    case value(Attribute<ScrollPosition>)
}

public struct ScrollPosition: Sendable {
    private var storage: ScrollPosition.Storage
    @safe private nonisolated(unsafe) var idType: any Hashable.Type
    private var seed: UInt
}

extension ScrollPosition {
    enum Storage: Sendable {
        case viewID(ScrollPosition.ViewID)
        case edge(Edge)
        case point(CGPoint)
        case x(CGFloat)
        case y(CGFloat)
        case automatic
        case positionedByUser
    }
    
    struct ViewID: @unchecked Sendable {
        private var id: any Hashable
        private var anchor: UnitPoint?
    }
}
