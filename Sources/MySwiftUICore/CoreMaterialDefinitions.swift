// 1136DDC987AEEDFF1217B91AA2732172
internal import CoreGraphics
private import Synchronization
private import Foundation
private import CoreMaterial

enum ContentStyle {}

extension ContentStyle {
    enum ID: Int8, CodableByProxy, ColorProvider, Serializable {
        case primary
        case secondary
        case tertiary
        case quaternary
        case quinary
        
        init(truncatingLevel: Int) {
            if truncatingLevel <= 4 {
                self.init(rawValue: Int8(truncatingIfNeeded: truncatingLevel))!
            } else {
                self = .quinary
            }
        }
        
        var level: Int {
            return Int(self.rawValue)
        }
        
        init?(level: Int) {
            guard let rawValue = Int8(exactly: level) else {
                return nil
            }
            
            self.init(rawValue: rawValue)
        }
        
        var tag: Color.ProviderTag {
            return ._contentStyle
        }
        
        func resolve(in environment: EnvironmentValues) -> Color.Resolved {
            assertUnimplemented()
        }
        
        func resolveHDR(in environment: EnvironmentValues) -> Color.ResolvedHDR {
            assertUnimplemented()
        }
        
        func apply(color: Color, to shape: inout _ShapeStyle_Shape) {
            assertUnimplemented()
        }
        
        var staticColor: CGColor? {
            assertUnimplemented()
        }
        
        var kitColor: AnyObject? {
            assertUnimplemented()
        }
        
        var colorDescription: String {
            assertUnimplemented()
        }
        
        func opacity(at: Int, environment: EnvironmentValues) -> Float {
            assertUnimplemented()
        }
        
        func serialize(to encoder: any Encoder) throws {
            assertUnimplemented()
        }
        
        static func deserialize(from decoder: any Decoder) throws -> ContentStyle.ID {
            assertUnimplemented()
        }
    }
    
    enum Primitive {
        case fill
        case stroke
        case separator
        case overlay
        case destructive
    }
    
    struct Style {
        private(set) var id: ContentStyle.ID
        private(set) var primitive: ContentStyle.Primitive
    }
    
    struct MaterialStyle : Hashable {
        static func == (lhs: ContentStyle.MaterialStyle, rhs: ContentStyle.MaterialStyle) -> Bool {
            assertUnimplemented()
        }
        
        private(set) var material: Material.ResolvedMaterial // 0x0
        private(set) var base: ContentStyle.Style // 0x11
        
        func resolveCoreMaterialColor(in environment: EnvironmentValues) -> Color.ResolvedHDR {
            guard environment.isVisionEnabled else {
                if self.material.flags.contains(.unknown0) {
                    return .white
                } else {
                    return .black
                }
            }
            
            // <+80>
            let color = environment.materialBaseColor ?? .white
            return color.resolveHDR(in: environment)
        }
        
        func hash(into hasher: inout Hasher) {
            assertUnimplemented()
        }
        
        fileprivate var coreMaterialDescription: [String: Any] {
            let recipe = self.material.coreMaterialRecipe
            
            let styleCategory: MTCoreMaterialVisualStyleCategory
            switch self.base.primitive {
            case .fill:
                styleCategory = .fill
            case .stroke:
                styleCategory = .stroke
            case .separator:
                styleCategory = .fill
            case .overlay:
                styleCategory = .overlay
            case .destructive:
                styleCategory = .stroke
            }
            
            let style = self.coreMaterialStyle
            let options = self.material.coreMaterialOptions
            
            guard var styling = MTVisualStylingCreateDictionaryRepresentation(recipe, styleCategory, style, options) else {
                return [:]
            }
            
            guard case .destructive = self.base.primitive else {
                return styling
            }
            
            guard
                let value_1 = styling["compositingFilter"],
                var compositingFilter = value_1 as? [String: Any],
                let value_2 = compositingFilter["inputAmount"],
                value_2 is CGFloat
            else {
                return styling
            }
            
            compositingFilter["inputAmount"] = CGFloat(0.65)
            styling["compositingFilter"] = compositingFilter
            
            return styling
        }
        
