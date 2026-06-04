public import CoreGraphics

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
public struct __CGContextComponent : Component {
    public init() {
        assertUnimplemented()
    }
    
    public typealias DrawHandler = (_ component: __CGContextComponent, _ context: CGContext) -> Void
    
    public mutating func setDrawHandler(_ drawHandler: __CGContextComponent.DrawHandler? = nil) {
        assertUnimplemented()
    }
    
    public typealias UpdateHandler = (_ component: __CGContextComponent) -> Void
    
    public mutating func setUpdateHandler(_ updateHandler: __CGContextComponent.UpdateHandler? = nil) {
        assertUnimplemented()
    }
    
    public mutating func setNeedsDisplay() {
        assertUnimplemented()
    }
    
    public var automaticMaterialUpdate: Bool
    
    public var size: CGSize
    
    @safe public static nonisolated(unsafe) let defaultMetersPerPoint: Double = {
        assertUnimplemented()
    }()
    
    public var rasterizationScale: CGFloat
    
    public enum RenderingMode : String {
        case texture
        case geometry
        case tiled
        
        public init?(rawValue: String) {
            assertUnimplemented()
        }
        
        @available(iOS 15.0, tvOS 26.0, macOS 12.0, macCatalyst 15.0, *)
        public typealias RawValue = String
        
        public var rawValue: String {
            get {
                assertUnimplemented()
            }
        }
    }
    
    public var renderingMode: __CGContextComponent.RenderingMode
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __CGContextComponent {
    public static func __fromCore(_ coreComponent: __ComponentRef) -> __CGContextComponent {
        assertUnimplemented()
    }
    
    public func __toCore(_ coreComponent: __ComponentRef) {
        assertUnimplemented()
    }
    
    public static var __coreComponentType: __ComponentTypeRef {
        get {
            assertUnimplemented()
        }
    }
}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __CGContextComponent.RenderingMode : Equatable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __CGContextComponent.RenderingMode : Hashable {}

@available(macOS 12.0, iOS 15.0, macCatalyst 15.0, tvOS 26.0, *)
extension __CGContextComponent.RenderingMode : RawRepresentable {}
