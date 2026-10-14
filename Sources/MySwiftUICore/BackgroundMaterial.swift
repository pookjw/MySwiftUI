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
    struct ResolvedMaterial : Hashable {
        private(set) var id: Material.ID // 0x0
        private(set) var flags: Material.ResolvedMaterial.Flags // 0xc
        var styieID: ContentStyle.ID? // 0x10
        
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
    struct Flags : OptionSet, Hashable {
        static var unknown0: Material.ResolvedMaterial.Flags {
            return Material.ResolvedMaterial.Flags(rawValue: 1 << 0)
        }
        
        static var unknown1: Material.ResolvedMaterial.Flags {
            return Material.ResolvedMaterial.Flags(rawValue: 1 << 1)
        }
        
        static var unknown2: Material.ResolvedMaterial.Flags {
            return Material.ResolvedMaterial.Flags(rawValue: 1 << 2)
        }
        
        static var unknown8: Material.ResolvedMaterial.Flags {
            return Material.ResolvedMaterial.Flags(rawValue: 1 << 8)
        }
        
        static var unknown9: Material.ResolvedMaterial.Flags {
            return Material.ResolvedMaterial.Flags(rawValue: 1 << 9)
        }
        
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
            
            var w8: Material.ResolvedMaterial.Flags = (colorScheme == .dark) ? [.unknown0] : []
            let w9: Material.ResolvedMaterial.Flags = (colorScheme == .dark) ? [.unknown0, .unknown2] : [.unknown2]
            var w22 = (colorSchemeContrast == .increased) ? w9 : w8
            
            if isVisionEnabled {
                // <+228>
                w22.formUnion(.unknown9)
            }
            
            // <+260>
            let isBackgroundOpaque = environment.isBackgroundOpaque
            w8 = w22.union(.unknown8)
            let w0 = isBackgroundOpaque ? w8 : w22
            
            self = w0
        }
    }
}

extension EnvironmentValues {
    var backgroundContentStyleID: ContentStyle.ID? {
        assertUnimplemented()
    }
}