        fileprivate var coreMaterialStyle: MTCoreMaterialVisualStyle {
            let style: MTCoreMaterialVisualStyle
            switch self.base.primitive {
            case .fill:
                if self.material.flags.contains(.unknown9) {
                    style = .quaternary
                } else {
                    style = .tertiary
                }
            case .stroke:
                style = .quaternary
            case .separator:
                return .separator
            case .overlay:
                style = .quaternary
            case .destructive:
                style = .quaternary
            }
            
            switch self.base.id {
            case .primary:
                return .primary
            case .secondary:
                return .secondary
            case .tertiary:
                return .tertiary
            case .quaternary:
                return style
            case .quinary:
                return style
            }
        }
    }
    
    // nominal type descriptor가 없음
    struct MaterialResolved {
        let material: Material.ResolvedMaterial
        let id: ContentStyle.ID
        let primitive: ContentStyle.Primitive
    }
}

extension ContentStyle.MaterialResolved {
    @inline(always) // 원래 없음
    var effects: [DisplayList.Effect] {
        switch self.material.id {
        case .intelligenceLightSource_Unreactive, .intelligenceLightSource_AudioReactive:
            return []
        case .coreMaterial, .provider, .layers, .ultraThin, .thin, .regular, .thick, .ultraThick, .systemBars, .pinched, .selected, .disabled, .vibrantGlassContent, .darkerGlass, .lighterGlass, .ultraDarkerGlass:
            let style = ContentStyle.MaterialStyle(
                material: self.material,
                base: ContentStyle.Style(
                    id: self.id,
                    primitive: self.primitive
                )
            )
            
            return CoreMaterialCache.shared.withLock { cache in
                return cache[style]
            }
        }
    }
}

