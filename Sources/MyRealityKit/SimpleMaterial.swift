public import UIKit

@available(macOS 10.15, iOS 13.0, macCatalyst 13.0, tvOS 26.0, *)
extension SimpleMaterial {
    @available(macOS, deprecated: 12.0, renamed: "color")
    @available(iOS, deprecated: 15.0, renamed: "color")
    @available(macCatalyst, deprecated: 15.0, renamed: "color")
    @available(visionOS, deprecated: 1.0, renamed: "color")
    @available(tvOS, unavailable)
    public var tintColor: UIColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    @available(macOS, deprecated: 12.0, renamed: "color")
    @available(iOS, deprecated: 15.0, renamed: "color")
    @available(macCatalyst, deprecated: 15.0, renamed: "color")
    @available(visionOS, deprecated: 1.0, renamed: "color")
    @available(tvOS, unavailable)
    public var baseColor: MaterialColorParameter {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
    
    public init(color: SimpleMaterial.Color, roughness: MaterialScalarParameter = 0.0, isMetallic: Bool) {
        assertUnimplemented()
    }
}
