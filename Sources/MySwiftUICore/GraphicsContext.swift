public import CoreGraphics

@frozen public struct GraphicsContext {
    @frozen public struct BlendMode: RawRepresentable, Equatable {
        public let rawValue: Int32
        
        @inlinable public init(rawValue: Swift.Int32) {
            self.rawValue = rawValue
        }
        
        @inlinable public static var normal: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.normal.rawValue)
            }
        }
        
        @inlinable public static var multiply: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.multiply.rawValue)
            }
        }
        
        @inlinable public static var screen: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.screen.rawValue)
            }
        }
        
        @inlinable public static var overlay: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.overlay.rawValue)
            }
        }
        
        @inlinable public static var darken: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.darken.rawValue)
            }
        }
        
        @inlinable public static var lighten: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.lighten.rawValue)
            }
        }
        
        @inlinable public static var colorDodge: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.colorDodge.rawValue)
            }
        }
        
        @inlinable public static var colorBurn: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.colorBurn.rawValue)
            }
        }
        
        @inlinable public static var softLight: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.softLight.rawValue)
            }
        }
        
        @inlinable public static var hardLight: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.hardLight.rawValue)
            }
        }
        
        @inlinable public static var difference: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.difference.rawValue)
            }
        }
        
        @inlinable public static var exclusion: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.exclusion.rawValue)
            }
        }
        
        @inlinable public static var hue: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.hue.rawValue)
            }
        }
        
        @inlinable public static var saturation: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.saturation.rawValue)
            }
        }
        
        @inlinable public static var color: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.color.rawValue)
            }
        }
        
        @inlinable public static var luminosity: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.luminosity.rawValue)
            }
        }
        
        @inlinable public static var clear: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.clear.rawValue)
            }
        }
        
        @inlinable public static var copy: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.copy.rawValue)
            }
        }
        
        @inlinable public static var sourceIn: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.sourceIn.rawValue)
            }
        }
        
        @inlinable public static var sourceOut: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.sourceOut.rawValue)
            }
        }
        
        @inlinable public static var sourceAtop: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.sourceAtop.rawValue)
            }
        }
        
        @inlinable public static var destinationOver: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationOver.rawValue)
            }
        }
        
        @inlinable public static var destinationIn: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationIn.rawValue)
            }
        }
        
        @inlinable public static var destinationOut: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationOut.rawValue)
            }
        }
        
        @inlinable public static var destinationAtop: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.destinationAtop.rawValue)
            }
        }
        
        @inlinable public static var xor: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.xor.rawValue)
            }
        }
        
        @inlinable public static var plusDarker: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.plusDarker.rawValue)
            }
        }
        
        @inlinable public static var plusLighter: GraphicsContext.BlendMode {
            get {
                self.init(rawValue: CGBlendMode.plusLighter.rawValue)
            }
        }
    }
}