// nominal type descriptor가 없음
fileprivate struct CoreMaterialCache {
    static let shared = Mutex(CoreMaterialCache())
    
    static func parseColor(_ color: Any?) -> Color.ResolvedHDR? {
        guard
            let unwrapped = color,
            let casted = unwrapped as? [String: Any]
        else {
            return nil
        }
        
        guard
            let alphaValue = casted["alpha"],
            let alpha = alphaValue as? CGFloat
        else {
            return .white
        }
        
        let s8 = Float(alpha)
        
        if
            let whiteValue = casted["white"],
            let white = whiteValue as? CGFloat
        {
            var s9 = Float(white)
            var s0 = -s9
            var s1 = (s9 > 0) ? s9 : s0
            s0 = Float(bitPattern: 0x3d25aee6)
            
            if s1 <= s0 {
                // <+852>
                s0 = Float(bitPattern: 0x3d9e8391)
                s0 = s1 * s0
                // <+868>
            } else {
                s0 = 1
                
                if s1 == s0 {
                    // <+868>
                } else {
                    s0 = Float(bitPattern: 0x3f72a76f)
                    s0 = s1 * s0
                    s1 = Float(bitPattern: 0x3d55891a)
                    s0 = s0 + s1
                    s1 = Float(bitPattern: 0x4019999a)
                    s0 = powf(s0, s1)
                    // <+868>
                }
                
                // <+868>
            }
            
            // <+868>
            s1 = -s0
            s0 = (s9 > 0) ? s0 : s1
            s9 = s0
            s1 = s0
            
            return Color.ResolvedHDR(
                Color.Resolved(
                    linearRed: s1,
                    linearGreen: s9,
                    linearBlue: s0,
                    opacity: s8
                ),
                headroom: nil
            )
        } else if
            let redValue = casted["red"],
            let d9 = redValue as? CGFloat,
            let greenValue = casted["green"],
            var d10 = greenValue as? CGFloat,
            let blueValue = casted["blue"],
            var d2 = blueValue as? CGFloat
        {
            var s1 = Float(d9)
            var s9 = Float(d10)
            var s0 = -s1
            var s3 = (s1 > 0) ? s1 : s0
            s0 = Float(bitPattern: 0x3d25aee6)
            
            if s3 <= s0 {
                // <+892>
                s0 = Float(bitPattern: 0x3d9e8391)
                s0 = s3 * s0
                // <+908>
            } else {
                s0 = 1
                
                if s3 == s0 {
                    // <+908>
                } else {
                    s0 = Float(bitPattern: 0x3f72a76f)
                    s0 = s3 * s0
                    s3 = Float(bitPattern: 0x3d55891a)
                    s0 = s0 + s3
                    let sp0x4 = s1
                    d10 = d2
                    s1 = Float(bitPattern: 0x4019999a)
                    s0 = powf(s0, s1)
                    d2 = d10
                    s1 = sp0x4
                    // <+908>
                }
            }
            
            // <+908>
            let s10 = Float(d2)
            s3 = -s0
            s1 = (s1 > 0) ? s0 : s3
            s0 = -s9
            s3 = (s9 > 0) ? s9 : s0
            s0 = Float(bitPattern: 0x3d25aee6)
            
            if s3 <= s0 {
                // <+1028>
                s0 = Float(bitPattern: 0x3d9e8391)
                s0 = s3 * s0
                // <+1044>
            } else {
                s0 = 1
                
                if s3 == s0 {
                    // <+1044>
                } else {
                    s0 = Float(bitPattern: 0x3f72a76f)
                    s0 = s3 * s0
                    s3 = Float(bitPattern: 0x3d55891a)
                    s0 = s0 + s3
                    let sp0x4 = s1
                    s1 = Float(bitPattern: 0x4019999a)
                    s0 = powf(s0, s1)
                    s1 = sp0x4
                    // <+1044>
                }
            }
            
            // <+1044>
            s3 = -s0
            s9 = (s9 > 0) ? s0 : s3
            s0 = -s10
            s3 = (s10 > 0) ? s10 : s0
            s0 = Float(bitPattern: 0x3d25aee6)
            
            if s3 <= s0 {
                // <+1160>
                s0 = Float(bitPattern: 0x3d9e8391)
                s0 = s3 * s0
                // <+1176>
            } else {
                s0 = 1
                
                if s3 == s0 {
                    // <+1176>
                } else {
                    s0 = Float(bitPattern: 0x3f72a76f)
                    s0 = s3 * s0
                    s3 = Float(bitPattern: 0x3d55891a)
                    s0 = s0 + s3
                    let sp0x4 = s1
                    s1 = Float(bitPattern: 0x4019999a)
                    s0 = powf(s0, s1)
                    s1 = sp0x4
                    // <+1176>
                }
            }
            
            // <+1176>
            s3 = -s0
            s0 = (s10 > 0) ? s0 : s3
            
            // <+416>
            return Color.ResolvedHDR(
                Color.Resolved(
                    linearRed: s1,
                    linearGreen: s9,
                    linearBlue: s0,
                    opacity: s8
                ),
                headroom: nil
            )
        } else {
            var resolved = Color.ResolvedHDR.white
            resolved.opacity = s8
            return resolved
        }
    }
    
    private var layers: [Material.ResolvedMaterial: [Material.Layer]] = [:]
    private var effects: [ContentStyle.MaterialStyle: [DisplayList.Effect]] = [:]
    
    private init() {}
    
    subscript(material: Material.ResolvedMaterial) -> [Material.Layer] {
        mutating get {
            if let existing = self.layers[material] {
                return existing
            }
            
            // <+104>
            let layers = self.load(material: material)
            self.layers[material] = layers
            
            return layers
        }
    }
    
    subscript(style: ContentStyle.MaterialStyle) -> [DisplayList.Effect] {
        mutating get {
            if let existing = self.effects[style] {
                return existing
            }
            
            // <+124>
            let effects = self.loadEffects(style: style)
            self.effects[style] = effects
            
            return effects
        }
    }
    
    private func loadEffects(style: ContentStyle.MaterialStyle) -> [DisplayList.Effect] {
        let description = style.coreMaterialDescription
        
        let blendModeffect = self.loadBlendModeEffect(description)
        var effects: [DisplayList.Effect] = []
        
        if let blendModeffect {
            effects.append(blendModeffect)
        }
        
        if let tintAlphaEffect = self.loadTintAlphaEffect(description) {
            effects.append(tintAlphaEffect)
        }
        
        // <+344>
        // sp + 0xc
        var flag_1: Bool
        var colorMatrix = _ColorMatrix(
            row1: (0, 0, 0, 0, 0),
            row2: (0, 0, 0, 0, 0),
            row3: (0, 0, 0, 0, 0),
            row4: (0, 0, 0, 0, 0)
        )
        
        if
            let value = description["filters"],
            let filters = value as? [[String: Any]]
        {
            flag_1 = true
            
            for filter in filters {
                guard
                    let type = filter["type"],
                    let castedType = type as? String,
                    castedType == "vibrantColorMatrix",
                    let inputColorMatrix = filter["inputColorMatrix"],
                    let castedInput = inputColorMatrix as? NSValue
                else {
                    continue
                }
                
                // sp + 0x188
                var matrix = _ColorMatrix()
                
                withUnsafeMutablePointer(to: &matrix) { pointer in
                    unsafe castedInput.getValue(UnsafeMutableRawPointer(pointer))
                }
                
                if flag_1 {
                    // <+1000>
                    colorMatrix = matrix
                } else {
                    // <+1084>
                    colorMatrix = matrix * colorMatrix
                }
                
                // <+1228>
                flag_1 = false
            }
            
            // <+1248>
        } else {
            flag_1 = true
        }
        
        // <+1292>
        let flag_2: Bool
        var color: Color.ResolvedHDR
        
        let parsedColor: Color.ResolvedHDR?
        if
            let value = description["tintColor"],
            let color = CoreMaterialCache.parseColor(value)
        {
            parsedColor = color
        } else {
            parsedColor = nil
        }
        
        if let parsedColor {
            flag_2 = (parsedColor == .white)
            color = flag_2 ? Color.ResolvedHDR(Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 0), headroom: 0) : parsedColor
        } else {
            flag_2 = true
            color = Color.ResolvedHDR(Color.Resolved(linearRed: 0, linearGreen: 0, linearBlue: 0, opacity: 0), headroom: 0)
        }
        
        if flag_1 {
            // <+1508>
            if flag_2 {
                return effects
            } else {
                // <+1512>
                if (color.base.linearRed == 1) && (color.base.linearGreen == 1) && (color.base.linearBlue == 1) {
                    if color.base.opacity == 1 {
                        // noop
                    } else {
                        effects.append(.opacity(color.base.opacity))
                    }
                } else {
                    // <+1932>
                    effects.append(.filter(.colorMultiply(color)))
                }
            }
        } else {
            // <+1692>
            effects.append(
                .filter(
                    .vibrantColorMatrix(
                        GraphicsFilter.VibrantColorMatrix(
                            matrix: colorMatrix,
                            maxColorComponent: .infinity,
                            options: []
                        )
                    )
                )
            )
        }
        
        return effects
    }
    
    private func loadBlendModeEffect(_ options: [String: Any]) -> DisplayList.Effect? {
        guard !options.isEmpty else {
            return nil
        }
        
        let dictionary: [String: Any]
        
        let type: String
        if
            let value = options["compositingFilter"],
            let compositingFilter = value as? String
        {
            type = compositingFilter
            dictionary = [:]
        } else if
            let value_1 = options["compositingFilter"],
            let compositingFilter = value_1 as? [String: Any],
            let value = compositingFilter["type"],
            let _type = value as? String
        {
            type = _type
            dictionary = compositingFilter
        } else {
            return nil
        }
        
        if "subtractSIgnoreAlpha" == type {
            // <+408>
            return .blendMode(.subtractSIgnoreAlpha)
        } else if "plusDIgnoreAlpha" == type {
            return .blendMode(.plusDIgnoreAlpha)
        } else if "plusLIgnoreAlpha" == type {
            return .blendMode(.plusLIgnoreAlpha)
        } else if
            "plusLIgnoreAlphaSourceOverBlend" == type,
            let value = dictionary["inputAmount"],
            let inputAmount = value as? Double
        {
            // <+888>
            return .blendMode(.plusLIgnoreAlphaSourceOver(inputAmount))
        } else {
            return nil
        }
    }
    
    private func loadTintAlphaEffect(_ options: [String: Any]) -> DisplayList.Effect? {
        guard
            let value = options["tintAlpha"],
            let tintAlpha = value as? Float,
            tintAlpha != 1
        else {
            return nil
        }
        
        return .opacity(tintAlpha)
    }
    
    private func load(material: Material.ResolvedMaterial) -> [Material.Layer] {
        assertUnimplemented()
    }
}

