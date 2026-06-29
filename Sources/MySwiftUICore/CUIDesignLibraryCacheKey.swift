internal import CoreUI

struct CUIDesignLibraryCacheKey : Hashable {
    var name: CUIColorName
    var props: CUIDesignLibraryCacheKey.Props
    
    init(name: CUIColorName, in environment: EnvironmentValues, allowsBlendMode: Bool = true) {
        self.name = name
        self.props = environment[CUIDesignLibraryCacheKey.Props.self]
        
        if !allowsBlendMode && self.props.styling == .unknown1 {
            self.props.styling = .unknown2
        }
    }
    
    func fetch() -> CUIDesignLibraryCacheKey.Entry {
        assertUnimplemented()
    }
}

extension CUIDesignLibraryCacheKey {
    struct Entry : Hashable {
        var color: Color.ResolvedHDR
        var blendMode: BlendMode
        
        init(color: Color.ResolvedHDR, blendMode: BlendMode) {
            self.color = color
            self.blendMode = blendMode
        }
    }
    
    struct Props : Hashable, DerivedEnvironmentKey {
        var scheme: ColorScheme
        var contrast: ColorSchemeContrast
        var gamut: DisplayGamut
        var styling: CUIDesignStyling
        
        static func value(in environment: EnvironmentValues) -> CUIDesignLibraryCacheKey.Props {
            let scheme = environment.colorScheme
            let contrast = environment.colorSchemeContrast
            let gamut = environment.displayGamut
            let styling: CUIDesignStyling
            
            if environment.backgroundMaterial == nil {
                styling = .unknown0
            } else {
                styling = environment.allowsVibrantBlending ? .unknown1 : .unknown2
            }
            
            return CUIDesignLibraryCacheKey.Props(
                scheme: scheme,
                contrast: contrast,
                gamut: gamut,
                styling: styling
            )
        }
    }
}
