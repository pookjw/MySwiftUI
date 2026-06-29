// EBD1C829A869D5EC3C2FDA55F4467D9A
internal import CoreUI
private import Synchronization
private import CoreGraphics

struct CUIDesignLibraryCacheKey : Hashable, Sendable {
    fileprivate static let cache = Mutex<[CUIDesignLibraryCacheKey: CUIDesignLibraryCacheKey.Entry]>([:])
    
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
        if let cached = CUIDesignLibraryCacheKey.cache.withLock({ cache in
            return cache[self]
        }) {
            return cached
        }
        
        let traits = CUIDesignColorTraits(
            colorName: self.name,
            value0: 0,
            value1: 0,
            colorScheme: self.props.scheme == .dark ? .dark : .light,
            contrast: self.props.contrast == .increased ? .increased : .standard,
            styling: self.props.styling,
            gamut: self.cuiDisplayGamut,
            value2: 0
        )
        
        do {
            let color = try CUIDesignLibrary.color(with: traits)
            print(color.cgColor)
        } catch {
            Log.internalWarning("A color was requested from CoreUI but was not found. Returning clear color instead. - \(error)")
        }
        
        // <+828>
        assertUnimplemented()
    }
    
    var cuiDisplayGamut: CUIDisplayGamut {
        switch self.props.gamut {
        case .sGRB:
            return .SRGB
        case .displayP3:
            return .displayP3
        }
    }
}

extension CUIDesignLibraryCacheKey {
    struct Entry : Hashable, Sendable {
        var color: Color.ResolvedHDR
        var blendMode: BlendMode
        
        init(color: Color.ResolvedHDR, blendMode: BlendMode) {
            self.color = color
            self.blendMode = blendMode
        }
    }
    
    struct Props : Hashable, DerivedEnvironmentKey, Sendable {
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
