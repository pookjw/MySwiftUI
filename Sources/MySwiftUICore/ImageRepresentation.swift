// 9FE4F19E3F2D6B2A0FD05C040386BBC3
package import AttributeGraph

extension _ViewInputs {
    package var requestedImageRepresentation: (any PlatformImageRepresentable.Type)? {
        get {
            return self[_GraphInputs.ImageRepresentationKey.self]
        }
        set {
            self[_GraphInputs.ImageRepresentationKey.self] = newValue
        }
    }
    
    package var requestedNamedImageRepresentation: (any PlatformNamedImageRepresentable.Type)? {
        get {
            return self[_GraphInputs.NamedImageRepresentationKey.self]
        }
        set {
            self[_GraphInputs.NamedImageRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    package var requestedImageRepresentation: (any PlatformImageRepresentable.Type)? {
        get {
            return self[_GraphInputs.ImageRepresentationKey.self]
        }
        set {
            self[_GraphInputs.ImageRepresentationKey.self] = newValue
        }
    }
    
    package var requestedNamedImageRepresentation: (any PlatformNamedImageRepresentable.Type)? {
        get {
            return self[_GraphInputs.NamedImageRepresentationKey.self]
        }
        set {
            self[_GraphInputs.NamedImageRepresentationKey.self] = newValue
        }
    }
}

extension _GraphInputs {
    fileprivate struct ImageRepresentationKey : ViewInput {
        static var defaultValue: (any PlatformImageRepresentable.Type)? {
            return nil
        }
    }
    
    fileprivate struct NamedImageRepresentationKey : ViewInput {
        static var defaultValue: (any PlatformNamedImageRepresentable.Type)? {
            return nil
        }
    }
}

package protocol PlatformImageRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func makeRepresentation(inputs: _ViewInputs, context: Attribute<PlatformImageRepresentableContext>, outputs: inout _ViewOutputs)
}

package struct PlatformImageRepresentableContext {
    private var image: Image.Resolved
    private var tintColor: Color?
    private var foregroundStyle: AnyShapeStyle?
}

package protocol PlatformNamedImageRepresentable {
    static func shouldMakeRepresentation(inputs: _ViewInputs) -> Bool
    static func makeRepresentation(inputs: _ViewInputs, context: Attribute<PlatformNamedImageRepresentableContext>, outputs: inout _ViewOutputs)
}

package struct PlatformNamedImageRepresentableContext {
    private var image: Image
    private var environment: EnvironmentValues
}
