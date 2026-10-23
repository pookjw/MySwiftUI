// 241B1548FB48B9561AEF74EC402F6941

extension MySwiftUICore::_ShapeStyle_Shape {
    // 원래 없음
    @inline(always)
    func resolveStyle(level: Int, material: Material, color: Color) -> _ShapeStyle_Pack.Style {
        return self.resolveStyle(id: ContentStyle.ID(truncatingLevel: level), material: material, color: color)
    }
    
    fileprivate func resolveStyle(id: ContentStyle.ID, material: Material, color: Color) -> _ShapeStyle_Pack.Style {
        // w28
        let primitive: ContentStyle.Primitive
        if color == ._destructive {
            primitive = .destructive
        } else {
            switch self.role {
            case .fill:
                primitive = .fill
            case .stroke:
                primitive = .stroke
            case .separator:
                primitive = .separator
            }
        }
        
        // <+128>
        // x25/w22
        var materialID = material.id
        // w27
        var flags = material.flags
        // w26
        var styleID: ContentStyle.ID?
        
        if let provider = self.environment.materialProvider(for: material) {
            // <+160>
            let context = Material.Context(environment: self.environment)
            let layers = provider.resolveLayers(in: context)
            materialID = .layers(layers)
            styleID = nil
        } else {
            // <+460>
            flags.formUnion(Material.ResolvedMaterial.Flags(environment: self.environment))
            styleID = nil
            
            if self.environment.isVisionEnabled {
                // <+596>
                switch materialID {
                case .coreMaterial, .provider, .layers, .systemBars, .intelligenceLightSource_Unreactive, .intelligenceLightSource_AudioReactive, .vibrantGlassContent:
                    break
                case .ultraThin, .thin, .regular, .thick, .ultraThick, .pinched, .selected, .disabled, .darkerGlass, .lighterGlass, .ultraDarkerGlass:
                    // <+624>
                    styleID = self.environment.backgroundContentStyleID
                }
            } else {
                // <+316>
            }
        }
        
        return _ShapeStyle_Pack.Style(
            .foregroundMaterial(
                color.resolveHDR(in: self.environment),
                ContentStyle.MaterialResolved(
                    material: Material.ResolvedMaterial(
                        id: materialID,
                        flags: flags,
                        styieID: styleID
                    ),
                    id: id,
                    primitive: primitive
                )
            )
        )
    }
}
