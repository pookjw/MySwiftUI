// B2CCB444DA7C00CFB13A219298A4122C

extension EnvironmentValues {
    public var backgroundMaterial: Material? {
        get {
            return self[BackgroundMaterialKey.self]
        }
        set {
            self[BackgroundMaterialKey.self] = newValue
        }
    }
}

fileprivate struct BackgroundMaterialKey : EnvironmentKey {
    static var defaultValue: Material? {
        return nil
    }
}

extension MySwiftUICore::_ShapeStyle_Shape {
    // 원래 없음
    @inline(always)
    func resolveStyle(level: Int, material: Material) -> _ShapeStyle_Pack.Style {
        return self.resolveStyle(id: ContentStyle.ID(truncatingLevel: level), material: material)
    }
    
    fileprivate func resolveStyle(id: ContentStyle.ID, material: Material) -> _ShapeStyle_Pack.Style {
        /*
         id -> x0 -> w25
         material -> x1 -> x23/w24/w27
         */
        var resolved: Material.ResolvedMaterial
        if let provider = self.environment.materialProvider(for: material) {
            // <+112>
            var context = Material.Context(environment: self.environment)
            context.substrate = self.substrate
            
            let layers = provider.resolveLayers(in: context)
            resolved = Material.ResolvedMaterial(
                id: .layers(layers),
                flags: material.flags,
                styieID: nil
            )
        } else {
            // <+272>
            let flags = Material
                .ResolvedMaterial
                .Flags(environment: self.environment)
                .union(material.flags)
            
            resolved = Material.ResolvedMaterial(
                id: material.id,
                flags: flags,
                styieID: nil
            )
            
            if resolved.prefersRenderingBackgroundWithStyle(in: self.environment) {
                resolved.styieID = self.environment.backgroundContentStyleID
            }
        }
        
        // <+396>
        let primitive: ContentStyle.Primitive
        switch self.role {
        case .fill:
            primitive = .fill
        case .stroke:
            primitive = .stroke
        case .separator:
            primitive = .separator
        }
        
        let style = ContentStyle.MaterialStyle(
            material: resolved,
            base: ContentStyle.Style(id: id, primitive: primitive)
        )
        
        let color = style.resolveCoreMaterialColor(in: self.environment)
        
        return _ShapeStyle_Pack.Style(
            .foregroundMaterial(
                color,
                ContentStyle.MaterialResolved(
                    material: resolved,
                    id: id,
                    primitive: primitive
                )
            )
        )
    }
}

extension Material {
    struct ResolvedMaterial {
        private(set) var id: Material.ID
        private(set) var flags: Material.ResolvedMaterial.Flags
        var styieID: ContentStyle.ID?
        
        fileprivate func prefersRenderingBackgroundWithStyle(in environment: EnvironmentValues) -> Bool {
            guard environment.isVisionEnabled else {
                return false
            }
            
            switch self.id {
            case .coreMaterial(_, _, _):
                return false
            case .provider(_):
                return false
            case .layers(_):
                return false
            case .ultraThin:
                return true
            case .thin:
                return true
            case .regular:
                return true
            case .thick:
                return true
            case .ultraThick:
                return true
            case .systemBars:
                return false
            case .intelligenceLightSource_Unreactive:
                return false
            case .intelligenceLightSource_AudioReactive:
                return false
            case .pinched:
                return true
            case .selected:
                return true
            case .disabled:
                return true
            case .vibrantGlassContent:
                return false
            case .darkerGlass:
                return true
            case .lighterGlass:
                return true
            case .ultraDarkerGlass:
                return true
            }
        }
    }
}

extension Material.ResolvedMaterial {
    struct Flags : OptionSet {
        let rawValue: UInt32
        
        init(rawValue: UInt32) {
            self.rawValue = rawValue
        }
        
        init(environment: EnvironmentValues) {
            // w22
            let colorScheme = environment.colorScheme
            // w23
            let colorSchemeContrast = environment.colorSchemeContrast
            // w20
            let isVisionEnabled = environment.isVisionEnabled
            
            var w8: UInt32 = (colorScheme == .dark) ? 1 : 0
            let w9: UInt32 = (colorScheme == .dark) ? 5 : 4
            var w22 = (colorSchemeContrast == .increased) ? w9 : w8
            
            if isVisionEnabled {
                // <+228>
                w22 |= 512
            }
            
            // <+260>
            let isBackgroundOpaque = environment.isBackgroundOpaque
            w8 = w22 | 256
            let w0 = isBackgroundOpaque ? w8 : w22
            
            self.rawValue = w0
        }
    }
}