extension Material.ResolvedMaterial {
    fileprivate var coreMaterialRecipe: MTCoreMaterialRecipe {
        switch self.id {
        case .coreMaterial(let light, let dark, _):
            if self.flags.contains(.unknown0) {
                return MTCoreMaterialRecipe(rawValue: dark)
            } else {
                return MTCoreMaterialRecipe(rawValue: light)
            }
        case .provider, .layers:
            // <+428>
            fatalError("unexpected material ID type")
        case .ultraThin:
            // <+200>
            if self.flags.contains(.unknown0) {
                return .platformContentUltraThinDark
            } else {
                return .platformContentUltraThinLight
            }
        case .thin:
            // <+216>
            if self.flags.contains(.unknown0) {
                return .platformContentThinDark
            } else {
                return .platformContentThinLight
            }
        case .regular:
            // <+172>
            if self.flags.contains(.unknown0) {
                return .platformContentDark
            } else {
                return .platformContentLight
            }
        case .thick, .ultraThick:
            // <+72>
            if self.flags.contains(.unknown0) {
                return .platformContentThickDark
            } else {
                return .platformContentThickLight
            }
        case .systemBars:
            // <+352>
            if self.flags.contains(.unknown0) {
                return .platformChromeDark
            } else {
                return .platformChromeLight
            }
        case .intelligenceLightSource_Unreactive, .intelligenceLightSource_AudioReactive:
            // <+500>
            fatalError("invalid material")
        case .pinched:
            // <+244>
            return MTCoreMaterialRecipe(rawValue: "platformPinched")
        case .selected:
            // <+188>
            return MTCoreMaterialRecipe(rawValue: "platformSelected")
        case .disabled:
            // <+316>
            return MTCoreMaterialRecipe(rawValue: "platformDisabled")
        case .vibrantGlassContent:
            // <+144>
            return MTCoreMaterialRecipe(rawValue: "platformContentGlass")
        case .darkerGlass:
            // <+280>
            return MTCoreMaterialRecipe(rawValue: "platformContentGlassDarker")
        case .lighterGlass:
            // <+96>
            return MTCoreMaterialRecipe(rawValue: "platformContentGlassLighter")
        case .ultraDarkerGlass:
            // <+116>
            return MTCoreMaterialRecipe(rawValue: "platformContentGlassUltraDarker")
        }
    }
    
    fileprivate var coreMaterialOptions: [String: Any] {
        var options: [String: Any] = Dictionary(
            dictionaryLiteral: (kMTDictionaryRepresentationOptionsIncludeOptimizationsKey, true),
            (kMTDictionaryRepresentationOptionsReduceTransparencyKey, self.flags.contains(.unknown1))
        )
        
        // <+224>
        if case .coreMaterial(_, _, let bundle) = self.id {
            if let bundle {
                options[kMTDictionaryRepresentationOptionsBundleKey] = bundle
            } else {
                options.removeValue(forKey: kMTDictionaryRepresentationOptionsBundleKey)
            }
        }
        
        // <+428>
        options["MTDictionaryRepresentationOptionsFiltersRepresentationV2Key"] = true
        
        return options
    }
}
