internal import Foundation
private import AttributeGraph
internal import MySwiftUICore

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
@MainActor @preconcurrency struct ManipulationGeometryModifier: PrimitiveViewModifier, MultiViewModifier {
    private let id: UUID
    
    @usableFromInline
    nonisolated init(id: UUID) {
        self.id = id
    }
    
    public nonisolated static func _makeView(modifier: _GraphValue<ManipulationGeometryModifier>, inputs: _ViewInputs, body: @escaping (_Graph, _ViewInputs) -> _ViewOutputs) -> _ViewOutputs {
        fatalError("TODO")
    }
    
    
    typealias Body = Never
    
    // TODO
}

@available(*, unavailable)
extension ManipulationGeometryModifier: Sendable {
}

@available(visionOS 26.0, *)
@available(iOS, unavailable)
@available(macOS, unavailable)
@available(watchOS, unavailable)
@available(tvOS, unavailable)
extension ManipulationGeometryModifier: ViewModifier {
    
}

extension ManipulationGeometryModifier {
    fileprivate struct GeometryPreferenceValue: Rule {
        @Attribute private var geometry: ObjectManipulationGeometry
        @Attribute private var id: UUID
        
        var value: Never {
            fatalError("TODO")
        }
    }
}
