@available(macOS 15.0, iOS 18.0, macCatalyst 18.0, visionOS 2.0, tvOS 26.0, *)
public struct BlendShapeWeightsData : Identifiable {
    public typealias ID = String
    
    public init(id: BlendShapeWeightsData.ID, weights: [(String, BlendShapeWeights.Element)]) {
        assertUnimplemented()
    }
    
    public var id: BlendShapeWeightsData.ID {
        get {
            assertUnimplemented()
        }
    }
    
    public var weights: BlendShapeWeights {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public var weightNames: [String] {
        get {
            assertUnimplemented()
        }
    }
}
