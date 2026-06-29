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
        
        let entry: CUIDesignLibraryCacheKey.Entry
        do {
            let color = try CUIDesignLibrary.color(with: traits)
            let cgColor = color.cgColor
            let resoledHDR: Color.ResolvedHDR
            
            if let resolved = Color.Resolved(failableCGColor: cgColor) {
                var contentHeadroom: Float? = cgColor.contentHeadroom
                if contentHeadroom == 0 {
                    contentHeadroom = nil
                }
                
                resoledHDR = Color.ResolvedHDR(resolved, headroom: contentHeadroom)
            } else {
                resoledHDR = Color
                    .ResolvedHDR(
                        Color
                            .Resolved(
                                linearRed: 0,
                                linearGreen: 0,
                                linearBlue: 0,
                                opacity: 0
                            ),
                        headroom: nil
                    )
            }
            
            entry = CUIDesignLibraryCacheKey.Entry(
                color: resoledHDR,
                blendMode: BlendMode(color.blendMode)
            )
        } catch {
            Log.internalWarning("A color was requested from CoreUI but was not found. Returning clear color instead. - \(error)")
            
            entry = CUIDesignLibraryCacheKey.Entry(
                color: Color
                    .ResolvedHDR(
                        Color
                            .Resolved(
                                linearRed: 0,
                                linearGreen: 0,
                                linearBlue: 0,
                                opacity: 0
                            ),
                        headroom: nil
                    ),
                blendMode: .normal
            )
        }
        
        // <+828>
        CUIDesignLibraryCacheKey.cache.withLock { cache in
            cache[self] = entry
        }
        
        return entry
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
