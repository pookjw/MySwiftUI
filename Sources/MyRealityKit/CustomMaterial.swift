public import UIKit

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.BaseColor {
    public init(tint: UIColor = .white, texture: CustomMaterial.Texture? = nil) {
        assertUnimplemented()
    }
    
    public var tint: UIColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
@available(visionOS, unavailable)
extension CustomMaterial.EmissiveColor {
    public init(color: UIColor = .black, texture: CustomMaterial.Texture? = nil) {
        assertUnimplemented()
    }
    
    public var color: UIColor {
        get {
            assertUnimplemented()
        }
        set {
            assertUnimplemented()
        }
    }
}
