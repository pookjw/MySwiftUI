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
            value0: self.props.gamut != .sGRB ? 1 : 0,
            value1: 0,
            colorName: self.name,
            value3: 0,
            value4: 0,
            value5: self.props.scheme == .dark ? 1 : 0,
            value6: self.props.contrast == .increased ? 1 : 0,
            styling: self.props.styling
        )
        
        do {
            let color = try CUIDesignLibrary.color(with: traits)
//            color.cgColor
        } catch {
            Log.internalWarning("A color was requested from CoreUI but was not found. Returning clear color instead. - \(error)")
        }
        
        // <+828>
        assertUnimplemented()
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
