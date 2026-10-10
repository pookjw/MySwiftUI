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
